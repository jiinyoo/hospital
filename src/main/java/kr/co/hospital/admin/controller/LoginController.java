package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.UserDto;
import kr.co.hospital.admin.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	@Qualifier("log")
	private LoginService service;
	
	@RequestMapping("/admin/login")
	public String login(HttpServletRequest request,
			Model model)
	{
		return service.login(request,model);
	}
	
	@RequestMapping("/admin/loginOk")
	public String loginOk(UserDto udto,
			HttpSession session)
	{
		return service.loginOk(udto,session);
	}
	
	@RequestMapping("/admin/login/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}

}
