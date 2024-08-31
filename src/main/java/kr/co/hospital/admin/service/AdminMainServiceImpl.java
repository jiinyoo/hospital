package kr.co.hospital.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.AdminTestDto;
import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.admin.mapper.AdminMainMapper;
@Service
@Qualifier("adm")

public class AdminMainServiceImpl implements AdminMainService {

	@Autowired
	AdminMainMapper mapper;
	
	@Override
	public String adminmain(HttpSession session) {
		if(session.getAttribute("user_id")==null) {
			return "redirect:/main/login";
		} else {
			String userid=session.getAttribute("user_id").toString();
			System.out.println(userid);
			if(mapper.getState(userid)==0) {
				return "redirect:/main/index";
			} else {
				return "/admin/main/index";				
			}
		}
	}
}
