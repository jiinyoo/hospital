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
	
	@RequestMapping("/inquiry/write")
	public String inquirywrite() {
		return "/client/inquiry/write";
	}
	
	@RequestMapping("/inquiry/writeOk")
	public String inquirywriteOk(InquiryDto idto, MultipartHttpServletRequest multi, HttpSession session) throws Exception {
		return service.writeOk(idto,multi,session);
	}
	
	@RequestMapping("/inquiry/list")
	public String inquirylist(HttpSession session,Model model,HttpServletResponse response)  {
		return service.list(session, model,response);
	}
	
	
	@RequestMapping("/inquiry/readnum") 
	public String inquiryreadnum(HttpServletRequest request,HttpSession session) {
		return service.readnum(request); 
	}
}
