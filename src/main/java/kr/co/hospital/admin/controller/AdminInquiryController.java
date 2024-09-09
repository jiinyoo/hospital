package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.service.AdminInquiryService;

@Controller
@Qualifier("AISI")
public class AdminInquiryController {
	
	@Autowired
	AdminInquiryService service;

	@RequestMapping("/admin/inquiry/list")
	public String inquirylist(HttpSession session,Model model,HttpServletResponse response) {
		return service.inquirylist(session,model,response);
	}
	
}
