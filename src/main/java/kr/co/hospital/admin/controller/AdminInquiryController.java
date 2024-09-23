package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.AdminInquiryDto;
import kr.co.hospital.admin.service.AdminInquiryService;
import kr.co.hospital.client.dto.InquiryDto;


@Controller
@Qualifier("AISI")
public class AdminInquiryController {
	
	@Autowired
	AdminInquiryService service;

	@RequestMapping("/admin/inquiry/list")
	public String inquirylist(HttpSession session,Model model,HttpServletResponse response, HttpServletRequest request) {
		return service.inquirylist(session,model,response,request);
	}
	
	@RequestMapping("/admin/inquiry/readnum") 
	public String inquiryreadnum(HttpServletRequest request,HttpSession session) {
		return service.readnum(request,session); 
	}
	
	@RequestMapping("/admin/inquiry/write")
	public String inquirywrite(HttpServletRequest request,HttpSession session, Model model) {
		return service.write(request,session,model);
	}
	
	@RequestMapping("/admin/inquiry/writeOk")
	public String inquirywriteOk(AdminInquiryDto aidto, MultipartHttpServletRequest multi, HttpSession session) throws Exception {
		return service.writeOk(aidto,multi,session);
	}
	@RequestMapping("/admin/inquiry/content") 
	public String inquirycontent(HttpServletRequest request,Model model,HttpSession session) {
		return service.content(request, model,session); 
	}
	
	@RequestMapping("/admin/inquiry/delete") 
	public String inquirydelete(HttpServletRequest request, HttpSession session) throws Exception{
		return service.delete(request, session);
	}
	@RequestMapping("/admin/inquiry/update") 
	public String inquiryupdate(HttpServletRequest request,HttpSession session,Model model) throws Exception{
		return service.update(request,session,model); 
	}
	
	@RequestMapping("/admin/inquiry/updateOk") 
	public String inquiryupdateOk(InquiryDto idto,HttpServletRequest request,HttpSession session,MultipartHttpServletRequest multi) throws Exception{
		return service.updateOk(idto,request,session,multi); 
	}
}
