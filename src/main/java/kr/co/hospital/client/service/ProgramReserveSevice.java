package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface ProgramReserveSevice {

	String ProgramReserve(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response);

	String calendar(HttpServletRequest request, Model model, HttpSession session);

	String preserveOk(HttpServletRequest request, Model model, HttpSession session);

}
