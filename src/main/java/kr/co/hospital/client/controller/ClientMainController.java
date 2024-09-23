package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.service.ClientMainService;

@Controller
public class ClientMainController {
	@Autowired
	@Qualifier("clm")
	ClientMainService service;
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main/index")
	public String notice_list(Model model,
			HttpSession session, 
			HttpServletResponse response)
	{
		return service.noticelist(model,session,response);
	}
	
	@GetMapping("/main/hospital")
	public String hospital()
	{
		return "/client/info/hospital";
	}
}
