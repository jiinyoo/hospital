package com.example.demo.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdminTestDto;
import com.example.demo.admin.dto.DoctorDto;
import com.example.demo.admin.mapper.AdminMainMapper;

import jakarta.servlet.http.HttpServletRequest;
@Service
@Qualifier("adm")

public class AdminMainServiceImpl implements AdminMainService {

	@Autowired
	AdminMainMapper mapper;
	
	@Override
	public String adminmain() {

		return "/adminmain/index";
	}

	@Override
	public String doctor(HttpServletRequest request,Model model) {
		String doc_part = request.getParameter("doc_part");
		model.addAttribute("doctorList",mapper.doctor(doc_part));
		return "/adminmain/doctor";
	}
	
	

}
