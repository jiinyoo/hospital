package kr.co.hospital.client.controller;

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
import kr.co.hospital.client.dto.NoticeDto;
import kr.co.hospital.client.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	@Qualifier("noti")
	NoticeService service;
	
	@RequestMapping("/notice_write")
	public String notice_write(HttpSession session,
			Model model)
	{
		return service.notice_write(session,model);
	}
	
	@RequestMapping("/notice_writeOk")
	public String notice_writeOk(NoticeDto ndto,
			HttpSession session,
			MultipartHttpServletRequest multi) throws Exception
	{
		return service.notice_writeOk(ndto,session,multi);
	}
	
	
	@RequestMapping("/notice_list")
	public String notice_list(Model model,
			HttpSession session, 
			HttpServletResponse response)
	{
		return service.notice_list(model,session,response);
	}
	
	@RequestMapping("/notice_readnum")
	public String notice_readnum(HttpServletRequest request)
	{
		return service.notice_readnum(request);
	}
	
	@RequestMapping("/notice_content")
	public String notice_content(HttpServletRequest request,
			HttpSession session, 
			Model model)
	{
		return service.notice_content(request,session,model);
	}
	
	@RequestMapping("/notice_update")
	public String notice_update(HttpServletRequest request,
			Model model)
	{
		return service.notice_update(request, model);
	}
	
	@RequestMapping("/notice_updateOk")
	public String notice_updateOk(NoticeDto ndto,
			HttpServletRequest request)
	{
		return service.notice_updateOk(ndto,request);
	}
	
	@RequestMapping("/notice_delete")
	public String notice_delete(HttpServletRequest request)
	{
		return service.notice_delete(request);
	}

}
