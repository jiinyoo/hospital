package kr.co.hospital.admin.service;

import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalTime;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.admin.dto.WorkdayDto;
import kr.co.hospital.admin.mapper.DoctorMapper;
import kr.co.hospital.util.FileUtils;

@Service
@Qualifier("doc")
public class DoctorServiceImpl implements DoctorService {

	@Autowired
	private DoctorMapper mapper;
	
	@Override
	public String doctor(HttpServletRequest request,Model model,HttpSession session) {
		if(session.getAttribute("user_id")==null) {
			return "redirect:/main/index";
		} else if(mapper.getState(session.getAttribute("user_id").toString())==0) {
			return "redirect:/main/index";
		} else {
			String doc_part = request.getParameter("doc_part");
			model.addAttribute("doctorList",mapper.doctor(doc_part));
			return "/admin/doctor/doctor";			
		}
	}

	@Override
	public String view(HttpServletRequest request, Model model,HttpSession session) {
		
		if(session.getAttribute("user_id")==null) {
			return "redirect:/main/index";
		} else if(mapper.getState(session.getAttribute("user_id").toString())==0) {
			return "redirect:/main/index";
		} else {
			String doc_id=request.getParameter("doc_id");
			DoctorDto ddto=mapper.view(doc_id);
			String[] history=ddto.getDoc_history().split("/");
			model.addAttribute("doctor", ddto);
			model.addAttribute("history",history);
			return "/admin/doctor/view";
		}
	}

	@Override
	public String addDoctor(HttpSession session,Model model) {
		if(session.getAttribute("user_id")==null) {
			return "redirect:/main/index";
		} else {
			String userid=session.getAttribute("user_id").toString();
			if(mapper.getState(userid)==0) {
				return "redirect:/main/index";
			} else {
				if(mapper.isDoctor(userid)) {
					return "redirect:/admin/doctor/upDoctor";
				}
				model.addAttribute("user",mapper.getName(userid));
				return "admin/doctor/addDoctor";
			}
		}
	}

	@Override
	public String addDoctorOk(DoctorDto ddto,MultipartHttpServletRequest request,WorkdayDto wdto) throws Exception {
		MultipartFile file=request.getFile("file");
		if(!file.isEmpty()) {
			String fname=file.getOriginalFilename();
			String str=ResourceUtils.getFile("classpath:static/admin/doctor").toPath().toString()+"/"+fname;
			
			str=FileUtils.getFileName1(fname, str);
			String saveFname=str.substring(str.lastIndexOf("/")+1);
			
			Path path=Paths.get(str);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			
			ddto.setDoc_img(saveFname);
			
		}
		
		mapper.addDoctorOk(ddto);
		int doc_id=mapper.getDocid(ddto.getDoc_userid());
		wdto.setDoc_id(doc_id);
		String[] dayofweeks = wdto.getDayofweeks();
		System.out.println(dayofweeks);
        int[] startTimes = wdto.getStart_times();
        int[] endTimes = wdto.getEnd_times();
		
		for(int i=0;i<wdto.getStart_times().length;i++) {
			wdto.setDayofweek(dayofweeks[i]);
			LocalTime starttime=LocalTime.parse(String.format("%02d", startTimes[i]) +":00");
			LocalTime endtime=LocalTime.parse(String.format("%02d", endTimes[i])+":00");
			
			wdto.setStart_time(starttime);
			wdto.setEnd_time(endtime);
			mapper.addWorkday(wdto);
		}
		
		return "redirect:/admin/";
	}

	@Override
	public String upDoctor(Model model, HttpSession session,HttpServletResponse response) {
		if(session.getAttribute("user_id")==null) {
			Cookie url=new Cookie("url", "admin/doctor/upDoctor");
			url.setMaxAge(500);
			url.setPath("/");
			response.addCookie(url);
			return "redirect:/main/login";
		} else {
			String userid=session.getAttribute("user_id").toString();
			if(mapper.isDoctor(userid)) {
				DoctorDto ddto=mapper.upDoctor(userid);
				ddto.setHistorys(ddto.getDoc_history().split("/"));
				model.addAttribute("ddto",ddto);
				String[] phone=ddto.getDoc_phone().split("-");
				ArrayList<WorkdayDto> wdto=mapper.getWorkday(ddto.getDoc_id());
				model.addAttribute("phone",phone);
				model.addAttribute("wdto",wdto);
				return "/admin/doctor/upDoctor";
			}
			return "redirect:/admin/doctor/addDoctor";
		}
	}

	@Override
	public String upDoctorOk(DoctorDto ddto,MultipartHttpServletRequest request,WorkdayDto wdto) throws Exception {
		MultipartFile file=request.getFile("file");

		if(!file.isEmpty()) {
			String fname=file.getOriginalFilename();
			String str=ResourceUtils.getFile("classpath:static/admin/doctor").toPath().toString()+"/"+fname;
			str=FileUtils.getFileName1(fname, str);
			String saveFname=str.substring(str.lastIndexOf("/")+1);
			
			Path path=Paths.get(str);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			
			str=ResourceUtils.getFile("classpath:static/admin/doctor").toPath().toString()+"/"+mapper.getDocimg(ddto.getDoc_userid());
			path=Paths.get(str);
			if(Files.exists(path)) {
				Files.delete(path);
			}
			
			ddto.setDoc_img(saveFname);
		} else {
			ddto.setDoc_img(mapper.getDocimg(ddto.getDoc_userid()));
			
		}
		mapper.upDoctorOk(ddto);
		int doc_id=mapper.getDocid(ddto.getDoc_userid());
		mapper.delWorkday(doc_id);
		int[] start=wdto.getStart_times();
		int[] end=wdto.getEnd_times();
		String[] dayofweek=wdto.getDayofweeks();
		wdto.setDoc_id(doc_id);
		if(start!=null) {
			for(int i=0;i<start.length;i++) {
				String stime=String.format("%02d", start[i]);
				String etime=String.format("%02d", end[i]);
				LocalTime starttime=LocalTime.parse(stime+":00");
				LocalTime endtime=LocalTime.parse(etime+":00");
				wdto.setStart_time(starttime);
				wdto.setEnd_time(endtime);
				wdto.setDayofweek(dayofweek[i]);
				mapper.addWorkday(wdto);
			}			
		}
		
	
		return "redirect:/admin/";
	}
}
