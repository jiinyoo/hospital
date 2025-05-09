package kr.co.hospital.client.service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;

public interface LoginService {
	public String login(HttpServletRequest request,Model model);
	public String loginOk(UserDto udto,HttpSession session,HttpServletRequest request,HttpServletResponse response);
	public String logout(HttpSession session);
	public String idSearch(HttpServletRequest request, Model model);
	public String pwdSearch(HttpServletRequest request, Model model);
	public String verifyCode(HttpServletRequest request, Model model);
	public String changePwd(HttpServletRequest request, Model model);	

}
