package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface ClientMainService {

	public String clientmain();

	public String noticelist(Model model, HttpSession session, HttpServletResponse response);

}
