package kr.co.hospital.client.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.NoticeDto;

public interface NoticeService {
	public String notice_write(HttpSession session, Model model);
	public String notice_writeOk(NoticeDto ndto, HttpSession session, MultipartHttpServletRequest multi) throws Exception;
	public String notice_list(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response);
	public String notice_readnum(HttpServletRequest request);
	public String notice_content(HttpServletRequest request, HttpSession session, Model model);
	public String notice_update(HttpServletRequest request, Model model, HttpSession session);
	public String notice_updateOk(NoticeDto ndto,HttpServletRequest request, MultipartHttpServletRequest multi, HttpSession session)throws Exception ;
	public String notice_delete(HttpServletRequest request);

}
