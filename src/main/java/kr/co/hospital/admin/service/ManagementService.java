package kr.co.hospital.admin.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.ManagementDto;

public interface ManagementService {
	 public String List(Model model);
     public String updateState(ManagementDto mdto,HttpSession session);

}
