package com.example.demo.client.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.admin.dto.DoctorDto;
import com.example.demo.client.dto.ClientTestDto;

@Mapper
public interface ClientMainMapper {

	public ArrayList<ClientTestDto> clienttest();
	
}
