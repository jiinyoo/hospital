package kr.co.hospital.client.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.ProgramCapacityDto;
import kr.co.hospital.client.dto.ProgramDto;
import kr.co.hospital.client.dto.ProgramReserveDto;

@Mapper
public interface ProgramReserveMapper {
	ArrayList<ProgramDto> getPrograms();
	ProgramDto getProgram(int pro_id);
	int getResNumber(String pres_number);
	void minusInwon(String p_inwon, int pro_id);
	void insertPreserve(ProgramReserveDto prdto);
	Integer getProCapacity(int pro_id, String date);
	ProgramCapacityDto getProgramCapacityOne(String reserve_date, int pro_id);
	void pccminusinwonupdate(int p_inwon,int pro_id, String reserve_date);
	ArrayList<ProgramDto> righttimeprograms();
	ArrayList<ProgramReserveDto> memberprogram(String user_id);
	void changeState(int pres_id);
	void plusProgramCapacity(String p_inwon, String pro_id, String pres_date);
	ArrayList<ProgramReserveDto> oldmemberprogram(String user_id, int month, String start, String end);
}
