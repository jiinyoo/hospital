package kr.co.hospital.admin.service;

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
import kr.co.hospital.admin.dto.AdminNoticeDto;
import kr.co.hospital.admin.mapper.AdminNoticeMapper;
import kr.co.hospital.admin.service.AdminMainService;

import kr.co.hospital.util.FileUtils;
import kr.co.hospital.util.NoticeUtils;

@Service
@Qualifier("admin_noti")
public class AdminNoticeServiceImpl  implements AdminNoticeService {
	
	@Autowired
	private AdminNoticeMapper mapper;
	
	@Override
	public String admin_notice_write(HttpSession session, 
			Model model)
	{
		if(session.getAttribute("user_id")!=null)
		{
			String user_id=session.getAttribute("user_id").toString();
			model.addAttribute("user_id",user_id);
			return "/admin/admin_notice/admin_notice_write";
		}
		else
		{
			return "redirect:/main/login";
		}
	}
	
	@Override
	public String admin_notice_writeOk(AdminNoticeDto ndto,
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
		
		mapper.admin_notice_writeOk(ndto);
		return "redirect:/admin/admin_notice/admin_notice_list";
		}
		else
		{
			return "redirect:/main/login";
		}
	}

	@Override
	public String admin_notice_list(HttpServletRequest request,
			Model model,
			HttpSession session, 
			HttpServletResponse response) 
	{
		String user_id=(String) session.getAttribute("user_id");
	    
	    if(user_id!=null) 
	    {
	    	int page=request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
		    int pageSize=8; // 한 페이지에 보여줄 데이터 수
		    int totalNotices=mapper.getTotalNoticeCount(); // 전체 공지사항 개수를 가져오는 메서드 필요

		    // 전체 페이지 수 계산
		    int chong=(totalNotices%pageSize==0)?totalNotices/pageSize : (totalNotices/pageSize)+1;

		    // 페이지 시작과 끝 설정
		    int pstart=(page-1)/8*8+1;
		    int pend=pstart+7;
		    if (pend>chong) 
		    {
		        pend=chong;
		    }

		    // 시작 index 설정
		    int index=(page-1)*pageSize;

		    // 페이지에 맞는 데이터 가져오기
		    ArrayList<HashMap> map=mapper.admin_notice_list(index,pageSize); // 페이지별 데이터 가져오는 메서드
		    
		    model.addAttribute("nmapAll",map);
		    model.addAttribute("page",page);
		    model.addAttribute("pstart",pstart);
		    model.addAttribute("pend",pend);
		    model.addAttribute("chong",chong);
		
			return "/admin/admin_notice/admin_notice_list";
		}	
		else
		{
			Cookie cookie = new Cookie("url", "/admin_notice_list");
			cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 기간 (초 단위) - 여기서는 1일
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/main/login";
		}
	}

	@Override
	public String admin_notice_readnum(HttpServletRequest request) 
	{
		String notice_id=request.getParameter("notice_id");
		mapper.admin_notice_readnum(notice_id);
		return "redirect:/admin/admin_notice/admin_notice_content?notice_id="+notice_id;
	}

	@Override
	public String admin_notice_content(HttpServletRequest request, 
			HttpSession session,
			Model model) 
	{
		
		String notice_id=request.getParameter("notice_id");
		
		AdminNoticeDto ndto=mapper.admin_notice_content(notice_id);
		if (ndto == null) {
	        System.err.println("해당 notice_id에 대한 데이터를 찾을 수 없습니다: " + notice_id);
	        return "redirect:/error_page";  // 에러 페이지로 리다이렉트
	    }
		System.out.println("공지사항 데이터: " + ndto);
		 // 이미지가 null이 아니고 빈 값이 아닌 경우, '/'로 구분하여 imgs 배열에 저장
	    if (ndto.getImg() != null && !ndto.getImg().isEmpty()) {
	        String[] imgs = ndto.getImg().split("/");

	        // imgs 배열이 올바르게 생성되었는지 디버깅 로그 출력
	        System.out.println("imgs 배열: " + Arrays.toString(imgs));
	        ndto.setImgs(imgs);  // NoticeDto 객체에 imgs 배열 설정
	    } else {
	        ndto.setImgs(new String[0]);  // 이미지가 없을 경우 빈 배열 설정
	    }
	    
	    ndto.setContent(ndto.getContent().replace("\r\n", "<br>"));
		model.addAttribute("ndto",ndto);
		return "/admin/admin_notice/admin_notice_content";
	}

	@Override
	public String admin_notice_update(HttpServletRequest request, 
			Model model,
			HttpSession session)
	{
		
		String notice_id=request.getParameter("notice_id");
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) 
		{
			session_user_id=session.getAttribute("user_id").toString();
		
		AdminNoticeDto ndto=mapper.admin_notice_content(notice_id);
		String img=ndto.getImg();
		String[] imgs=ndto.getImg().split("/");
		
		model.addAttribute("img",img);
		model.addAttribute("imgs",imgs);
		model.addAttribute("ndto",ndto);
		return "/admin/admin_notice/admin_notice_update";
	    }
	    else
	    {
	    	return "redirect:/main/login";
	    }
	}

	@Override
	public String admin_notice_updateOk(AdminNoticeDto ndto, 
			HttpServletRequest request, 
			MultipartHttpServletRequest multi,
			HttpSession session) throws Exception 
	{
		//System.out.println(ndto);
		String user_id=null;
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
		
		mapper.admin_notice_updateOk(ndto);
		return "redirect:/admin/admin_notice/admin_notice_content?notice_id="+notice_id;
	    }
	 else 
	 {
			return "redirect:/main/login"; 
	 }
	}

	@Override
	public String admin_notice_delete(HttpServletRequest request) 
	{
		String user_id=request.getParameter("user_id");
		String notice_id=request.getParameter("notice_id");
			
		mapper.admin_notice_delete(user_id,notice_id);
		return "redirect:/admin/admin_notice/admin_notice_list";
	}

}
