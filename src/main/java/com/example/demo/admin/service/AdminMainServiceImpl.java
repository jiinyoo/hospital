package com.example.demo.admin.service;

import java.util.ArrayList;
import java.util.List;

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

		return "/admin/index";
	}

	@Override
	public String doctor(HttpServletRequest request,Model model) {
		String doc_part = request.getParameter("doc_part");
		model.addAttribute("doctorList",mapper.doctor(doc_part));
		return "/admin/doctor";
	}

	@Override
	public String view(HttpServletRequest request, Model model) {
		String doc_id=request.getParameter("doc_id");
		DoctorDto ddto=mapper.view(doc_id);
		String[] history=ddto.getDoc_history().split("/");
		model.addAttribute("doctor", ddto);
		model.addAttribute("history",history);
		return "/admin/view";
	}
	
	

}
