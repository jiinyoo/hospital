package kr.co.hospital.client.service;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.ReserveDto;

public interface ReserveService {

	public String reserve(HttpServletRequest request,Model model,HttpSession session);
	public ArrayList<HashMap> chkpart(HttpServletRequest request);
	public HashMap chkDoc(HttpServletRequest request);
	public Map getCal(HttpServletRequest request);
	public HashMap chkDate(HttpServletRequest request);
	public String reserveOk(ReserveDto rdto,HttpSession session,HttpServletResponse response);
	public String beforeReserve(ReserveDto rdto);
}
