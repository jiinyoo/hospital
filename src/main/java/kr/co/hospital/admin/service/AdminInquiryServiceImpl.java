package kr.co.hospital.admin.service;

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
import kr.co.hospital.admin.dto.AdminInquiryDto;
import kr.co.hospital.admin.mapper.AdminInquiryMapper;
import kr.co.hospital.client.dto.InquiryDto;
import kr.co.hospital.util.InquiryFileUtils;

@Service
@Qualifier("AISI")
public class AdminInquiryServiceImpl implements AdminInquiryService {
	
	@Autowired
	AdminInquiryMapper mapper;

	@Override
	public String inquirylist(HttpSession session, Model model, HttpServletResponse response,HttpServletRequest request) {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
			int state=mapper.getState(session_user_id);
			System.out.println("state값"+state);
			if(state==1 || state==2) {
				int page=request.getParameter("page")!=null?Integer.parseInt(request.getParameter("page")):1;
				String stype=request.getParameter("stype")!=null?request.getParameter("stype"):"user_id";
				String sword=request.getParameter("sword")!=null?request.getParameter("sword"):"";
				
				int index=(page-1)*10;
				int pstart=page/10;
				if(page%10==0) {
					pstart=pstart-1;
				}
				pstart=(pstart*10)+1;
				int pend=pstart+9;
				
				int chong=mapper.getChong(stype,sword);
				
				if(pend>chong) {
					
					pend=chong;
				}
				
				ArrayList<HashMap> imapAll=mapper.inquirylist(index,stype,sword);
				model.addAttribute("imapAll",imapAll);
				model.addAttribute("session_user_id",session_user_id);
				model.addAttribute("page",page);
				model.addAttribute("pstart",pstart);
				model.addAttribute("pend",pend);
				model.addAttribute("chong",chong);
				model.addAttribute("stype",stype);
				model.addAttribute("sword",sword);
				
				
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
				
				String origin_user_id=request.getParameter("origin_user_id");
				model.addAttribute("inq_id",inq_id);
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
				mapper.updateanswer(aidto.getInq_id());
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

	@Override
	public String content(HttpServletRequest request, Model model, HttpSession session) {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			session_user_id=session.getAttribute("user_id").toString();
			int state=mapper.getState(session_user_id);
			if(state==1 || state==2) {
				String inq_id=request.getParameter("inq_id");
				AdminInquiryDto aidto=mapper.content(inq_id);
				aidto.setContent(aidto.getContent().replace("\r\n", "<br>"));
				String[] imgs=aidto.getImg().split("/");
				aidto.setImgs(imgs);
				model.addAttribute("aidto",aidto);
				model.addAttribute("session_user_id",session_user_id);
				return "/admin/inquiry/content";
			} else {
				return "redirect:/main/index";
			} 
		}else {
			return "redirect:/main/login";
		}
	}

	@Override
	public String delete(HttpServletRequest request, HttpSession session) throws Exception {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			String inq_id=request.getParameter("inq_id");
			session_user_id=session.getAttribute("user_id").toString();
			int state=mapper.getState(session_user_id);
			if(state==1 || state==2) {
				session_user_id=session.getAttribute("user_id").toString();
				//삭제할 파일명들을 가져와서 스플릿한다.
				AdminInquiryDto aidto=mapper.content(inq_id);
				//포문을 돌면서
				String[] imgs=aidto.getImg().split("/");
				String path=ResourceUtils.getFile("classpath:static/client/inquiryfile").toPath().toString();
				for(int i=0; i<imgs.length; i++) {
					File file=new File(path+"/"+imgs[i]);
					if(file.exists()) {
						file.delete();
					}
				}
			
				//만약에 id의 state값이 2이면
				if(aidto.getState().equals("2")) {
					//같은 grouporder를 가진 사람의 answer를 0으로 만든다.
					mapper.updatezero(aidto.getGroup_order());
					mapper.delete(inq_id);
				} 
				
				//만약에 id의 state값이 1이면
				if(aidto.getState().equals("1")) {
					//같은 grouporder를 가진 레코드를 같이 지워준다.
					mapper.samegroupdelete(aidto.getGroup_order());
				}
				
				
				
				System.out.println("왜 어드민의 inquirylist로 안가?");
				return "redirect:/admin/inquiry/list";
			} else {
				return "redirect:/main/index";
			} 
		}else {
			return "redirect:/main/login";
		}
	}

	@Override
	public String update(HttpServletRequest request, HttpSession session, Model model) {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			String inq_id=request.getParameter("inq_id");
			session_user_id=session.getAttribute("user_id").toString();
			int state=mapper.getState(session_user_id);
			if(state==1 || state==2) {
				session_user_id=session.getAttribute("user_id").toString();
				AdminInquiryDto aidto=mapper.content(inq_id);
				String img=aidto.getImg();
				String[] imgs=aidto.getImg().split("/");
				model.addAttribute("img",img);
				model.addAttribute("imgs",imgs);
				model.addAttribute("aidto",aidto);
			
				return "/admin/inquiry/update";
			} else {
				return "redirect:/main/index";
			} 
		}else {
			return "redirect:/main/login";
		}
	}

	@Override
	public String updateOk(InquiryDto idto, HttpServletRequest request, HttpSession session,
			MultipartHttpServletRequest multi) throws Exception {
		String session_user_id=null;
		if(session.getAttribute("user_id")!=null) {
			String inq_id=request.getParameter("inq_id");
			session_user_id=session.getAttribute("user_id").toString();
			String user_id=null;
			Iterator<String> imsi=multi.getFileNames();
			int state=mapper.getState(session_user_id);
			if(state==1 || state==2) {
				session_user_id=session.getAttribute("user_id").toString();
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
				String safeimgs=request.getParameter("safeimg");
				fname=fname+safeimgs;
				fname=fname.replace("null/","" );
				idto.setImg(fname);
				
				String delimgs=request.getParameter("delimg");
				String[] deleteimgs=delimgs.split("/");
				String path=ResourceUtils.getFile("classpath:static/client/inquiryfile").toPath().toString();
				for(int i=0; i<deleteimgs.length; i++) {
					File file=new File(path+"/"+deleteimgs[i]);
					if(file.exists()) {
						file.delete();
					}
				}
				mapper.updateOk(idto);
			
				return "redirect:/admin/inquiry/content?inq_id="+inq_id;
			} else {
				return "redirect:/main/index";
			} 
		}else {
			return "redirect:/main/login";
		}
	}
}
