package kr.co.hospital.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.admin.dto.AdminTestDto;
import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.admin.mapper.AdminMainMapper;
@Service
@Qualifier("adm")

public class AdminMainServiceImpl implements AdminMainService {

	@Autowired
	AdminMainMapper mapper;
	
	@Override
	public String adminmain() {
		return "/admin/main/index";
	}
}
