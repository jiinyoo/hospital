package kr.co.hospital.client.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.DoctorDto;


@Mapper
public interface ClientMainMapper {

	public ArrayList<HashMap> notice_list();

	public ArrayList<HashMap> program_list();


	
	
}
