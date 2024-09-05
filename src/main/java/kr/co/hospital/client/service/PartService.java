package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface PartService {

	String part(HttpServletRequest request,Model model);

}
