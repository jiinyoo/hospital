package kr.co.hospital.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.DoctorDto;

public interface DoctorService {
	
	public String doctor(HttpServletRequest request, Model model, HttpSession session);
	public String view(HttpServletRequest request,Model model,HttpSession session);
	public String addDoctor(HttpSession session,Model model);
	public String addDoctorOk(DoctorDto ddto,MultipartHttpServletRequest request) throws Exception;
}
