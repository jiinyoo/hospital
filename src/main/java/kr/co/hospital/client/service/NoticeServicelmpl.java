package kr.co.hospital.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.service.AdminMainService;
import kr.co.hospital.client.dto.NoticeDto;
import kr.co.hospital.client.mapper.NoticeMapper;

@Service
@Qualifier("noti")
public class NoticeServicelmpl  implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public String notice_write(HttpServletRequest request, Model model)
	{
		return "/client/notice/notice_write";
	}
	
	@Override
	public String notice_writeOk(NoticeDto ndto,HttpSession session)
	{
		return "/client/notice/notice_writeOk";
	}

}
