package kr.co.hospital.client.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.BoardDto;
import kr.co.hospital.client.mapper.BoardMapper;

@Service
@Qualifier("cbc")
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardMapper mapper;

	@Override
	public String boardwrite(HttpSession session,Model model) {
		if(session.getAttribute("user_id")!=null)
		{
			String user_id=session.getAttribute("user_id").toString();
			System.out.println(user_id);
			model.addAttribute("user_id",user_id);
			return "/client/board/write";
		}else{
			return "redirect:main/login";
		}
		
		
	}

	@Override
	public String boardlist(HttpSession session, Model model, HttpServletResponse response) {
		if(session.getAttribute("user_id")!=null)
		{
	
			String user_id=session.getAttribute("user_id").toString();
			
			
			ArrayList<HashMap> map=mapper.boardlist();    
			model.addAttribute("bmapAll",map);
			
			
			return "/client/board/list";
	
			
		}else {
			
			Cookie cookie = new Cookie("url", "/boardlist");
			cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 기간 (초 단위) - 여기서는 1일
			cookie.setPath("/");
			response.addCookie(cookie);
			
			return "redirect:main/login";
		}
		
	}

	@Override
	public void boardinsert(BoardDto bdto) {
		mapper.boardinsert(bdto);
		
	}

}