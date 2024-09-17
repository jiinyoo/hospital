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
}
