package kr.co.hospital.admin.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.admin.dto.DoctorDto;

public interface AdminMainService {

	public String adminmain();
	public String doctor(HttpServletRequest request, Model model);
	public String view(HttpServletRequest request,Model model);
}
