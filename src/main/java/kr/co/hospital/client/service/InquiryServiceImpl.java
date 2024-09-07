package kr.co.hospital.client.service;

import java.io.File;
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
import kr.co.hospital.client.dto.InquiryDto;
import kr.co.hospital.client.mapper.InquiryMapper;
import kr.co.hospital.client.service.*;
import kr.co.hospital.util.FileUtils;

@Service
@Qualifier("ISI")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryMapper mapper;
	
	@Override
	public String writeOk(InquiryDto idto, MultipartHttpServletRequest multi, HttpSession session) throws Exception {
		
		if(session.getAttribute("user_id")!=null) {
			String user_id=session.getAttribute("user_id").toString();
			idto.setUser_id(user_id);
			Iterator<String> imsi=multi.getFileNames();
			
			String fname=""; //서버에 저장된 파일명
			
			while(imsi.hasNext()) {
				String name=imsi.next();
				MultipartFile file=multi.getFile(name);
				if(!file.isEmpty()) {
					String preName=file.getOriginalFilename();
					String str=ResourceUtils.getFile("classpath:static/client/inquiryfile").toPath().toString()+"/"+preName;
					//System.out.println("되나"+str.substring(0,str.lastIndexOf("/")));
					str=FileUtils.getFileName(preName,str);
					System.out.println("str"+str);
					String saveFname=str.substring(str.lastIndexOf("/")+1);
					fname=fname+saveFname+"/";
					Path path=Paths.get(str);
					Files.copy(file.getInputStream(),path,StandardCopyOption.REPLACE_EXISTING);
				}
			}
			idto.setImg(fname);
			int group_order=mapper.groupNumber();
			idto.setGroup_order(group_order);
			mapper.writeOk(idto);
			return "redirect:/inquiry/list";
		}else {
			return "redirect:/main/login";
		}
		
	}

	@Override
	public String list(HttpSession session,Model model,HttpServletResponse response) {
		
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
			ArrayList<HashMap> imapAll=mapper.inquirylist();
			model.addAttribute("imapAll",imapAll);
			model.addAttribute("session_user_id",session_user_id);
			return "/client/inquiry/list";
		}else {
			Cookie cookie=new Cookie("url","/inquiry/list");
			cookie.setMaxAge(60*60*24);
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/main/login";
		}
	}

	@Override
	public String readnum(HttpServletRequest request) {
		String inq_id=request.getParameter("inq_id");
		mapper.readnum(inq_id);
		return "redirect:/inquiry/content?inq_id="+inq_id;
	}

	@Override
	public String content(HttpServletRequest request, Model model, HttpSession session) {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
		}
		String inq_id=request.getParameter("inq_id");
		InquiryDto idto=mapper.content(inq_id);
		String[] imgs=idto.getImg().split("/");
		idto.setImgs(imgs);
		model.addAttribute("idto",idto);
		model.addAttribute("session_user_id",session_user_id);
		return "client/inquiry/content";
	}

	@Override
	public String delete(HttpServletRequest request, HttpSession session) throws Exception {
		String inq_id=request.getParameter("inq_id");
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
			//삭제할 파일명들을 가져와서 스플릿한다.
			InquiryDto idto=mapper.content(inq_id);
			//포문을 돌면서
			String[] imgs=idto.getImg().split("/");
			String path=ResourceUtils.getFile("classpath:static/client/inquiryfile").toPath().toString();
			for(int i=0; i<imgs.length; i++) {
				File file=new File(path+"/"+imgs[i]);
				if(file.exists()) {
					file.delete();
				}
			}
			//파일객체를 생성하여 패스에 파일이 있으면
			//File file=new File(path+"/"+delimgs[i])
			//파일을 지운다.
			mapper.delete(inq_id);
			return "redirect:/inquiry/list";
			
		}else {
			return "redirect:/main/login";
		}
	}

}
