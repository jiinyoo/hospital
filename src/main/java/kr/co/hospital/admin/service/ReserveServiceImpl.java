package kr.co.hospital.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hospital.admin.mapper.ReserveMapper;

@Service
@Qualifier("res")
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveMapper mapper;

}
