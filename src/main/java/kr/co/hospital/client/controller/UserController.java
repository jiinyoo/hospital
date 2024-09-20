package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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
	
	@RequestMapping("/main/userInfo")
    public String userInfo(HttpSession session, Model model) 
	{
        return service.userInfo(session, model);
    }
	
	@RequestMapping("/main/updateUser")
    public String updateUser(HttpSession session, Model model) 
	{
        return service.updateUser(session, model);
    }

    @RequestMapping("/main/updateOkUser")
    public String updateOkUser(UserDto udto, HttpSession session) 
    {
        return service.updateOkUser(udto, session);
    }
    
    @RequestMapping("/main/uchangePwd")
    public String uchangePwd(HttpServletRequest request,Model model)
    {
    	return service.uchangePwd(request,model);
    }

}
