package kr.co.hospital.client.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
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
import kr.co.hospital.util.NoticeUtils;

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
				str=NoticeUtils.getFileName(preName,str);
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
		
		 // 이미지가 null이 아니고 빈 값이 아닌 경우, '/'로 구분하여 imgs 배열에 저장
	    if (ndto.getImg() != null && !ndto.getImg().isEmpty()) {
	        String[] imgs = ndto.getImg().split("/");
	       
	        ndto.setImgs(imgs);  // NoticeDto 객체에 imgs 배열 설정
	    } else {
	        ndto.setImgs(new String[0]);  // 이미지가 없을 경우 빈 배열 설정
	    }
	    
		model.addAttribute("ndto",ndto);
		model.addAttribute("user_id", session.getAttribute("user_id").toString());
		return "client/notice/notice_content";
	}

	@Override
	public String notice_update(HttpServletRequest request, 
			Model model,
			HttpSession session)
	{
		
		String notice_id=request.getParameter("notice_id");
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) 
		{
			session_user_id=session.getAttribute("user_id").toString();
		
		NoticeDto ndto=mapper.notice_content(notice_id);
		String img=ndto.getImg();
		String[] imgs=ndto.getImg().split("/");

		
		model.addAttribute("imgs",imgs);
		model.addAttribute("ndto",ndto);
		return "/client/notice/notice_update";
	    }
	    else
	    {
	    	return "redirect:/main/login";
	    }
	}

	@Override
	public String notice_updateOk(NoticeDto ndto, 
			HttpServletRequest request, 
			MultipartHttpServletRequest multi,
			HttpSession session) throws Exception 
	{
		System.out.println(ndto);
		String user_id=request.getParameter("user_id");
		String notice_id=request.getParameter("notice_id");
	    Iterator<String> imsi = multi.getFileNames();  // 파일 이름 가져오기 위한 반복자
	    
	    if(session.getAttribute("user_id")!=null) 
	    {
			user_id=session.getAttribute("user_id").toString();
			String fname="";
			while(imsi.hasNext()) 
			{
	        String name = imsi.next();  // 파일 이름 가져오기    
	        MultipartFile file = multi.getFile(name);
	        if (!file.isEmpty()) 
	        {
	            String preName = file.getOriginalFilename();
	            String str = ResourceUtils.getFile("classpath:static/client/notice").toPath().toString() + "/" + preName;            
	            str = NoticeUtils.getFileName(preName, str);
	            String saveFname = str.substring(str.lastIndexOf("/") + 1);
	            fname+=saveFname+"/";  // 새로운 파일 이름으로 교체
	            Path path = Paths.get(str);
	            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
	        }
	        
	    }
	    String safeimgs=request.getParameter("safeimg");
	    fname=fname+safeimgs;
		fname=fname.replace("null/","" );
	    
		ndto.setImg(fname);  
		
		String delimgs=request.getParameter("delimg");
		String[] deleteimgs=delimgs.split("/");
		String path=ResourceUtils.getFile("classpath:static/client/notice").toPath().toString();
		for(int i=0; i<deleteimgs.length; i++) {
			File file=new File(path+"/"+deleteimgs[i]);
			if(file.exists()) {
				file.delete();
			}
		}
		
		mapper.notice_updateOk(ndto);
		return "redirect:/notice_content?notice_id="+notice_id;
	    }
	 else 
	 {
			return "redirect:/main/login"; 
	 }
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
