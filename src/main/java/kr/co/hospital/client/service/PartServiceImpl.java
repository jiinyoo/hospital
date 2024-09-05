package kr.co.hospital.client.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.admin.dto.DoctorDto;
import kr.co.hospital.client.mapper.PartMapper;

@Service
@Qualifier("part")
public class PartServiceImpl implements PartService{

	@Autowired
	private PartMapper mapper;

	@Override
	public String part(HttpServletRequest request,Model model) {
		String part=request.getParameter("part");
		ArrayList<DoctorDto> dlist=mapper.dlist(part);
		for(DoctorDto his:dlist) {
			his.setHistorys(his.getDoc_history().split("/")); 
		}
		model.addAttribute("dlist",dlist);
		return "/client/info/part";
	}
}
