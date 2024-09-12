package kr.co.hospital.client.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.client.service.ProgramReserveSevice;



@Controller
@Qualifier("CPRC")
public class ProgramReserveController {
	@Autowired
	 ProgramReserveSevice service;
	
	@RequestMapping("/program/programreserve")
	public String programreserve(HttpServletRequest request, Model model) {
		return service.ProgramReserve(request,model);
	}
	
	
	@RequestMapping("/program/calendar")
	@ResponseBody
	public String calendar(HttpServletRequest request, Model model) {
		return service.calendar(request,model);
	}
	
	

}
