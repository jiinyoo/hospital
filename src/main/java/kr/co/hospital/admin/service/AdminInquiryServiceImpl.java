package kr.co.hospital.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hospital.admin.mapper.AdminInquiryMapper;

@Service
@Qualifier("AISI")
public class AdminInquiryServiceImpl implements AdminInquiryService {
	
	@Autowired
	AdminInquiryMapper mapper;

}
