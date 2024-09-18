package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
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
	public String programwrite()
	{
		return service.programwrite();
		
	}
	
	@RequestMapping("/admin/program/programwriteOk")
	public String programwriteOk(ProgramDto pdto,MultipartHttpServletRequest multi,HttpServletRequest request, Model model, HttpSession session) throws Exception
	{
		return service.programwriteOk(pdto,multi,request,model,session);
		
	}
	
	
	@RequestMapping("/admin/program/programdelete")
	public String programdelete(HttpServletRequest request) throws Exception
	{
		return service.programdelete(request);
		
	}
	
	@RequestMapping("/admin/program/programupdate")
	public String programupdate(HttpServletRequest request,Model model)
	{
		return service.programupdate(request,model);
	}
	
	
	@RequestMapping("/admin/program/programupdateOk")
	public String programupdateOk(MultipartHttpServletRequest multi,ProgramDto pdto,HttpServletRequest request,Model model,HttpSession session) throws Exception
	{
		return service.programupdateOk(multi,pdto,request,model,session);
	}
	
	@RequestMapping("/admin/program/programreservemanage")
	public String programreservemanage(HttpServletRequest request,Model model,HttpSession session) throws Exception
	{
		return service.programreservemanage(request,model,session);
	}
	
	@RequestMapping("/admin/program/chgstate")
	public ResponseEntity<String> chagestate(HttpServletRequest request,HttpSession session) throws Exception
	{
		return service.programchgstate(request,session);
	}
	
	@RequestMapping("/admin/program/preserveuserdelete")
	public String preserveuserdelete(HttpServletRequest request,HttpSession session)
	{
		return service.programuserdelete(request,session);
	}
	

}
