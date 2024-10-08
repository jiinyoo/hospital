package kr.co.hospital.client.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hospital.admin.dto.AdminTestDto;
import kr.co.hospital.client.mapper.ClientMainMapper;

@Service
@Qualifier("clm")
public class ClientMainServiceImpl implements ClientMainService{
	@Autowired
	ClientMainMapper mapper;
	@Override
	public String clientmain() {			
		return "client/main/index";
	}
}
