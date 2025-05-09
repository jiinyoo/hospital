package kr.co.hospital.client.service;



import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.ProgramReserveDto;

public interface ProgramReserveSevice {

	String ProgramReserve(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response);

	String calendar(HttpServletRequest request, Model model, HttpSession session);

	String preserview(HttpServletRequest request, Model model, HttpSession session);

	String preserveOk(ProgramReserveDto prdto, HttpServletRequest request, Model model, HttpSession session);

	String memberpreserve(ProgramReserveDto prdto,HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response);

	

}
