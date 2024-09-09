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
	public void readnum(String inq_id);
	public InquiryDto content(String inq_id);
	public int groupNumber();
	public void delete(String inq_id);
	public void updateOk(InquiryDto idto);

}