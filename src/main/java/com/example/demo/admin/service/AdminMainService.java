package com.example.demo.admin.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.example.demo.admin.dto.DoctorDto;

import jakarta.servlet.http.HttpServletRequest;

public interface AdminMainService {

	public String adminmain();
	public String doctor(HttpServletRequest request, Model model);
	public String view(HttpServletRequest request,Model model);
}
