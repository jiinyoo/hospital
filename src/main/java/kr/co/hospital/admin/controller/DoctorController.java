package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.admin.service.DoctorService;

@Controller
public class DoctorController {

	@Autowired
	@Qualifier("doc")
	DoctorService service;
	
	@RequestMapping("/admin/doctor/doctor")
	public String doctor(HttpServletRequest request,Model model) {
		return service.doctor(request,model);
	}
	
	@RequestMapping("/admin/doctor/view")
	public String view(HttpServletRequest request, Model model) {
		return service.view(request,model);
	}
}
