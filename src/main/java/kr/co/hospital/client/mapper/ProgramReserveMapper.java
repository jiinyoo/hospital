package kr.co.hospital.client.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.ProgramDto;

@Mapper
public interface ProgramReserveMapper {

	ArrayList<ProgramDto> getPrograms();


	
}
