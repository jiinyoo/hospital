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
	
	@RequestMapping("/main/notice_write")
	public String notice_write(HttpSession session,
			Model model)
	{
		return service.notice_write(session,model);
	}
	
	@RequestMapping("/main/notice_writeOk")
	public String notice_writeOk(NoticeDto ndto,
			HttpSession session,
			MultipartHttpServletRequest multi) throws Exception
	{
		return service.notice_writeOk(ndto,session,multi);
	}
	
	
	@RequestMapping("/main/notice_list")
	public String notice_list(HttpServletRequest request,
			Model model,
			HttpSession session, 
			HttpServletResponse response)
	{
		return service.notice_list(request,model,session,response);
	}
	
	@RequestMapping("/main/notice_readnum")
	public String notice_readnum(HttpServletRequest request)
	{
		return service.notice_readnum(request);
	}
	
	@RequestMapping("/main/notice_content")
	public String notice_content(HttpServletRequest request,
			HttpSession session, 
			Model model)
	{
		String notice_id = request.getParameter("notice_id");

	    // 디버깅 로그 추가: notice_id 값 확인
	    System.out.println("notice_id: " + notice_id);

	    // notice_id가 null이거나 비어있을 경우 처리
	    if (notice_id == null || notice_id.isEmpty()) {
	        System.err.println("notice_id가 null이거나 비어 있습니다.");
	        return "redirect:/error_page";  // 에러 페이지로 리다이렉트
	    }
		
		return service.notice_content(request,session,model);
	}
	
	@RequestMapping("/main/notice_update")
	public String notice_update(HttpServletRequest request,
			Model model,HttpSession session)
	{
		return service.notice_update(request, model,session);
	}
	
	@RequestMapping("/main/notice_updateOk")
	public String notice_updateOk(NoticeDto ndto,
			HttpServletRequest request, 
			MultipartHttpServletRequest multi,
			HttpSession session) throws Exception 
	{
		return service.notice_updateOk(ndto,request,multi,session);
	
	}
	
	@RequestMapping("/main/notice_delete")
	public String notice_delete(HttpServletRequest request)
	{
		return service.notice_delete(request);
	}

}
