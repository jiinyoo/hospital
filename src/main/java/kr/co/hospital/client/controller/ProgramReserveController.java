package kr.co.hospital.client.controller;


import java.net.http.HttpResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.ProgramReserveDto;
import kr.co.hospital.client.service.ProgramReserveSevice;



@Controller
@Qualifier("CPRC")
public class ProgramReserveController {
	@Autowired
	 ProgramReserveSevice service;
	
	@RequestMapping("/main/programreserve")
	public String programreserve(HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response) {
		return service.ProgramReserve(request,model,session,response);
	}
	
	
	@RequestMapping("/program/calendar")
	@ResponseBody
	public String calendar(HttpServletRequest request, Model model,HttpSession session) {
		return service.calendar(request,model,session);
	}
	
	@RequestMapping("/main/programreserveview")
	public String programreserveview(HttpServletRequest request, Model model,HttpSession session) {
		return service.preserview(request,model,session);
	}

	@RequestMapping("/main/preserveOk")
	public String preserveOk(ProgramReserveDto prdto,HttpServletRequest request, Model model,HttpSession session) {
		return service.preserveOk(prdto,request,model,session);
	}
	
	@RequestMapping("/main/memberpreserve")
	public String memberpreserve(ProgramReserveDto prdto,HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response) {
		return service.memberpreserve(prdto,request,model,session,response);
	}

	
	
}
