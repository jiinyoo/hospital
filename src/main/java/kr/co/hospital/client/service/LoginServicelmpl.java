package kr.co.hospital.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
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
	public String loginOk(UserDto udto,HttpSession session,HttpServletRequest request)
	{
		String user_name=mapper.loginOk(udto);
		String menu=request.getParameter("menu");
		System.out.println(menu);
		if(user_name!=null)
		{
			System.out.println("로그인 성공");
			session.setAttribute("user_id",udto.getUser_id());
			session.setAttribute("user_name",user_name);
			String userid = udto.getUser_id();
			if(mapper.getState(userid)==2) 
			{
				return "redirect:/admin/main/index";
			} 
			else 
			{
				//게시판을 보려다가 로그인했으면 진료 후기 게시판으로 바로 로그인 되게 하는 것
				if(menu.equals("board")){
					System.out.println("일로 빠지는 거 맞아?");
					return "/client/board/list";
					
				}else {
					System.out.println("아니면 else문으로 빠져?");
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
        return "redirect:/client/main/index";
   }

}
