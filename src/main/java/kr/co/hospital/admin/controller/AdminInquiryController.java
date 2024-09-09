package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.hospital.admin.service.AdminInquiryService;

@Controller
@Qualifier("AISI")
public class AdminInquiryController {
	
	@Autowired
	AdminInquiryService service;

}
