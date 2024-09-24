package kr.co.hospital.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.admin.dto.AdminInquiryDto;
import kr.co.hospital.client.dto.InquiryDto;


@Mapper
public interface AdminInquiryMapper {

	int getState(String session_user_id);
	ArrayList<HashMap> inquirylist(int index, String stype, String sword);
	void readnum(String inq_id);
	void writeOk(AdminInquiryDto aidto);
	void updateanswer(int inq_id);
	AdminInquiryDto content(String inq_id);
	void delete(String inq_id);
	void updateOk(InquiryDto idto);
	void updatezero(int group_order);
	void samegroupdelete(int group_order);
	int getChong(String stype, String sword);
	

}
