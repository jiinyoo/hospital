package kr.co.hospital.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
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
	public String mlist(Model model,HttpServletRequest request) {
		
		String stype=request.getParameter("stype")==null?"m.user_name":request.getParameter("stype");
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
		ArrayList<HashMap> mdto=mapper.mlist(index, stype, sword);
		 
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("mdto",mdto);
		
		return "/admin/medical/afterMedi";
	}

	@Override
	public String patient(HttpSession session,Model model,HttpServletRequest request) {
		ArrayList<ReserveDto> pdto=null;
		if(session.getAttribute("user_id")!=null) {
			String userid=session.getAttribute("user_id").toString();
			if(mapper.getState(userid)==2) {
				pdto=mapper.getPatients("");
				for(int i=0;i<pdto.size();i++) {
					String user_name=mapper.getName(pdto.get(i).getUser_id());
					pdto.get(i).setUser_name(user_name);
					String doc_name=mapper.getDocName(pdto.get(i).getDoc_id());
					pdto.get(i).setDoc_name(doc_name);
				}
			} else if(mapper.getState(userid)==1) {
				String doc_id=mapper.getDocid(userid);
				pdto=mapper.getPatients(doc_id);
				for(int i=0;i<pdto.size();i++) {
					String user_name=mapper.getName(pdto.get(i).getUser_id());
					pdto.get(i).setUser_name(user_name);
				}
			} else {
				return "redirect/main";
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
		System.out.println(res_id);
		if(session.getAttribute("user_id")!=null) {
			String docName=session.getAttribute("user_id").toString();
			if(docName.equals("admin") || docName.equals(rdto.getDoc_name())) {
				String username=mapper.getName(rdto.getUser_id());
				rdto.setUser_name(username);
				String userjumin=rdto.getUser_jumin();
				String birth=userjumin.substring(0,8);
				userjumin=birth+"*******";
				rdto.setUser_jumin(userjumin);
				
				model.addAttribute("rdto",rdto);
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
				mapper.medicalOk(mdto);
				mapper.upState(res_code);
			} else {
				return "redirect:/admin/medical/patient";
			}
		}
		return "redirect:/admin/medical/patient";
	}
}
