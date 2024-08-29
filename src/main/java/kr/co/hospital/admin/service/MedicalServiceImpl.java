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
		session.setAttribute("admin","asdf");
		if(session.getAttribute("admin")!=null) {
			String userid=session.getAttribute("admin").toString();
			if(userid.equals("admin")) {
				pdto=mapper.getPatient("");
				for(int i=0;i<pdto.size();i++) {
					String user_name=mapper.getName(pdto.get(i).getUser_id());
					pdto.get(i).setUser_name(user_name);
					String doc_name=mapper.getDocName(pdto.get(i).getDoc_id());
				}
			} else {
				String doc_id=mapper.getDocid(userid);
				pdto=mapper.getPatient(doc_id);
				for(int i=0;i<pdto.size();i++) {
					String user_name=mapper.getName(pdto.get(i).getUser_id());
					pdto.get(i).setUser_name(user_name);
				}
			}
		} else {
			return "redirect:/client/main/index";
		}
		model.addAttribute("pdto",pdto);
		
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
		
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		
		return "/admin/medical/patient";
	}
}
