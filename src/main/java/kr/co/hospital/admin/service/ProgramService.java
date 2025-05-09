package kr.co.hospital.admin.service;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.ProgramDto;

public interface ProgramService {

	public String program(HttpServletRequest request, Model model, HttpSession session);
	public String programwrite();
	public String programwriteOk(ProgramDto pdto,MultipartHttpServletRequest multi,HttpServletRequest request, Model model, HttpSession session) throws Exception;
	public String programdelete(HttpServletRequest request) throws Exception;
	public String programupdate(HttpServletRequest request,Model model);
	public String programupdateOk(MultipartHttpServletRequest multi,ProgramDto pdto, HttpServletRequest request, Model model, HttpSession session)throws Exception;
	public String programreservemanage(HttpServletRequest request, Model model, HttpSession session);
	public ResponseEntity<String> programchgstate(HttpServletRequest request, HttpSession session);
	public String programuserdelete(HttpServletRequest request, HttpSession session);


}
