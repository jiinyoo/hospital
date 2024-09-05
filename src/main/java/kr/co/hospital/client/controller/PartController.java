package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.client.service.PartService;

@Controller
@Qualifier("part")
public class PartController {

	@Autowired
	private PartService service;
	
	@RequestMapping("/main/info/part")
	public String getPart(HttpServletRequest request,Model model) {
		return service.part(request,model);
	}
}
