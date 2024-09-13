package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;
import kr.co.hospital.client.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	@Qualifier("log")
	private LoginService service;
	
	@RequestMapping("/main/login")
	public String login(HttpServletRequest request,
			Model model)
	{
		return service.login(request,model);
	}
	
	@RequestMapping("/main/loginOk")
	public String loginOk(UserDto udto,
			HttpSession session, HttpServletRequest request, HttpServletResponse response)
	{
		return service.loginOk(udto,session,request,response);
	}
	
	@RequestMapping("/main/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}
	
	 @GetMapping("/main/idSearch")
	 public String idSearchPage() {
	    return "client/login/idSearch";
     }

	 @PostMapping("/main/idSearch")
	 public String idSearch(HttpServletRequest request, Model model) {
	    return service.idSearch(request, model);
	 }

	 @GetMapping("/main/pwdSearch")
	 public String pwdSearchPage() {
	    return "client/login/pwdSearch";
	 }

	 @PostMapping("/main/pwdSearch")
	 public String pwdSearch(HttpServletRequest request, Model model) {
	    return service.pwdSearch(request, model);
	 }

}
