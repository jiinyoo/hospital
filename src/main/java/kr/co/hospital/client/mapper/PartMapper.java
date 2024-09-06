package kr.co.hospital.client.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.DoctorDto;

@Mapper
public interface PartMapper {
	public ArrayList<DoctorDto> dlist(String part);
}
