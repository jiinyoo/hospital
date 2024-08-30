package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hospital.admin.dto.UserDto;
import kr.co.hospital.admin.service.UserService;

@Controller
public class UserController {
	@Autowired
	@Qualifier("use")
	private UserService service;
	
	@RequestMapping("/admin/user")
	public String user()
	{
		return service.user();
	}
	@RequestMapping("/admin/userOk")
	public String userOk(UserDto udto)
	{
		return service.userOk(udto);
	}
	
	/*@RequestMapping("/admin/user/useridCheck")
	public String useridCheck()
*/
}
