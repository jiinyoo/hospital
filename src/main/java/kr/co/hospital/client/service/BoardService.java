package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.BoardDto;

public interface BoardService {
	String boardwrite(HttpSession session,Model model);
	String boardlist(HttpSession session, Model model,HttpServletResponse response, HttpServletRequest request);
	void boardinsert(BoardDto bdto);
	String boardreadnum(HttpServletRequest request);
	String boardcontent(HttpServletRequest request, Model model, HttpSession session);
	String boarddelete(HttpServletRequest request);
	String boardupdate(HttpServletRequest request, Model model);
	void boardupdateOk(BoardDto bdto, HttpServletRequest request);
	
}
