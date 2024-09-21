package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.AdminNoticeDto;
import kr.co.hospital.admin.service.AdminNoticeService;


@Controller
public class AdminNoticeController {
	
	@Autowired
	@Qualifier("admin_noti")
	AdminNoticeService service;
	
	@RequestMapping("/admin/admin_notice/admin_notice_write")
	public String admin_notice_write(HttpSession session,
			Model model)
	{
		return service.admin_notice_write(session,model);
	}
	
	@RequestMapping("/admin/admin_notice/admin_notice_writeOk")
	public String admin_notice_writeOk(AdminNoticeDto ndto,
			HttpSession session,
			MultipartHttpServletRequest multi) throws Exception
	{
		return service.admin_notice_writeOk(ndto,session,multi);
	}
	
	
	@RequestMapping("admin/admin_notice/admin_notice_list")
	public String admin_notice_list(HttpServletRequest request,
			Model model,
			HttpSession session, 
			HttpServletResponse response)
	{
		return service.admin_notice_list(request,model,session,response);
	}
	
	@RequestMapping("/admin/admin_notice/admin_notice_readnum")
	public String admin_notice_readnum(HttpServletRequest request)
	{
		return service.admin_notice_readnum(request);
	}
	
	@RequestMapping("/admin/admin_notice/admin_notice_content")
	public String admin_notice_content(HttpServletRequest request,
			HttpSession session, 
			Model model)
	{
		String notice_id = request.getParameter("notice_id");
		
		return service.admin_notice_content(request,session,model);
	}
	
	@RequestMapping("/admin/admin_notice/admin_notice_update")
	public String admin_notice_update(HttpServletRequest request,
			Model model,HttpSession session)
	{
		return service.admin_notice_update(request, model,session);
	}
	
	@RequestMapping("/admin/admin_notice/admin_notice_updateOk")
	public String admin_notice_updateOk(AdminNoticeDto ndto,
			HttpServletRequest request, 
			MultipartHttpServletRequest multi,
			HttpSession session) throws Exception 
	{
		return service.admin_notice_updateOk(ndto,request,multi,session);
	
	}
	
	@RequestMapping("/admin/admin_notice/admin_notice_delete")
	public String admin_notice_delete(HttpServletRequest request)
	{
		return service.admin_notice_delete(request);
	}

}
