package kr.co.hospital.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;
import kr.co.hospital.client.mapper.LoginMapper;

@Service
@Qualifier("log")
public class LoginServicelmpl implements LoginService {
	
	@Autowired
	private LoginMapper mapper;
	
	@Override
	public String login(HttpServletRequest request,Model model)
	{
		String err=request.getParameter("err");
		String menu=request.getParameter("menu");
		model.addAttribute("menu",menu);
		model.addAttribute("err",err);
		return "/client/login/login";
	}
	
	@Override
	public String loginOk(UserDto udto,HttpSession session,HttpServletRequest request, HttpServletResponse response)
	{
		String user_name=mapper.loginOk(udto);
		String menu=request.getParameter("menu");
		System.out.println(menu);
		if(user_name!=null)
		{
			System.out.println("로그인 성공");
			session.setAttribute("user_id",udto.getUser_id());
			String userid = udto.getUser_id();
			if(mapper.getState(userid)==2) 
			{
				return "redirect:/admin/main/index";
			} 
			else 
			{
				//게시판을 보려다가 로그인했으면 진료 후기 게시판으로 바로 로그인 되게 하는 것
				Cookie cookie=WebUtils.getCookie(request, "url");
				String url=null;
				if(cookie!=null)
				{
					url=cookie.getValue();
					cookie.setMaxAge(0); // 쿠키 유효 기간 (초 단위) - 여기서는 1일
					cookie.setPath("/");
					response.addCookie(cookie);
					return "redirect:"+url;
				}else {
					return "redirect:/main/index";				
				}				
			}
			
		}
		else
		{
			System.out.println("로그인실패");
			return "redirect:/main/login?err=1";
		}
	}
	@Override
    public String logout(HttpSession session)
   {
	    session.invalidate();
        return "redirect:/main/index";
   }

}
