package kr.co.hospital.client.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.InquiryDto;

@Mapper
public interface InquiryMapper {

	public void writeOk(InquiryDto idto);
	public ArrayList<HashMap> inquirylist();
	public int getmaxgroupId();

}
