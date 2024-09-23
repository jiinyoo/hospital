package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface AdminBoardService {

	String boardlist(HttpSession session, Model model, HttpServletResponse response, HttpServletRequest request);
	String boardcontent(HttpServletRequest request, Model model, HttpSession session);
	String boardreadnum(HttpServletRequest request, HttpSession session);
	String boarddelete(HttpServletRequest request, HttpSession session);

}
