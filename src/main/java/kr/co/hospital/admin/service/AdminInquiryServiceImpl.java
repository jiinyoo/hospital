package kr.co.hospital.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.mapper.AdminInquiryMapper;

@Service
@Qualifier("AISI")
public class AdminInquiryServiceImpl implements AdminInquiryService {
	
	@Autowired
	AdminInquiryMapper mapper;

	@Override
	public String inquirylist(HttpSession session, Model model, HttpServletResponse response) {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			String state=mapper.getState(session_user_id);
			session_user_id=session.getAttribute("user_id").toString();
			ArrayList<HashMap> imapAll=mapper.inquirylist();
			model.addAttribute("imapAll",imapAll);
			model.addAttribute("session_user_id",session_user_id);
			return "/client/inquiry/list";
		}else {
			Cookie cookie=new Cookie("url","/inquiry/list");
			cookie.setMaxAge(60*60*24);
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/main/login";
		}
	}

}
