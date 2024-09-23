package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.service.AdminBoardService;

@Controller
@Qualifier("ABC")
public class AdminBoardController {
	
	@Autowired
	AdminBoardService service;
	
	
	@RequestMapping("/admin/board/list")
	public String boardlist(HttpSession session,Model model,HttpServletResponse response, HttpServletRequest request) {
		return service.boardlist(session,model,response,request);
	}
	
	@RequestMapping("/admin/board/readnum")
	public String boardreadnum(HttpServletRequest request,HttpSession session) {
		return service.boardreadnum(request,session);
	}
	
	@RequestMapping("/admin/board/content")
	public String boardcontent(HttpServletRequest request, Model model, HttpSession session) {
		return service.boardcontent(request, model, session);
	}
	
	@RequestMapping("/admin/board/delete")
	public String boarddelete(HttpServletRequest request,HttpSession session) {
		return service.boarddelete(request,session);
	}
	
	
	
}
