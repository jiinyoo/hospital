package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.MedicalDto;

public interface MedicalService {

	public String afterMedi(Model model,HttpServletRequest request,HttpSession session, HttpServletResponse response);
	public String patient(HttpSession session,Model model,HttpServletRequest request);
	public String patientView(HttpServletRequest request, HttpSession session, Model model);
	public String medicalOk(HttpServletRequest request, MedicalDto mdto, HttpSession session);
	public String afterMediView(HttpServletRequest request,Model model, HttpSession session, HttpServletResponse response);
	
}
