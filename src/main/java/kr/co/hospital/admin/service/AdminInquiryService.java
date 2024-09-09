package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface AdminInquiryService {

	String inquirylist(HttpSession session, Model model, HttpServletResponse response);

}
