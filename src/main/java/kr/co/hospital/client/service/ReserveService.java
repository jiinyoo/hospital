package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface ReserveService {

	public String reserve(HttpServletRequest request,Model model);

}
