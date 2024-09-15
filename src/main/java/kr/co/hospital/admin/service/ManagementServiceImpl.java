package kr.co.hospital.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.ManagementDto;
import kr.co.hospital.admin.mapper.ManagementMapper;
import java.util.List;

@Service
@Qualifier("manager")
public class ManagementServiceImpl implements ManagementService {
	
	@Autowired
	private ManagementMapper mapper;
	
	 @Override
	    public String List(Model model) 
	    {
	        List<ManagementDto> mdto=mapper.getAllUsers();
	        model.addAttribute("mdto", mdto);
	        return "/admin/user/list";
	    }

	    @Override
	    public String updateState(ManagementDto mdto,
	    		HttpSession session) 
	    {
	    	 Integer state=(Integer)session.getAttribute("state");

	         if (state!=null && state == 2) 
	         {
	             mapper.updateState(mdto); 
	             return "redirect:/admin/user/list";
	         } 
	         else 
	         {
	             return "redirect:/admin/user/list?error=1";
	         }
	    }

}
