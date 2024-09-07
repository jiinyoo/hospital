package kr.co.hospital.client.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.WorkdayDto;
import kr.co.hospital.client.dto.ReserveDto;
import kr.co.hospital.client.mapper.ReserveMapper;

@Service
@Qualifier("res")
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveMapper mapper;

	@Override
	public String reserve(HttpServletRequest request,Model model,HttpSession session) {
		if(session.getAttribute("user_id")==null) {
			String user_id=request.getParameter("user_id")==null?"":request.getParameter("user_id");
			String user_phone=request.getParameter("user_phone")==null?"":request.getParameter("user_phone");
			String user_jumin=request.getParameter("user_jumin")==null?"":request.getParameter("user_jumin");
			if(user_id.isEmpty() || user_phone.isEmpty() || user_jumin.isEmpty()) {
				return "redirect:/main/beforeReserve";				
			} else {
				model.addAttribute("user_jumin",user_jumin);
				model.addAttribute("user_id",user_id);
				model.addAttribute("user_phone",user_phone);
			}
		}
			model.addAttribute("doctor",mapper.getDoctor());
			model.addAttribute("part",mapper.getPart());
			
			return "/client/reserve/reserve";			
	}

	@Override
	public ArrayList<HashMap> chkpart(HttpServletRequest request) {
		String doc_part=request.getParameter("doc_part");
		return mapper.chkpart(doc_part);
	}

	@Override
	public HashMap chkDoc(HttpServletRequest request) {
		String doc_id=request.getParameter("doc_id");
		List<Integer> workingday=mapper.getWorkingday(doc_id);
		String getPart=mapper.chkDoc(doc_id);
		HashMap chkDoc=new HashMap<>();
		chkDoc.put("workingday", workingday);
		chkDoc.put("getPart", getPart);
		return chkDoc;
	}

	@Override
	public Map getCal(HttpServletRequest request) {
		int year=Integer.parseInt(request.getParameter("year")); 
		int month=Integer.parseInt(request.getParameter("month"));
		
		Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR, year);
	    cal.set(Calendar.MONTH, month - 1);
	    int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

	    // 해당 월의 첫 번째 요일 계산
	    cal.set(Calendar.DAY_OF_MONTH, 1);
	    int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK) - 1; // 일요일부터 0

	    // 현재 날짜
	    Calendar today = Calendar.getInstance();
	    int todayYear = today.get(Calendar.YEAR);
	    int todayMonth = today.get(Calendar.MONTH) + 1;
	    int todayDay = today.get(Calendar.DAY_OF_MONTH);

	    // JSON 형태로 데이터 반환
	    Map<String, Object> response = new HashMap<>();
	    response.put("year", year);
	    response.put("month", month);
	    response.put("lastDay", lastDay);
	    response.put("firstDayOfWeek", firstDayOfWeek);
	    response.put("todayYear", todayYear);
	    response.put("todayMonth", todayMonth);
	    response.put("todayDay", todayDay);
		return response;
	}

	@Override
	public HashMap chkDate(HttpServletRequest request) {
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		int day=Integer.parseInt(request.getParameter("day"));
		LocalDate date=LocalDate.of(year, month, day);
		String doc_id=request.getParameter("doc_id");
		int dayValue=date.getDayOfWeek().getValue();
		if(dayValue==7) {
			dayValue=0;
		}
		
		ArrayList<LocalTime> list=new ArrayList<>();
		WorkdayDto time=mapper.getTime(doc_id,dayValue);
		if(time!=null) {
			LocalTime start=time.getStart_time();
			LocalTime end=time.getEnd_time();		
			while(start.isBefore(end)) {
				list.add(start);
				start=start.plusMinutes(30);
			}
		}
		ArrayList<ReserveDto> isReserve=mapper.isReserve(doc_id, date);
		ArrayList<LocalTime> reservedTimes = new ArrayList<>();
	    for (ReserveDto reserve : isReserve) {
	        reservedTimes.add(reserve.getRes_time()); // ReserveDto에서 LocalTime 추출
	    }
	    
	    LocalTime lunchStart=LocalTime.of(13, 0);
	    LocalTime lunchEnd=LocalTime.of(14, 0);
	    while(lunchStart.isBefore(lunchEnd)) {
	    	reservedTimes.add(lunchStart);
	    	lunchStart=lunchStart.plusMinutes(30);
	    }
	    
	    HashMap response=new HashMap<>();
	    response.put("reservelist", list);
	    response.put("reservedTime", reservedTimes);
	    
		
		return response;
	}

	@Override
	public String reserveOk(ReserveDto rdto,HttpSession session) {
		if(session.getAttribute("user_id")==null) {
			
		}
		return "redirect:index";
	}

	@Override
	public String beforeReserve(ReserveDto rdto) {
		
		return "/client/reserve/beforeReserve";
	}
	
}
