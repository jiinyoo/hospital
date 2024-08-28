package kr.co.hospital.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.mapper.ProgramMapper;
import kr.co.hospital.admin.dto.ProgramDto;

@Service
@Qualifier("pc")
public class ProgramServiceImpl implements ProgramService {
	@Autowired
	ProgramMapper mapper;

	@Override
	public String program(HttpServletRequest request, Model model, HttpSession session) {
		
		ArrayList<ProgramDto> plist=mapper.programs();
		model.addAttribute("plist",plist);
		return "/admin/program/program";
	}

	@Override
	public String programwrite(HttpServletRequest request, Model model, HttpSession session) {
		// TODO Auto-generated method stub
		return "/admin/program/programwrite";
	}
	

}
