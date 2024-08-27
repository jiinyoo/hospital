package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface MedicalService {

	public String mlist(Model model,HttpServletRequest request);

}
