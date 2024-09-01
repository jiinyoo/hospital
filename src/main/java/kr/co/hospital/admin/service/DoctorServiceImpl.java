package kr.co.hospital.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.admin.mapper.DoctorMapper;

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
	public String addDoctor(HttpSession session) {
		String userid=session.getAttribute("user_id").toString();
		if(session.getAttribute("user_id")==null) {
			return "redirect:/main/index";
		} else if(mapper.getState(userid)==0) {
			return "redirect:/main/index";
		} else if(mapper.getState(userid)==1) {
			
		}
		return null;
	}
}
