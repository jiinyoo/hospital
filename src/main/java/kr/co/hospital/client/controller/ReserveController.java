package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.hospital.client.service.ReserveService;

@Controller
@Qualifier("res")
public class ReserveController {

	@Autowired
	private ReserveService service;
}
