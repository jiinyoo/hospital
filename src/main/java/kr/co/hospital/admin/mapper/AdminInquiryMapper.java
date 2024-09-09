package kr.co.hospital.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminInquiryMapper {

	String getState(String session_user_id);
	ArrayList<HashMap> inquirylist();

}
