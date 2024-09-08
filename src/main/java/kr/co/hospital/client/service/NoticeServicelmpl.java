package kr.co.hospital.client.service;

import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.service.AdminMainService;
import kr.co.hospital.client.dto.NoticeDto;
import kr.co.hospital.client.mapper.NoticeMapper;
import kr.co.hospital.util.FileUtils;

@Service
@Qualifier("noti")
public class NoticeServicelmpl  implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public String notice_write(HttpSession session, 
			Model model)
	{
		if(session.getAttribute("user_id")!=null)
		{
			String user_id=session.getAttribute("user_id").toString();
			model.addAttribute("user_id",user_id);
			return "/client/notice/notice_write";
		}
		else
		{
			return "redirect:/main/login";
		}
	}
	
	@Override
	public String notice_writeOk(NoticeDto ndto,
			HttpSession session,
			MultipartHttpServletRequest multi) throws Exception
	{
		if(session.getAttribute("user_id")!=null) 
		{
		String user_id=session.getAttribute("user_id").toString();
		ndto.setUser_id(user_id);
		
		Iterator<String> imsi=multi.getFileNames();
		
		String fname="";
		while(imsi.hasNext()) 
		{
			String name=imsi.next();
			MultipartFile file=multi.getFile(name);
			if(!file.isEmpty()) 
			{
				String preName=file.getOriginalFilename();
				String str=ResourceUtils.getFile("classpath:static/client/notice").toPath().toString()+"/"+preName;			
				str=FileUtils.getFileName(preName,str);
				String saveFname=str.substring(str.lastIndexOf("/")+1);
				fname=fname+saveFname+"/";
				Path path=Paths.get(str);
				Files.copy(file.getInputStream(),path,StandardCopyOption.REPLACE_EXISTING);
			}
		}
		ndto.setImg(fname);
		
		mapper.notice_writeOk(ndto);
		return "redirect:/notice_list";
		}
		else
		{
			return "redirect:/main/login";
		}
	}

	@Override
	public String notice_list(Model model,
			HttpSession session, 
			HttpServletResponse response) 
	{
		String user_id=(String) session.getAttribute("user_id");
	    
	    if(user_id!=null) 
	    {
			ArrayList<HashMap> map=mapper.notice_list();
		
			model.addAttribute("nmapAll",map);
		
			return "/client/notice/notice_list";
		}	
		else
		{
			Cookie cookie = new Cookie("url", "/notice_list");
			cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 기간 (초 단위) - 여기서는 1일
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/main/login";
		}
	}

	@Override
	public String notice_readnum(HttpServletRequest request) 
	{
		String notice_id=request.getParameter("notice_id");
		mapper.notice_readnum(notice_id);
		return "redirect:/notice_content?notice_id="+notice_id;
	}

	@Override
	public String notice_content(HttpServletRequest request, 
			HttpSession session,
			Model model) 
	{
		String notice_id=request.getParameter("notice_id");
		
		NoticeDto ndto=mapper.notice_content(notice_id);
		
		 String[] imgs=(ndto.getImg()!=null)?ndto.getImg().split("/"):new String[0];
	    model.addAttribute("imgs",imgs);
		model.addAttribute("ndto",ndto);
		model.addAttribute("user_id",session.getAttribute("user_id").toString());
		return "/client/notice/notice_content";
	}

	@Override
	public String notice_update(HttpServletRequest request, 
			Model model,
			HttpSession session)
	{
		String user_id=request.getParameter("user_id");
		String notice_id=request.getParameter("notice_id");
		
		NoticeDto ndto=mapper.notice_content(notice_id);
		
		String[] imgs=ndto.getImg().split("/");
		model.addAttribute("imgs",imgs);
		model.addAttribute("ndto",ndto);
		return "/client/notice/notice_update";
	}

	@Override
	public String notice_updateOk(NoticeDto ndto, 
			HttpServletRequest request, 
			MultipartHttpServletRequest multi) throws Exception 
	{
		System.out.println(ndto);
		String notice_id=request.getParameter("notice_id");
	    Iterator<String> imsi = multi.getFileNames();  // 파일 이름 가져오기 위한 반복자
	    
	    String fname=(ndto.getImg()!=null)?ndto.getImg():"";  // 기본적으로 이전 파일 이름을 가져옴
	    
	    // 파일이 존재하는지 확인 후 처리
	    while (imsi.hasNext()) {
	        String name = imsi.next();  // 파일 이름 가져오기    
	        MultipartFile file = multi.getFile(name);
	        if (!file.isEmpty()) {
	            String preName = file.getOriginalFilename();
	            String str = ResourceUtils.getFile("classpath:static/client/notice").toPath().toString() + "/" + preName;            
	            str = FileUtils.getFileName(preName, str);
	            String saveFname = str.substring(str.lastIndexOf("/") + 1);
	            fname+=saveFname+"/";  // 새로운 파일 이름으로 교체
	            Path path = Paths.get(str);
	            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
	        }
	        
	    }
		ndto.setImg(fname);  
		mapper.notice_updateOk(ndto);
		return "redirect:/notice_content?notice_id="+notice_id;
	}

	@Override
	public String notice_delete(HttpServletRequest request) 
	{
		String user_id=request.getParameter("user_id");
		String notice_id=request.getParameter("notice_id");
			
		mapper.notice_delete(user_id,notice_id);
		return "redirect:/notice_list";
	}

}
