package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.client.service.ReserveService;

@Controller
@Qualifier("res")
public class ReserveController {

	@Autowired
	private ReserveService service;
	
	@RequestMapping("/main/reserve")
	public String reserve(HttpServletRequest request,Model model) {
		return service.reserve(request,model);
	}
}
