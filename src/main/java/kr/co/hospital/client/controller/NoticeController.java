package kr.co.hospital.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.NoticeDto;
import kr.co.hospital.client.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	@Qualifier("noti")
	NoticeService service;
	
	/*@RequestMapping("/client/notice/write")
	public String write(HttpServletRequest request,
			Model model)
	{
		return service.write(request,model);
	}
	
	@RequestMapping("/client/notice/writeOk")
	public String writeOk(NoticeDto ndto,HttpSession session)
	{
		return service.writeOk(ndto,session);
	}
	
	@RequestMapping("/client/notice/list")
	public String list()
	{
		return service.list();
	}
	
	@RequestMapping("/client/notice/readnum")
	public String readnum()
	{
		return service.readnum();
	}
	
	@RequestMapping("/client/notice/content")
	public String content()
	{
		return service.content();
	}
	
	@RequestMapping("/client/notice/update")
	public String update()
	{
		return service.update();
	}
	
	@RequestMapping("/client/notice/updateOk")
	public String updateOk()
	{
		return service.updateOk();
	}
	
	@RequestMapping("/client/notice/delete")
	public String delete()
	{
		return service.delete();
	}
*/
}
