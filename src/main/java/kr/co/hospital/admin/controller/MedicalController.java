package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.admin.dto.MedicalDto;
import kr.co.hospital.admin.service.MedicalService;

@Controller
public class MedicalController {

	@Autowired
	@Qualifier("medi")
	private MedicalService service;
	
	@RequestMapping("/admin/medical/afterMedi")
	public String afterMedi(Model model,HttpServletRequest request) {
		return service.mlist(model, request);
	}
}
