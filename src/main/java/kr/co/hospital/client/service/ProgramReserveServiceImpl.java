package kr.co.hospital.client.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.ProgramDto;
import kr.co.hospital.client.mapper.ProgramReserveMapper;

@Service
@Qualifier("CPRC")
public class ProgramReserveServiceImpl implements ProgramReserveSevice {
	@Autowired
	ProgramReserveMapper mapper;
	@Override
	public String ProgramReserve(HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response) {
		
		if(session.getAttribute("user_id")!=null) {
			
			return "/client/program/programreserve";
		} else {
			
			Cookie cookie=new Cookie("url","/program/programreserve");
			cookie.setMaxAge(60*60*24);
			cookie.setPath("/");
			response.addCookie(cookie);
			
			
			return "redirect:/main/login";
		}
		
		

	}

	
	private List<Integer> parseDayOfWeek(String dayOfWeekStr) {
	    List<Integer> daysOfWeek = new ArrayList<>();
	    if (dayOfWeekStr != null && !dayOfWeekStr.isEmpty()) {
	        String[] daysArray = dayOfWeekStr.split(",");
	        for (String day : daysArray) {
	            daysOfWeek.add(Integer.parseInt(day.trim()));
	        }
	    }
	    return daysOfWeek;
	}
	
	
	@Override
	public String calendar(HttpServletRequest request, Model model,HttpSession session) {
		
		
		if(session.getAttribute("user_id")!=null) {
			String user_id=session.getAttribute("user_id").toString();		
			
		    int year, month;
		    if (request.getParameter("year") == null) {
		        LocalDate today = LocalDate.now();
		        year = today.getYear();
		        month = today.getMonthValue();
		    } else {
		        year = Integer.parseInt(request.getParameter("year"));
		        month = Integer.parseInt(request.getParameter("month"));
		        if (month == 0) {
		            month = 12;
		            year = year - 1;
		        }
		        if (month == 13) {
		            month = 1;
		            year = year + 1;
		        }
		    }

		    LocalDate xday = LocalDate.of(year, month, 1);
		    int yoil = xday.getDayOfWeek().getValue();
		    if (yoil == 7) {
		        yoil = 0;
		    }

		    int lastDay = xday.lengthOfMonth(); // 해당 월의 마지막 날

		    // HTML로 달력 생성
		    StringBuilder sb = new StringBuilder();
	        sb.append("<table border='1'><thead><tr>");
	        String[] days = {"일", "월", "화", "수", "목", "금", "토"};
	        for (String day : days) {
	            sb.append("<th>").append(day).append("</th>");
	        }
	        sb.append("</tr></thead><tbody><tr>");

	        // 첫 주 빈칸 채우기
	        for (int i = 0; i < yoil; i++) {
	            sb.append("<td></td>");
	        }
	        
	        ArrayList<ProgramDto> programs = mapper.getPrograms();

	        // 달력에 프로그램 표시
	        for (int day = 1; day <= lastDay; day++) {
	            LocalDate currentDate = LocalDate.of(year, month, day);
	            int dayOfWeek = currentDate.getDayOfWeek().getValue();
	            if (dayOfWeek == 7) {
	                dayOfWeek = 0;
	            }

	            String cellContent = "<span>" + day + "</span>";

	            // 현재 날짜에 프로그램이 있는지 확인
	            for (ProgramDto program : programs) {
	                LocalDate startDate = LocalDate.parse(program.getStart_date());
	                LocalDate endDate = LocalDate.parse(program.getEnd_date());
	                LocalDate programDate = LocalDate.of(year, month, day);

	                if (programDate.isAfter(startDate.minusDays(1)) &&
	                    programDate.isBefore(endDate.plusDays(1)) &&
	                    parseDayOfWeek(program.getDay_of_week()).contains(dayOfWeek)) {
	                    cellContent += "<br><span>" + program.getPro_name() + "</span>";
	                }
	            }

	            sb.append("<td>").append(cellContent).append("</td>");
	            if ((day + yoil) % 7 == 0) {  // 주가 끝나면 줄 바꿈
	                sb.append("</tr><tr>");
	            }
	        }

	        // 남은 칸 빈칸으로 채우기
	        while ((lastDay + yoil) % 7 != 0) {
	            sb.append("<td></td>");
	            lastDay++;
	        }

	        sb.append("</tr></tbody></table>");

	        return sb.toString();  // HTML로 반환
			
		} else {
			return "로그인 하셔야 예약 달력을 보실 수 있습니다.";
		}
		
	}

	@Override
	public String preserview(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("user_id")!=null) {
			
			
			
			
		}else {
			
			
		}
		return "/client/program/programreserveview";
	}
}
