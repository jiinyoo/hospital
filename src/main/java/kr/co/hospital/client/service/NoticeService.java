package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.NoticeDto;

public interface NoticeService {
	public String notice_write(HttpSession session, Model model);
	public String notice_writeOk(NoticeDto ndto);
	public String notice_list(Model model, HttpSession session, HttpServletResponse response);

}
