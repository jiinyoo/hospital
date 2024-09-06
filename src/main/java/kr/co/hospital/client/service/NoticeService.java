package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.NoticeDto;

public interface NoticeService {
	public String notice_write(HttpServletRequest request, Model model);
	public String notice_writeOk(NoticeDto ndto,HttpSession session);

}
