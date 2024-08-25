package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.admin.service.AdminMainService;

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
	
}
