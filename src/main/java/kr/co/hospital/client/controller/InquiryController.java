package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.InquiryDto;
import kr.co.hospital.client.service.InquiryService; 


@Controller
@Qualifier("ISI")
public class InquiryController {
	
	@Autowired
	InquiryService service;
	
	@RequestMapping("/main/inquirywrite")
	public String inquirywrite() {
		return "/client/inquiry/write";
	}
	
	@RequestMapping("/main/inquirywriteOk")
	public String inquirywriteOk(InquiryDto idto, MultipartHttpServletRequest multi, HttpSession session) throws Exception {
		return service.writeOk(idto,multi,session);
	}
	
	@RequestMapping("/main/inquirylist")
	public String inquirylist(HttpSession session,Model model,HttpServletResponse response, HttpServletRequest request)  {
		return service.list(session, model,response,request);
	}
	@RequestMapping("/main/inquiryreadnum") 
	public String inquiryreadnum(HttpServletRequest request,HttpSession session) {
		return service.readnum(request); 
	}
	@RequestMapping("/main/inquirycontent") 
	public String inquirycontent(HttpServletRequest request,Model model,HttpSession session) {
		return service.content(request, model,session); 
	}
	
	@RequestMapping("/main/inquiryupdate") 
	public String inquiryupdate(HttpServletRequest request,HttpSession session,Model model) throws Exception{
		return service.update(request,session,model); 
	}
	

	@RequestMapping("/main/inquirydelete") 
	public String inquirydelte(HttpServletRequest request, HttpSession session) throws Exception{
		return service.delete(request,session); 
	}
	
	
	@RequestMapping("/main/inquiryupdateOk") 
	public String inquiryupdateOk(InquiryDto idto,HttpServletRequest request,HttpSession session,MultipartHttpServletRequest multi) throws Exception{
		return service.updateOk(idto,request,session,multi); 
	}
}