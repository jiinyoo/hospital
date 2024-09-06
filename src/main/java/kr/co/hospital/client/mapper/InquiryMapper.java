package kr.co.hospital.client.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hospital.client.dto.InquiryDto;

@Mapper
public interface InquiryMapper {

	public void writeOk(InquiryDto idto);

}
