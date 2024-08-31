package kr.co.hospital.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.AdminTestDto;
import kr.co.hospital.admin.dto.DoctorDto;

@Mapper
public interface AdminMainMapper {
	public int getState(String userid);

	

}
