package kr.co.hospital.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hospital.admin.service.AdminMainService;
import kr.co.hospital.client.mapper.NoticeMapper;

@Service
@Qualifier("noti")
public class NoticeServicelmpl  implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	/* @Override
	public String write()
	{
		return "/client/notice/write";
	}
	
	@Override
	public String writeOk()
	{
		return "/client/notice/writeOk";
	} */

}
