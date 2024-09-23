package kr.co.hospital.client.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.AdminTestDto;
import kr.co.hospital.client.mapper.ClientMainMapper;

@Service
@Qualifier("clm")
public class ClientMainServiceImpl implements ClientMainService{
	@Autowired
	ClientMainMapper mapper;
	@Override
	public String clientmain() {			
		return "client/main/index";
	}
	
	@Override
	public String noticelist(Model model,
			HttpSession session, 
			HttpServletResponse response) 
	{
			
			ArrayList<HashMap> map=mapper.notice_list();
			System.out.println("공지사항 목록: "+map);
			model.addAttribute("nmapAll",map);
			
			ArrayList<HashMap> programmap=mapper.program_list();
			model.addAttribute("programmap", programmap);
			
			return "/client/main/index";
	}
}
