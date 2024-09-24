package kr.co.hospital.client.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
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
	public String boardwrite(HttpSession session, Model model) {
		if (session.getAttribute("user_id") != null) {
			String user_id = session.getAttribute("user_id").toString();
			System.out.println(user_id);
			model.addAttribute("user_id", user_id);
			return "/client/board/write";
		} else {
			return "redirect:/main/login";
		}

	}

	@Override
	public String boardlist(HttpSession session, Model model, HttpServletResponse response,
			HttpServletRequest request) {

		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
		}
		int page=request.getParameter("page")!=null?Integer.parseInt(request.getParameter("page")):1;
		String stype=request.getParameter("stype")!=null?request.getParameter("stype"):"user_id";
		String sword=request.getParameter("sword")!=null?request.getParameter("sword"):"";
		int index=(page-1)*10;
		int pstart=page/10;
		if(page%10==0) {
			pstart=pstart-1;
		}
		pstart=(pstart*10)+1;
		int pend=pstart+9;
		
		int chong=mapper.getChong(stype,sword);
		
		if(pend>chong) {
			
			pend=chong;
		}
		ArrayList<HashMap> map = mapper.boardlist(index,stype,sword);
		model.addAttribute("bmapAll", map);
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("stype",stype);
		model.addAttribute("sword",sword);
		return "/client/board/list";

	}

	@Override
	public void boardinsert(BoardDto bdto) {
		mapper.boardinsert(bdto);
	}

	@Override
	public String boardreadnum(HttpServletRequest request) {
		String board_id = request.getParameter("board_id");
		mapper.boardReadnum(board_id);
		return "redirect:/main/boardcontent?board_id=" + board_id;
	}

	@Override
	public String boardcontent(HttpServletRequest request, Model model, HttpSession session) {
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();

		}
		String board_id = request.getParameter("board_id");
		BoardDto bdto = mapper.boardcontent(board_id);
		model.addAttribute("bdto", bdto);
		model.addAttribute("user_id", user_id);
		return "/client/board/content";
	}

	@Override
	public String boarddelete(HttpServletRequest request) {
		String board_id = request.getParameter("board_id");
		String user_id = request.getParameter("user_id");
		mapper.boarddelete(board_id, user_id);
		return "redirect:/main/boardlist";
	}

	@Override
	public String boardupdate(HttpServletRequest request, Model model) {
		String board_id = request.getParameter("board_id");
		String user_id = request.getParameter("user_id");
		BoardDto bdto = mapper.boardcontent(board_id);
		model.addAttribute("bdto", bdto);
		return "/client/board/update";
	}

	@Override
	public void boardupdateOk(BoardDto bdto, HttpServletRequest request) {
		String board_id = request.getParameter("board_id");
		mapper.boardupdateOk(bdto);
	}
}
