package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.MedicalDto;

public interface MedicalService {

	public String afterMedi(Model model,HttpServletRequest request);
	public String patient(HttpSession session,Model model,HttpServletRequest request);
	public String patientView(HttpServletRequest request, HttpSession session, Model model);
	public String medicalOk(HttpServletRequest request, MedicalDto mdto, HttpSession session);
	public String mediView(HttpServletRequest request,Model model);
	
}
