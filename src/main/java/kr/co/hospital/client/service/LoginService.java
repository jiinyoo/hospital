package kr.co.hospital.client.service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;

public interface LoginService {
	public String login(HttpServletRequest request,Model model);
	public String loginOk(UserDto udto,HttpSession session);
	public String logout(HttpSession session);

}
