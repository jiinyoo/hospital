package kr.co.hospital.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hospital.client.mapper.ReserveMapper;

@Service
@Qualifier("res")
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveMapper mapper;
}
