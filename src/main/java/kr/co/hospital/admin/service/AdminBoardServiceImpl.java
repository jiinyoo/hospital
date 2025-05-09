package kr.co.hospital.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.mapper.AdminBoardMapper;
import kr.co.hospital.admin.dto.AdminBoardDto;

@Service
@Qualifier("ABC")
public class AdminBoardServiceImpl implements AdminBoardService{
	
	@Autowired
	AdminBoardMapper mapper;

	@Override
	public String boardlist(HttpSession session, Model model, HttpServletResponse response,
			HttpServletRequest request) {
			String user_id = null;
			if (session.getAttribute("user_id") != null) {
				user_id = session.getAttribute("user_id").toString();
				int state=mapper.getState(user_id);
				if(state==2) {
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
					return "/admin/board/list";
					
				}else {
					return "redirect:/main/index";
				}
				
			}else {
				return "redirect:/main/index";
			}
			
	}
	
	
	
	
	
	
	
	

	@Override
	public String boardcontent(HttpServletRequest request, Model model, HttpSession session) {
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			int state=mapper.getState(user_id);
			if(state==2) {
				int board_id=Integer.parseInt(request.getParameter("board_id"));
				AdminBoardDto bdto = mapper.boardcontent(board_id);
				model.addAttribute("bdto", bdto);
				model.addAttribute("user_id", user_id);
				return "/admin/board/content";
				
			}else {
				return "redirect:/main/index";
			}
			
		}else {
			return "redirect:/main/index";
		}
	}









	@Override
	public String boardreadnum(HttpServletRequest request, HttpSession session) {
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			int state=mapper.getState(user_id);
			if(state==2) {
				int board_id=Integer.parseInt(request.getParameter("board_id"));
				mapper.boardReadnum(board_id);
				return "redirect:/admin/board/content?board_id=" + board_id;
				
			}else {
				return "redirect:/main/index";
			}
			
		}else {
			return "redirect:/main/index";
		}
	}




	@Override
	public String boarddelete(HttpServletRequest request,HttpSession session) {
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = session.getAttribute("user_id").toString();
			int state=mapper.getState(user_id);
			if(state==2) {
				int board_id=Integer.parseInt(request.getParameter("board_id"));
				mapper.boarddelete(board_id);
				return "redirect:/admin/board/list";
			}else {
				return "redirect:/main/index";
			}
			
		}else {
			return "redirect:/main/index";
		}
	}



}
