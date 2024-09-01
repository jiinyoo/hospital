package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.service.BoardService;

@Controller
@Qualifier("cbc")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/boardwrite")
	public String boardlist(HttpSession session,Model model) {
		return service.boardwrite(session,model);
	}

}
