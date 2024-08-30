package kr.co.hospital.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.UserDto;
import kr.co.hospital.admin.mapper.LoginMapper;

@Service
@Qualifier("log")
public class LoginServicelmpl implements LoginService {
	@Autowired
	
	private LoginMapper mapper;
	@Override
	public String login(HttpServletRequest request,Model model)
	{
		String err=request.getParameter("err");
		model.addAttribute("err",err);
		return "/admin/login/login";
	}
	@Override
	public String loginOk(UserDto udto,HttpSession session)
	{
		String user_name=mapper.loginOk(udto);
		if(user_name!=null)
		{
			session.setAttribute("user_id",udto.getUser_id());
			session.setAttribute("user_name",user_name);
			return "redirect:/admin";
		}
		else
		{
			return "redirect:/admin/login";
		}
	}
	@Override
    public String logout(HttpSession session)
   {
	    session.invalidate();
        return "redirect:/admin/main/index";
   }

}
