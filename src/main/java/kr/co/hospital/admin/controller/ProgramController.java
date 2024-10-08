package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.ProgramDto;
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
	
	@RequestMapping("/admin/program/programwriteOk")
	public String programwriteOk(ProgramDto pdto,MultipartHttpServletRequest multi,HttpServletRequest request, Model model, HttpSession session) throws Exception
	{
		return service.programwriteOk(pdto,multi,request,model,session);
		
	}
	
	

}
