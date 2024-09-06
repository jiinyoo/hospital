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
import kr.co.hospital.admin.service.AdminMainService;
import kr.co.hospital.client.dto.NoticeDto;
import kr.co.hospital.client.mapper.NoticeMapper;

@Service
@Qualifier("noti")
public class NoticeServicelmpl  implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public String notice_write(HttpSession session, Model model)
	{
		if(session.getAttribute("user_id")!=null)
		{
			String user_id=session.getAttribute("user_id").toString();
			model.addAttribute("user_id",user_id);
			return "/client/notice/notice_write";
		}
		else
		{
			return "redirect:/main/login";
		}
	}
	
	@Override
	public String notice_writeOk(NoticeDto ndto)
	{
		mapper.notice_writeOk(ndto);
		return "redirect:/notice/notice_list";
	}

	@Override
	public String notice_list(Model model,
			HttpSession session, 
			HttpServletResponse response) 
	{
		if(session.getAttribute("user_id")!=null)
		{
			String user_id=session.getAttribute("user_id").toString();
			ArrayList<HashMap> map=mapper.notice_list();
		
			model.addAttribute("nmapAll",map);
		
			return "/client/notice/notice_list";
		}	
		else
		{
			Cookie cookie = new Cookie("url", "/notice_list");
			cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 기간 (초 단위) - 여기서는 1일
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/main/login";
		}
	}

}
