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

		return "/client/program/programreserve";
	}

	@Override
	public String calendar(HttpServletRequest request, Model model) {
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

	    // 날짜 채우기
	    for (int day = 1; day <= lastDay; day++) {
	        LocalDate currentDate = LocalDate.of(year, month, day);
	        int dayOfWeek = currentDate.getDayOfWeek().getValue();

	        // 날짜와 "프로그램 있음" 표시를 위한 셀 내용 설정
	        String cellContent = "<span>" + day + "</span>";

	        // 첫째, 둘째, 셋째, 넷째 토요일에 "프로그램 있음" 표시
	        if (dayOfWeek == 6) { // 토요일인 경우
	            int weekOfMonth = (day + yoil - 1) / 7 + 1; // 주 번호 계산
	            if (weekOfMonth <= 4) {
	                cellContent += "<span class='program'>프로그램 있음</span>";
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
	}
}
