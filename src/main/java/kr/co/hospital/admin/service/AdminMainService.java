package kr.co.hospital.admin.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.DoctorDto;

public interface AdminMainService {

	public String adminmain(HttpSession session);
	

}
