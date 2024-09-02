package kr.co.hospital.client.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
			return "redirect:main/login?menu=board";
		}
		
		
	}

	@Override
	public String boardlist(HttpSession session, Model model) {
		if(session.getAttribute("user_id")!=null)
		{
	
			String user_id=session.getAttribute("user_id").toString();
			
			
			ArrayList<HashMap> map=mapper.boardlist();
			System.out.println("boardlist"+map.get(0).get("user_id"));      
			model.addAttribute("bmapAll",map);
			return "client/board/list";
	
			
		}else {
			//로그인이 안되 있다면 cookie에 이걸 가져가
			//cookie에 url이라는 키에다가 저 주소를 저장했어
			//그러면 로그인 페이지로 감
			
			
			return "redirect:main/login?menu=board";
		}
		
	}

	@Override
	public void boardinsert(BoardDto bdto) {
		mapper.boardinsert(bdto);
		
	}

}
