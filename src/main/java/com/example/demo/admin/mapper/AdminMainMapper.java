package com.example.demo.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.admin.dto.AdminTestDto;

@Mapper
public interface AdminMainMapper {

	public ArrayList<AdminTestDto> test();
	
	

}
