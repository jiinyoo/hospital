package kr.co.hospital.client.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import kr.co.hospital.client.mapper.ReserveMapper;

@Service
@Qualifier("res")
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveMapper mapper;

	@Override
	public String reserve(HttpServletRequest request,Model model) {
		LocalDate today=LocalDate.now();
		int year=today.getYear();
		int month=today.getMonthValue();
		int day=today.getDayOfMonth();
		
		LocalDate xday=LocalDate.of(year, month, 1);
		int firstday=xday.getDayOfWeek().getValue();
		if(firstday==7) {
			firstday=0;
		}
		int chong=xday.lengthOfMonth();
		
		model.addAttribute("month",month);
		model.addAttribute("year",year);
		model.addAttribute("day",day);
		model.addAttribute("chong",chong);
		model.addAttribute("firstday",firstday);
		return "/client/reserve/reserve";
	}
}
