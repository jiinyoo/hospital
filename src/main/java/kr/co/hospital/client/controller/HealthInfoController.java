package kr.co.hospital.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HealthInfoController {
	
	@GetMapping ("/main/healthInfo")
	public String healthInfo()
	{
		return "client/health/healthInfo";
	}

}
