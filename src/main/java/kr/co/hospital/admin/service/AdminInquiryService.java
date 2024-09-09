package kr.co.hospital.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.AdminInquiryDto;

public interface AdminInquiryService {

	String inquirylist(HttpSession session, Model model, HttpServletResponse response);

	String readnum(HttpServletRequest request,HttpSession session);

	String write(HttpServletRequest request, HttpSession session, Model model);

	String writeOk(AdminInquiryDto aidto, MultipartHttpServletRequest multi, HttpSession session) throws Exception;

}
