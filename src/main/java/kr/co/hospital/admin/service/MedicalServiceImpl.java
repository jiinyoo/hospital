package kr.co.hospital.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.MedicalDto;
import kr.co.hospital.admin.dto.ReserveDto;
import kr.co.hospital.admin.mapper.MedicalMapper;

@Service
@Qualifier("medi")
public class MedicalServiceImpl implements MedicalService {

	@Autowired
	private MedicalMapper mapper;

	@Override
	public String afterMedi(Model model,HttpServletRequest request,HttpSession session,
			HttpServletResponse response) {
		if(session.getAttribute("user_id")==null) {
			Cookie url=new Cookie("url", "/admin/medical/afterMedi");
			url.setMaxAge(500);
			url.setPath("/");
			response.addCookie(url);
			return "redirect:/main/login";
		} else {
			String userid=session.getAttribute("user_id").toString();
			if(mapper.getState(userid)!=0) {
				String stype=request.getParameter("stype")==null?"user_name":request.getParameter("stype");
				String sword=request.getParameter("sword")==null?"":request.getParameter("sword");
				int page=request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
				int index=(page-1)*10;
				int p=(page-1)/10;
				int pstart=p*10+1;
				int pend=pstart+9;
				int chong=mapper.getChong(stype, sword);
				if(chong<pend) {
					pend=chong;
				}
				ArrayList<HashMap> mdto=mapper.afterMedi(index, stype, sword);
				for(HashMap member : mdto) {
					String jumin=member.get("user_jumin").toString();
					String birth=jumin.substring(0,8);
					jumin=birth+"******";
					member.put("user_jumin", jumin);
				}
				 
				model.addAttribute("page",page);
				model.addAttribute("pstart",pstart);
				model.addAttribute("pend",pend);
				model.addAttribute("chong",chong);
				model.addAttribute("mdto",mdto);
				
				return "/admin/medical/afterMedi";
			} else {
				return "redirect:/main/index";
			}
		}
	}
	
	@Override
	public String afterMediView(HttpServletRequest request,Model model,HttpSession session,
			HttpServletResponse response) {
		String res_code=request.getParameter("res_code");
		MedicalDto mdto=mapper.mediView(res_code);
		
		if(session.getAttribute("user_id")==null) {
			Cookie url=new Cookie("url", "/admin/medical/afterMedi");
			url.setMaxAge(500);
			url.setPath("/");
			response.addCookie(url);
			return "redirect:/main/login";
		} else {
			String userid=session.getAttribute("user_id").toString();
			if(mapper.getState(userid)!=0) {
				mdto.setMedi_types(mdto.getMedi_type().split("/"));
				model.addAttribute("mdto",mdto);
				return "/admin/medical/afterMediView";				
			} else {
				return "redirect:/main/index";
			}
		}
	}

	@Override
	public String patient(HttpSession session,Model model,HttpServletRequest request) {
		ArrayList<ReserveDto> pdto=null;
		if(session.getAttribute("user_id")!=null) {
			String userid=session.getAttribute("user_id").toString();
			int state=mapper.getState(userid);
			model.addAttribute("state",state);
			if(mapper.getState(userid)==2) {	// 관리자
				pdto=mapper.getPatients("");
				for(int i=0;i<pdto.size();i++) {
					String user_name=mapper.getName(pdto.get(i).getUser_id());
					if(user_name==null) {
						pdto.get(i).setUser_name(pdto.get(i).getUser_id()+"/<span style='font-size: smaller;'>비회원</span>");
					} else {
						pdto.get(i).setUser_name(user_name);						
					}
					String doc_name=mapper.getDocName(pdto.get(i).getDoc_id());
					pdto.get(i).setDoc_name(doc_name);
					String jumin=pdto.get(i).getUser_jumin();
					String birth=jumin.substring(0,8);
					jumin=birth+"******";
					pdto.get(i).setUser_jumin(jumin);
				}
			} else if(mapper.getState(userid)==1) {		// 의사
				String doc_id=mapper.getDocid(userid);
				pdto=mapper.getPatients(doc_id);
				for(int i=0;i<pdto.size();i++) {
					String user_name=mapper.getName(pdto.get(i).getUser_id());
					if(user_name==null) {
						pdto.get(i).setUser_name(pdto.get(i).getUser_id()+"/<span style='font-size: smaller;'>비회원</span>");
					} else {
						pdto.get(i).setUser_name(user_name);						
					}
					String jumin=pdto.get(i).getUser_jumin();
					String birth=jumin.substring(0,8);
					jumin=birth+"******";
					pdto.get(i).setUser_jumin(jumin);
				}
			} else {
				return "redirect:/main/index";
			}
		} else {
			return "redirect:/main/login";
		}
		model.addAttribute("pdto",pdto);
		
		return "/admin/medical/patient";
	}

	@Override
	public String patientView(HttpServletRequest request, HttpSession session, Model model) {
		String res_id=request.getParameter("res_id");
		ReserveDto rdto=mapper.getPatient(res_id);
	//	System.out.println(res_id);
		if(session.getAttribute("user_id")!=null) {
			String userid=session.getAttribute("user_id").toString();
			if(mapper.getState(userid)==2 || mapper.getDocid(userid).equals(mapper.getDocidtoRes(res_id))) {
				String username=mapper.getName(rdto.getUser_id());
				if(username==null) {
					rdto.setUser_name(rdto.getUser_id());
				} else {
					rdto.setUser_name(username);					
				}
				String userjumin=rdto.getUser_jumin();
				String birth=userjumin.substring(0,8);
				userjumin=birth+"*******";
				rdto.setUser_jumin(userjumin);
				
				model.addAttribute("rdto",rdto);
			} else {
				return "redirect:/main/index";
			}
		} else {
			return "redirect:/admin/medical/patient";
		}
		return "/admin/medical/patientView";
	}

	@Override
	public String medicalOk(HttpServletRequest request,MedicalDto mdto,HttpSession session) {
		int doc_id=Integer.parseInt(request.getParameter("doc_id"));
		String res_code=request.getParameter("res_code");
		if(session.getAttribute("user_id")==null) {
			return "redirect:/main";
		} else {
			String userid=session.getAttribute("user_id").toString();
			if(userid.equals(mapper.getDocUserid(doc_id))) {
				mdto.setDoc_name(mapper.getDocName(doc_id));		
				
				System.out.println(mdto);
				mapper.medicalOk(mdto);
				mapper.upState(res_code);
			} else {
				return "redirect:/admin/medical/patient";
			}
		}
		return "redirect:/admin/medical/patient";
	}

	
}
