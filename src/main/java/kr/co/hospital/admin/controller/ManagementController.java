package kr.co.hospital.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.ManagementDto;
import kr.co.hospital.admin.service.ManagementService;

@Controller
public class ManagementController {
	@Autowired
	@Qualifier("manager")
	
	private ManagementService service;
	
	@RequestMapping("/admin/user/list")
	public String List(HttpServletRequest request,
			Model model)
	{
		return service.List(request,model);
	}
	
	@RequestMapping("/admin/user/updateState")
    public String updateState(ManagementDto mdto,
    		 HttpSession session, HttpServletRequest request) 
	{
        return service.updateState(mdto, session, request);
    }

}
