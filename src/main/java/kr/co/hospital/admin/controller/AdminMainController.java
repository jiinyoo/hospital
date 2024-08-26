package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.webservices.client.HttpWebServiceMessageSenderBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.admin.service.AdminMainService;

@Controller
public class AdminMainController {

	@Autowired
	@Qualifier("adm")
	AdminMainService service;
	
	@RequestMapping("/admin/")
	public String home() {
		return service.adminmain();
	}
	
	@RequestMapping("/admin/main/index")
	public String index() {
		return "/admin/main/index";
	}
}
