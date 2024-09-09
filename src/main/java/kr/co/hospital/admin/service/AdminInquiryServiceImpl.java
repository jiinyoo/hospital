package kr.co.hospital.admin.service;

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
import kr.co.hospital.admin.dto.AdminInquiryDto;
import kr.co.hospital.admin.mapper.AdminInquiryMapper;
import kr.co.hospital.util.InquiryFileUtils;

@Service
@Qualifier("AISI")
public class AdminInquiryServiceImpl implements AdminInquiryService {
	
	@Autowired
	AdminInquiryMapper mapper;

	@Override
	public String inquirylist(HttpSession session, Model model, HttpServletResponse response) {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
			int state=mapper.getState(session_user_id);
			System.out.println("state값"+state);
			if(state==1 || state==2) {
				ArrayList<HashMap> imapAll=mapper.inquirylist();
				model.addAttribute("imapAll",imapAll);
				model.addAttribute("session_user_id",session_user_id);
				return "/admin/inquiry/list";
			} else {
				return "redirect:/main/index";
			} 
		}else {
			Cookie cookie=new Cookie("url","/admin/inquiry/list");
			cookie.setMaxAge(60*60*24);
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/main/login";
		}
	}

	@Override
	public String readnum(HttpServletRequest request,HttpSession session) {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
			int state=mapper.getState(session_user_id);
			System.out.println("state값"+state);
			if(state==1 || state==2) {
				String inq_id=request.getParameter("inq_id");
				mapper.readnum(inq_id);
				return "redirect:/admin/inquiry/content?inq_id="+inq_id;
			} else {
				return "redirect:/main/index";
			} 
		}else {
			return "redirect:/main/login";
		}
		
	}

	@Override
	public String write(HttpServletRequest request, HttpSession session, Model model) {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
			int state=mapper.getState(session_user_id);
			if(state==1 || state==2) {
				String bimil=request.getParameter("bimil");
				String group_order=request.getParameter("group_order");
				String part=request.getParameter("part");
				String inq_id=request.getParameter("inq_id");
				mapper.updateanswer(inq_id);
				String origin_user_id=request.getParameter("origin_user_id");
				model.addAttribute("bimil",bimil);
				model.addAttribute("group_order",group_order);
				model.addAttribute("part",part);
				model.addAttribute("origin_user_id",origin_user_id);
				return "/admin/inquiry/write";
			} else {
				return "redirect:/main/index";
			} 
		}else {
			return "redirect:/main/login";
		}
	}

	@Override
	public String writeOk(AdminInquiryDto aidto, MultipartHttpServletRequest multi, HttpSession session) throws Exception {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
			int state=mapper.getState(session_user_id);
			System.out.println("state값"+state);
			if(state==1 || state==2) {
				aidto.setUser_id(session_user_id);
				Iterator<String> imsi=multi.getFileNames();
				
				String fname=""; //서버에 저장된 파일명
				
				while(imsi.hasNext()) {
					String name=imsi.next();
					MultipartFile file=multi.getFile(name);
					if(!file.isEmpty()) {
						String preName=file.getOriginalFilename();
						String str=ResourceUtils.getFile("classpath:static/client/inquiryfile").toPath().toString()+"/"+preName;
						//System.out.println("되나"+str.substring(0,str.lastIndexOf("/")));
						str=InquiryFileUtils.getFileName(preName,str);
						String saveFname=str.substring(str.lastIndexOf("/")+1);
						fname=fname+saveFname+"/";
						Path path=Paths.get(str);
						Files.copy(file.getInputStream(),path,StandardCopyOption.REPLACE_EXISTING);
					}
				}
				aidto.setTitle("[답변]"+aidto.getTitle());
				aidto.setImg(fname);
				mapper.writeOk(aidto);
				return "redirect:/admin/inquiry/list";
			} else {
				return "redirect:/main/index";
			} 
		}else {
			return "redirect:/main/login";
		}
	}

}
