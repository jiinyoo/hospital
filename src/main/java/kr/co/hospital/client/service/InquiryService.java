package kr.co.hospital.client.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.InquiryDto;

public interface InquiryService {

	public String writeOk(InquiryDto idto, MultipartHttpServletRequest multi,HttpSession session) throws Exception;
	public String list(HttpSession session,Model model,HttpServletResponse response, HttpServletRequest request);
	public String readnum(HttpServletRequest request);
	public String content(HttpServletRequest request, Model model,HttpSession session);
	public String delete(HttpServletRequest request, HttpSession session) throws Exception;
	public String update(HttpServletRequest request, HttpSession session, Model model);
	public String updateOk(InquiryDto idto,HttpServletRequest request, HttpSession session,MultipartHttpServletRequest multi) throws Exception;
	
	
}