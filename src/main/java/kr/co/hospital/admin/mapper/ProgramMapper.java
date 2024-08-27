package kr.co.hospital.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import kr.co.hospital.admin.dto.ProgramDto;

@Mapper
public interface ProgramMapper {

	public ArrayList<ProgramDto> programs();

}
