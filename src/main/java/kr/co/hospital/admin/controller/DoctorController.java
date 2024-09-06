package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.admin.dto.WorkdayDto;
import kr.co.hospital.admin.service.DoctorService;

@Controller
public class DoctorController {

	@Autowired
	@Qualifier("doc")
	DoctorService service;
	
	@RequestMapping("/admin/doctor/doctor")
	public String doctor(HttpServletRequest request,Model model,HttpSession session) {
		return service.doctor(request,model,session);
	}
	
	@RequestMapping("/admin/doctor/view")
	public String view(HttpServletRequest request, Model model,HttpSession session) {
		return service.view(request,model,session);
	}
	
	@RequestMapping("/admin/doctor/addDoctor")
	public String addDoctor(HttpSession session,Model model) {
		return service.addDoctor(session,model);
	}
	
	@RequestMapping("/admin/doctor/addDoctorOk")
	public String addDoctorOk(DoctorDto ddto,MultipartHttpServletRequest request, WorkdayDto wdto) throws Exception {
		return service.addDoctorOk(ddto,request,wdto);
	}
	
	@RequestMapping("/admin/doctor/upDoctor")
	public String upDoctor(Model model, HttpSession session,HttpServletResponse response) {
		return service.upDoctor(model,session,response);
	}
	
	@RequestMapping("/admin/doctor/upDoctorOk")
	public String upDoctorOk(DoctorDto ddto,MultipartHttpServletRequest request,WorkdayDto wdto) throws Exception {
		return service.upDoctorOk(ddto,request,wdto);
	}
}
