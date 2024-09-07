package kr.co.hospital.client.mapper;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.WorkdayDto;
import kr.co.hospital.client.dto.ReserveDto;

@Mapper
public interface ReserveMapper {
	public ArrayList<String> getPart();
	public ArrayList<HashMap> getDoctor();
	public ArrayList<HashMap> chkpart(String doc_part);
	public String chkDoc(String doc_id);
	public WorkdayDto getTime(String doc_id,int dayValue);
	public ArrayList<ReserveDto> isReserve(String doc_id, LocalDate date);
	public List<Integer> getWorkingday(String doc_id);
}
