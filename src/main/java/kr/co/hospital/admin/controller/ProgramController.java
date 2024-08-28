package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.service.ProgramService;

@Controller
public class ProgramController {
	
	@Autowired
	@Qualifier("pc")
	ProgramService service;
	
	@RequestMapping("/admin/program/program")
	public String program(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.program(request,model,session);
		
	}
	
	
	@RequestMapping("/admin/program/programwrite")
	public String programwrite(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.programwrite(request,model,session);
		
	}
	
	
	

}
