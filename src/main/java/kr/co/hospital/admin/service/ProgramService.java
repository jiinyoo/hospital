package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface ProgramService {

	public String program(HttpServletRequest request, Model model, HttpSession session);

	public String programwrite(HttpServletRequest request, Model model, HttpSession session);

}
