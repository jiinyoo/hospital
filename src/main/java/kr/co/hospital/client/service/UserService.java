package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;

public interface UserService {
	public String user();
	public String userOk(UserDto udto);
	public String useridCheck(String user_id);
	public String userInfo(HttpSession session, Model model); 
	public String updateUser(HttpSession session, Model model);
    public String updateOkUser(UserDto udto, HttpSession session);
	public String uchangePwd(HttpServletRequest request, Model model);

}
