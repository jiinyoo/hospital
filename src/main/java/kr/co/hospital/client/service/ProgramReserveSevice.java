package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface ProgramReserveSevice {

	String ProgramReserve(HttpServletRequest request, Model model);

	String calendar(HttpServletRequest request, Model model);

}
