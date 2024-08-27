package kr.co.hospital.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.DoctorDto;

@Mapper
public interface DoctorMapper {

	public ArrayList<DoctorDto> doctor(String doc_part);
	public DoctorDto view(String doc_id);
}
