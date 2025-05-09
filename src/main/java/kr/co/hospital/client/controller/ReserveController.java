package kr.co.hospital.client.controller;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.ReserveDto;
import kr.co.hospital.client.service.ReserveService;

@Controller
@Qualifier("res")
public class ReserveController {

	@Autowired
	private ReserveService service;
	
	@RequestMapping("/main/reserve")
	public String reserve(HttpServletRequest request,Model model,HttpSession session,
			HttpServletResponse response,RedirectAttributes redirect) {
		return service.reserve(request,model,session,response,redirect);
	}
	
	@RequestMapping("/main/beforeReserve")
	public String beforeReserve(ReserveDto rdto) {
		return service.beforeReserve(rdto);
	}
	
	@RequestMapping("/main/chkpart")
	public @ResponseBody ArrayList<HashMap> chkpart(HttpServletRequest request) {
		return service.chkpart(request);
	}
	
	@RequestMapping("/main/chkDoc")
	public @ResponseBody HashMap chkDoc(HttpServletRequest request) {
		return service.chkDoc(request);
	}
	
	@RequestMapping("/main/getCal")
	public @ResponseBody Map getCal(HttpServletRequest request) {
		return service.getCal(request);
	}
	
	@RequestMapping("/main/chkDate")
	public @ResponseBody HashMap chkDate(HttpServletRequest request) {
		return service.chkDate(request);
	}
	
	@RequestMapping("/main/reserveOk")
	public String reserveOk(ReserveDto rdto,HttpSession session,HttpServletResponse response,RedirectAttributes redirect,
			HttpServletRequest request) {
		return service.reserveOk(rdto,session,response,redirect,request);
	}
	
	@RequestMapping("/main/reserveSearch")
	public String reserveSearch() {
		return "/client/reserve/reserveSearch";
	}
	
	@RequestMapping("/main/reserveView")
	public String reserveView(HttpSession session,Model model,HttpServletRequest request, HttpServletResponse response) {
		return service.reserveView(session,model,request,response);
	}
	
	@RequestMapping("/main/cancelRes")
	public String cancelRes(HttpServletRequest request,HttpSession session) {
		return service.cancelRes(request,session);
	}
	
	@RequestMapping("/main/delsuccess")
	public String delsuccess() {
		return "/client/reserve/delsuccess";
	}
	
	@RequestMapping("/main/addSuccess")
	public String addSucess() {
		return "/client/reserve/addSuccess";
	}
	
}
