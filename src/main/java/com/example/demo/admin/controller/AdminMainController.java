package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.webservices.client.HttpWebServiceMessageSenderBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.admin.dto.DoctorDto;
import com.example.demo.admin.service.AdminMainService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminMainController {

	@Autowired
	@Qualifier("adm")
	AdminMainService service;
	
	@RequestMapping("/admin/")
	public String home()
	{
		return service.adminmain();
	}
	
	@RequestMapping("/admin/index")
	public String index() {
		return "/admin/index";
	}
	@RequestMapping("/admin/doctor")
	public String doctor(HttpServletRequest request,Model model) {
		return service.doctor(request,model);
	}
	
	@RequestMapping("/admin/view")
	public String view(HttpServletRequest request, Model model) {
		return service.view(request,model);
	}
	
}
