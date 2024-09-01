package kr.co.hospital.client.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

public interface BoardService {

	String boardwrite( HttpSession session,Model model);

}
