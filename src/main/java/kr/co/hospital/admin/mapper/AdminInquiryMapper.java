package kr.co.hospital.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.AdminInquiryDto;

@Mapper
public interface AdminInquiryMapper {

	int getState(String session_user_id);
	ArrayList<HashMap> inquirylist();
	void readnum(String inq_id);
	void writeOk(AdminInquiryDto aidto);
	void updateanswer(String inq_id);

}
