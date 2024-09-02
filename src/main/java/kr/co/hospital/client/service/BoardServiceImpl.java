package kr.co.hospital.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.mapper.BoardMapper;

@Service
@Qualifier("cbc")
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardMapper mapper;

	@Override
	public String boardwrite(HttpSession session,Model model) {
		// TODO Auto-generated method stub
	
		if(session.getAttribute("user_id")!=null)
		{
			String user_id=session.getAttribute("user_id").toString();
			System.out.println(user_id);
			model.addAttribute("user_id",user_id);
			return "/client/board/write";
			
		}else {
			
			return "redirect:main/login?menu=board";
		}
		
	}

}
