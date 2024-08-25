package com.example.demo.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.admin.dto.AdminTestDto;
import com.example.demo.admin.mapper.AdminMainMapper;
@Service
@Qualifier("adm")

public class AdminMainServiceImpl implements AdminMainService {

	@Autowired
	AdminMainMapper mapper;
	
	@Override
	public String adminmain() {
		ArrayList<AdminTestDto> list=mapper.test();
		System.out.println(list.get(0));
		return "/adminmain/index";
	}

}
