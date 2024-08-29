package kr.co.hospital.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import kr.co.hospital.admin.dto.MedicalDto;
import kr.co.hospital.admin.dto.ReserveDto;
import kr.co.hospital.admin.service.MedicalService;

@Mapper
public interface MedicalMapper {

	public ArrayList<HashMap> mlist(int index, String stype, String sword);
	public int getChong(String stype, String sword);
	public String getDocid(String userid);
	public ArrayList<ReserveDto> getPatients(String doc_id);
	public String getName(String userid);
	public String getDocName(int doc_id);
	public ReserveDto getPatient(String res_id);
}
