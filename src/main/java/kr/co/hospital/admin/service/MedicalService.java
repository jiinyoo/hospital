package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface MedicalService {

	public String mlist(Model model,HttpServletRequest request);
	public String patient(HttpSession session,Model model,HttpServletRequest request);
}
