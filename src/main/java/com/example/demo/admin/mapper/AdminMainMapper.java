package com.example.demo.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.admin.dto.AdminTestDto;
import com.example.demo.admin.dto.DoctorDto;

@Mapper
public interface AdminMainMapper {

	public ArrayList<AdminTestDto> test();
	public ArrayList<DoctorDto> doctor(String doc_part);
	public DoctorDto view(String doc_id);
	

}
