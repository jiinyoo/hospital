package kr.co.hospital.client.mapper;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.WorkdayDto;
import kr.co.hospital.client.dto.ReserveDto;
import kr.co.hospital.client.dto.UserDto;

@Mapper
public interface ReserveMapper {
	public ArrayList<String> getPart();
	public ArrayList<HashMap> getDoctors();
	public ArrayList<HashMap> chkpart(String doc_part);
	public String chkDoc(String doc_id);
	public WorkdayDto getTime(String doc_id,int dayValue);
	public ArrayList<ReserveDto> isReserve(String doc_id, LocalDate date);
	public List<Integer> getWorkingday(String doc_id);
	public int getResnum(String res_code);
	public void reserveOk(ReserveDto rdto);
	public UserDto getUserinfo(String userid);
	public ReserveDto reserveConfirm(String res_code);
	public ArrayList<ReserveDto> reserveView(String user_id, String user_info);
	public ArrayList<ReserveDto> pastReserve(String user_id, int month, LocalDateTime start, LocalDateTime end);
	public String getDoctor(int doc_id);
	public void delRes(String res_id, String userid, String user_info);
}
