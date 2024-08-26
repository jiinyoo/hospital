package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface DoctorService {
	
	public String doctor(HttpServletRequest request, Model model);
	public String view(HttpServletRequest request,Model model);
}
