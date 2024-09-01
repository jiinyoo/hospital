package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface DoctorService {
	
	public String doctor(HttpServletRequest request, Model model, HttpSession session);
	public String view(HttpServletRequest request,Model model,HttpSession session);
	public String addDoctor(HttpSession session);
}
