package kr.co.hospital.admin.service;

import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
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
		String fname=file.getOriginalFilename();
		String str=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString()+"/"+fname;
		
		str=FileUtils.getFileName(fname, str);
		String saveFname=str.substring(str.lastIndexOf("/")+1);
		
		Path path=Paths.get(str);
		ddto.setDoc_img(saveFname);
		
		mapper.addDoctorOk(ddto);
		
		return "redirect:/admin/";
	}
	
	
}
