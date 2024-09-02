package kr.co.hospital.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.client.dto.UserDto;

@Mapper
public interface DoctorMapper {

	public ArrayList<DoctorDto> doctor(String doc_part);
	public DoctorDto view(String doc_id);
	public int getState(String user_id);
	public boolean isDoctor(String userid);
	public HashMap getName(String userid);
	public void addDoctorOk(DoctorDto dto);
}
