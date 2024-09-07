package kr.co.hospital.client.service;

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
		}
			ArrayList<HashMap> imapAll=mapper.inquirylist();
			model.addAttribute("imapAll",imapAll);
			model.addAttribute("session_user_id",session_user_id);
			
			Cookie cookie=new Cookie("url","/inquiry/list");
			cookie.setMaxAge(60*60*24);
			cookie.setPath("/");
			response.addCookie(cookie);
			
			return "/client/inquiry/list";
		
	}

	@Override
	public String readnum(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
