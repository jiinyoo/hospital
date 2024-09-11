package kr.co.hospital.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.ProgramDto;

public interface ProgramService {

	public String program(HttpServletRequest request, Model model, HttpSession session);

	public String programwrite(HttpServletRequest request, Model model, HttpSession session);

	public String programwriteOk(ProgramDto pdto,MultipartHttpServletRequest multi,HttpServletRequest request, Model model, HttpSession session) throws Exception;


}
