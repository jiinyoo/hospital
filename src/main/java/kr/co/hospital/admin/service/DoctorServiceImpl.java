package kr.co.hospital.admin.service;

import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

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
		String userid=session.getAttribute("user_id").toString();
		if(session.getAttribute("user_id")==null || mapper.getState(userid)==0) {
			return "redirect:/main/index";
		} else if(mapper.getState(userid)!=0 && !mapper.isDoctor(userid)) {
			model.addAttribute("user", mapper.getName(userid));
			return "admin/doctor/addDoctor";
		} else {
			return "redirect:/admin/doctor/upDoctor";
		}
	}

	@Override
	public String addDoctorOk(DoctorDto ddto,MultipartHttpServletRequest request) throws Exception {
		MultipartFile file=request.getFile("file");
		if(!file.isEmpty()) {
			String fname=file.getOriginalFilename();
			String str=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString()+"/"+fname;
			
			str=FileUtils.getFileName(fname, str);
			String saveFname=str.substring(str.lastIndexOf("/")+1);
			
			Path path=Paths.get(str);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			
			ddto.setDoc_img(saveFname);
			
		}
		mapper.addDoctorOk(ddto);
		
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
				return "/admin/doctor/upDoctor";
			}
			return "redirect:/admin/doctor/addDoctor";
		}
	}

	@Override
	public String upDoctorOk(DoctorDto ddto,MultipartHttpServletRequest request) throws Exception {
		MultipartFile file=request.getFile("file");

		if(!file.isEmpty()) {
			String fname=file.getOriginalFilename();
			String str=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString()+"/"+fname;
			str=FileUtils.getFileName(fname, str);
			String saveFname=str.substring(str.lastIndexOf("/")+1);
			
			Path path=Paths.get(str);
			Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			
			str=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString()+"/"+mapper.getDocimg(ddto.getDoc_userid());
			path=Paths.get(str);
			if(Files.exists(path)) {
				Files.delete(path);
			}
			
			ddto.setDoc_img(saveFname);
		} else {
			ddto.setDoc_img(mapper.getDocimg(ddto.getDoc_userid())); 
		}
		mapper.upDoctorOk(ddto);
		return null;
	}
}
