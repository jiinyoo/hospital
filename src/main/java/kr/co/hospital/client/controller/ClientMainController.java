package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String main()
	{
		return "redirect:/main/index";
	}
	
	@RequestMapping("/main/index")
	public String index() 
	{
		return service.clientmain();
	}
	
}
