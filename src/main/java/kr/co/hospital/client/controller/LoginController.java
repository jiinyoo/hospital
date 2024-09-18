package kr.co.hospital.client.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	    public String sendVerificationCode(@RequestParam("user_id") String user_id,
	                                       @RequestParam("user_email") String user_email,
	                                       HttpServletRequest request,
	                                       Model model) {
	        // 인증번호 생성 및 이메일 전송
	        return service.pwdSearch(request, model);
	    }

	    // 인증번호 검증
	    @PostMapping("/main/verifyCode")
	    public String verifyCode(@RequestParam("verification_code") String inputCode,
	                             HttpServletRequest request, Model model) {
	        return service.verifyCode(request, model);
	    }
	    
	    @RequestMapping("/main/changePwd")
	    public String changePwd(HttpServletRequest request,Model model)
	    {
	    	return service.changePwd(request, model);
	    }
}
