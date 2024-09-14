package kr.co.hospital.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import kr.co.hospital.admin.dto.ProgramDto;
import kr.co.hospital.admin.dto.ProgramdaysDto;

@Mapper
public interface ProgramMapper {
	public ArrayList<ProgramDto> programs();
	public void programupdate(ProgramDto pdto);
	public int juisnullcheck(String pro_ju);
	public void insertprogram(ProgramDto pdto);
	public void deleteProgramDays(int pro_id);
	public void insertProgramDay(int pro_id, Integer day_of_week);
	public int selectrecentid();
	public void deleteProgram(int pro_id);
	public ProgramDto getContent(int pro_id);
	public ArrayList<ProgramdaysDto> getProgramdays(int pro_id);
	public void updateProgram(ProgramDto pdto);
}
