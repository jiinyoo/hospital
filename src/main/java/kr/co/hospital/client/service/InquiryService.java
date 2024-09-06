package kr.co.hospital.client.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.InquiryDto;

public interface InquiryService {

	public String writeOk(InquiryDto idto, MultipartHttpServletRequest multi,HttpSession session) throws Exception;

}
