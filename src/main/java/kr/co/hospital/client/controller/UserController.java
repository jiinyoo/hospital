package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.client.dto.UserDto;
import kr.co.hospital.client.service.UserService;

@Controller
public class UserController {
	@Autowired
	@Qualifier("use")
	private UserService service;
	
	@RequestMapping("/main/user")
	public String user()
	{
		return service.user();
	}
	@RequestMapping("/main/userOk")
	public String userOk(UserDto udto)
	{
		return service.userOk(udto);
	}
	
	@RequestMapping("/main/useridCheck")
	public @ResponseBody String useridCheck(HttpServletRequest request)
	{
		String user_id=request.getParameter("user_id");
		return service.useridCheck(user_id);
	}

}
