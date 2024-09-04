package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.BoardDto;

public interface BoardService {

	String boardwrite(HttpSession session,Model model);

	String boardlist(HttpSession session, Model model,HttpServletResponse response);

	void boardinsert(BoardDto bdto);

}
