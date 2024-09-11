package kr.co.hospital.client.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.client.mapper.ProgramReserveMapper;

@Service
@Qualifier("CPRC")
public class ProgramReserveServiceImpl implements ProgramReserveSevice {
	@Autowired
	ProgramReserveMapper mapper;

	@Override
	public String ProgramReserve(HttpServletRequest request, Model model) {
		int year,month;
		if(request.getParameter("year")==null) {
			LocalDate today=LocalDate.now();
			year=today.getYear();
			month=today.getMonthValue();
		} else {
			year=Integer.parseInt(request.getParameter("year"));
			month=Integer.parseInt(request.getParameter("month"));
			if(month==0) {
				month=12;
				year=year-1;
			}
			
			if(month==13) {
				month=1;
				year=year+1;
			}
		}
		
		return null;
	}
}
