package kr.co.hospital.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.admin.dto.MedicalDto;
import kr.co.hospital.admin.mapper.MedicalMapper;

@Service
@Qualifier("medi")
public class MedicalServiceImpl implements MedicalService {

	@Autowired
	private MedicalMapper mapper;

	@Override
	public String mlist(Model model,HttpServletRequest request) {
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
		
		ArrayList<MedicalDto> mdto=mapper.mlist(index,stype,sword);
		for(int i=0;i<mdto.size();i++) {
			mdto.get(i).setUser_jumin(mapper.getJumin(mdto.get(i).getUser_id()));
			System.out.println(mdto.get(i).getUser_jumin());
		}
		 
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("mdto",mdto);
		return "/admin/medical/afterMedi";
	}
}
