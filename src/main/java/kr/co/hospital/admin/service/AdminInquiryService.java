package kr.co.hospital.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.AdminInquiryDto;
import kr.co.hospital.client.dto.InquiryDto;

public interface AdminInquiryService {

	String inquirylist(HttpSession session, Model model, HttpServletResponse response, HttpServletRequest request);

	String readnum(HttpServletRequest request,HttpSession session);

	String write(HttpServletRequest request, HttpSession session, Model model);

	String writeOk(AdminInquiryDto aidto, MultipartHttpServletRequest multi, HttpSession session) throws Exception;

	String content(HttpServletRequest request, Model model, HttpSession session);

	String delete(HttpServletRequest request, HttpSession session)throws Exception;

	String update(HttpServletRequest request, HttpSession session, Model model);

	String updateOk(InquiryDto idto, HttpServletRequest request, HttpSession session,
			MultipartHttpServletRequest multi) throws Exception;

	

}
