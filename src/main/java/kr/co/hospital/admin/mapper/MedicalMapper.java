package kr.co.hospital.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import kr.co.hospital.admin.dto.MedicalDto;
import kr.co.hospital.admin.service.MedicalService;

@Mapper
public interface MedicalMapper {

	public ArrayList<MedicalDto> mlist(int index, String stype, String sword);
	public int getChong(String stype, String sword);
	public String getJumin(String userid);
}
