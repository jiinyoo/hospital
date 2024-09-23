package kr.co.hospital.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.ProgramCapacityDto;
import kr.co.hospital.admin.dto.ProgramDto;
import kr.co.hospital.admin.dto.ProgramdaysDto;
import kr.co.hospital.admin.dto.ProgramReserveDto;

@Mapper
public interface ProgramMapper {
	public ArrayList<ProgramDto> programs(int index, String stype, String sword);
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
	public void insertProgramCapacity(int pro_id, String date, int pro_inwon);
	public void deleteProgramCapacity(int pro_id);
	public ArrayList<ProgramReserveDto> userpreserve(int index, String stype, String sword);
	public void updatestate(int pres_id, int state);
	public ProgramCapacityDto getProgramCapacity(int pro_id, String pres_date);
	public void plusProgramCapacity(int p_inwon, int pro_id, String pres_date);
	public void minusProgramCapacity(int p_inwon, int pro_id, String pres_date);
	public void deleteonepreserve(int pres_id);
	public int getpreserveChong(String stype, String sword);
	public int getChong(String stype, String sword);
}
