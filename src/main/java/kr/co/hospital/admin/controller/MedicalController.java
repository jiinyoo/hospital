package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.MedicalDto;
import kr.co.hospital.admin.service.MedicalService;

@Controller
public class MedicalController {

	@Autowired
	@Qualifier("medi")
	private MedicalService service;
	
	@RequestMapping("/admin/medical/afterMedi")
	public String afterMedi(Model model,HttpServletRequest request,HttpSession session,
			HttpServletResponse response) {
		return service.afterMedi(model, request, session,response);
	}
	
	@RequestMapping("/admin/medical/afterMediView")
	public String mediView(HttpServletRequest request,Model model,HttpSession session,
			HttpServletResponse response) {
		return service.afterMediView(request,model,session,response);
	}
	
	@RequestMapping("/admin/medical/patient")
	public String patient(HttpSession session,Model model,HttpServletRequest request) {
		return service.patient(session,model,request);
	}
	
	@RequestMapping("/admin/medical/patientView")
	public String patientView(HttpServletRequest request,
			HttpSession session, Model model) {
		return service.patientView(request,session,model);
	}
	
	@RequestMapping("/admin/medical/medicalOk")
	public String medicalOk(HttpServletRequest request,MedicalDto mdto,
			HttpSession session) {
		return service.medicalOk(request,mdto,session);
	}
}
