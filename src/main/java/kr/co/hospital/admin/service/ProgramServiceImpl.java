package kr.co.hospital.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.mapper.ProgramMapper;

@Service
@Qualifier("pc")
public class ProgramServiceImpl implements ProgramService {
	@Autowired
	ProgramMapper mapper;

	@Override
	public String program(HttpServletRequest request, Model model, HttpSession session) {
		// TODO Auto-generated method stub
		return "/admin/program/program";
	}
	

}
