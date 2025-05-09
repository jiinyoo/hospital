package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.webservices.client.HttpWebServiceMessageSenderBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.admin.service.AdminMainService;

@Controller
public class AdminMainController {

	@Autowired
	@Qualifier("adm")
	AdminMainService service;
	
	@RequestMapping("/admin/")
	public String home(HttpSession session) {
		return "redirect:/admin/main/index";
	}
	
	@RequestMapping("/admin/main/index")
	public String index(HttpSession session) {
		return service.adminmain(session);
	}
	
	@RequestMapping("/admin/main/hospital")
	public String hospital()
	{
		return "/admin/main/hospital";
	}

	
}
