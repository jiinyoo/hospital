package kr.co.hospital.admin.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.AdminNoticeDto;

public interface AdminNoticeService {
	public String admin_notice_write(HttpSession session, Model model);
	public String admin_notice_writeOk(AdminNoticeDto ndto, HttpSession session, MultipartHttpServletRequest multi) throws Exception;
	public String admin_notice_list(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response);
	public String admin_notice_readnum(HttpServletRequest request);
	public String admin_notice_content(HttpServletRequest request, HttpSession session, Model model);
	public String admin_notice_update(HttpServletRequest request, Model model, HttpSession session);
	public String admin_notice_updateOk(AdminNoticeDto ndto,HttpServletRequest request, MultipartHttpServletRequest multi, HttpSession session)throws Exception ;
	public String admin_notice_delete(HttpServletRequest request);

}
