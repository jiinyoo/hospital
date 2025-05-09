package kr.co.hospital.client.service;

import java.net.http.HttpResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import kr.co.hospital.client.dto.ProgramCapacityDto;
import kr.co.hospital.client.dto.ProgramDto;
import kr.co.hospital.client.dto.ProgramReserveDto;
import kr.co.hospital.client.mapper.ProgramReserveMapper;

@Service
@Qualifier("CPRC")
public class ProgramReserveServiceImpl implements ProgramReserveSevice {
	@Autowired
	ProgramReserveMapper mapper;
	@Override
	public String ProgramReserve(HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response) {
		
		if(session.getAttribute("user_id")!=null) {
			ArrayList<ProgramDto> plist=mapper.righttimeprograms();
			model.addAttribute("plist",plist);
			return "/client/program/programreserve";
		} else {
			
			Cookie cookie=new Cookie("url","/main/programreserve");
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
			LocalDate today=null;
		    int year, month;
		    if (request.getParameter("year") == null) {
		        today = LocalDate.now();
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
	        sb.append("<table border='1' style='text-align:left'><thead><tr>");
	        String[] days = {"일", "월", "화", "수", "목", "금", "토"};
	        for (String day : days) {
	            sb.append("<th>").append(day).append("</th>");
	        }
	        sb.append("</tr></thead><tbody><tr>");

	        // 첫 주 빈칸 채우기
	        for (int i = 0; i < yoil; i++) {
	            sb.append("<td></td>");
	        }
	        
	        
	        //프로그램들을 가져온다. 근데 워크데이를 월,화,수로 묶어서 하나로
	        ArrayList<ProgramDto> programs = mapper.getPrograms();
	        // 달력에 프로그램 표시
	        for (int day = 1; day <= lastDay; day++) {
	            LocalDate currentDate = LocalDate.of(year, month, day);
	            int dayOfWeek = currentDate.getDayOfWeek().getValue();
	            if (dayOfWeek == 7) {
	                dayOfWeek = 0;
	            }
	            today = LocalDate.now();
	            String cellContent = "<span>" + day + "</span>";
	            // 현재 날짜에 프로그램이 있는지 확인
	            for (ProgramDto program : programs) {
	                LocalDate startDate = LocalDate.parse(program.getStart_date());
	                LocalDate endDate = LocalDate.parse(program.getEnd_date());
	                LocalDate programDate = LocalDate.of(year, month, day);
	                
	                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	                String formattedDate = programDate.format(formatter);
	                Integer availableCapacity = mapper.getProCapacity(program.getPro_id(), formattedDate);
	            	if (availableCapacity == null) {
						availableCapacity = 0;
					}
	                //이 부분은 각각의 program_capacity테이블을 돌면서 그날의 pro_inwon-minus_inwon이 0보다 큰 경우만 
	                //달력에 잘 출력해야 함 그려면 각각의 day값에 program_capacity의 pro_inwon minus인원을 계산해야 하는 건데 이를 어떻게 할지 
	                
	                if (programDate.isAfter(startDate.minusDays(1)) &&
	                    programDate.isBefore(endDate.plusDays(1)) &&
	                    programDate.isAfter(today) &&
	                    availableCapacity > 0 && 
	                    parseDayOfWeek(program.getDay_of_week()).contains(dayOfWeek)) {
	                	cellContent += "<br><span id='programname'><a href='/main/programreserveview?pro_id=" 
	                		    + program.getPro_id() + "&reserve_date=" + formattedDate 
	                		    + "'>"+"★"+ program.getPro_name() + "</a></span><p>";
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
			
			String user_id=session.getAttribute("user_id").toString();
			String reserve_date=request.getParameter("reserve_date");
			
			int pro_id=Integer.parseInt(request.getParameter("pro_id"));
			
			
			ProgramDto pdto=mapper.getProgram(pro_id);
			ProgramCapacityDto pccdto=mapper.getProgramCapacityOne(reserve_date,pro_id);
			System.out.println(pccdto.getMinus_inwon());
			model.addAttribute("pccdto",pccdto);
			model.addAttribute("user_id",user_id);
			model.addAttribute("pdto",pdto);
			model.addAttribute("reserve_date",reserve_date);
			 
			
			
		}else {
			return "redirect:/main/index";
			
		}
		return "/client/program/programreserveview";
	}


	@Override
	public String preserveOk(ProgramReserveDto prdto,HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("user_id")!=null) {
			String user_id=session.getAttribute("user_id").toString();
			String reserve_date=request.getParameter("reserve_date");
			LocalDate today=LocalDate.now();
			String todaystring=today.toString().replace("-", "");
			//예약 번호 생성
			String pres_number="p"+todaystring;
			int num=mapper.getResNumber(pres_number)+1;
			pres_number=pres_number+String.format("%03d",num);
			prdto.setPres_number(pres_number);
			mapper.insertPreserve(prdto);
			mapper.pccminusinwonupdate(prdto.getP_inwon(),prdto.getPro_id(),reserve_date);
			ProgramDto pdto=mapper.getProgram(prdto.getPro_id());
			model.addAttribute("prdto",prdto);
			model.addAttribute("pdto",pdto);
			model.addAttribute("user_id",user_id);
			return "/client/program/preservecomplete";
		} else {
			return "redirect:/main/index";
		}
		
		
		
	}


	@Override
	public String memberpreserve(ProgramReserveDto prdto,HttpServletRequest request, Model model,HttpSession session, HttpServletResponse response) {
		if(session.getAttribute("user_id")!=null) {
			String user_id=session.getAttribute("user_id").toString();
			
			String p_inwon=(request.getParameter("p_inwon")!=null)?request.getParameter("p_inwon"):null;
			String pres_date=(request.getParameter("pres_date")!=null)?request.getParameter("pres_date"):null;
			String pro_id=(request.getParameter("pro_id")!=null)?request.getParameter("pro_id"):null;
			
			if(request.getParameter("pres_id")!=null) {
				int pres_id=Integer.parseInt(request.getParameter("pres_id"));
				mapper.changeState(pres_id);
				mapper.plusProgramCapacity(p_inwon,pro_id,pres_date);
				
			}
			
			int month=12;
			if(request.getParameter("month")!=null) {
				month=Integer.parseInt(request.getParameter("month"));
				
			}
			
			String start=null;
			if(request.getParameter("start")!=null) {
				start=request.getParameter("start");
			}
			
			String end=null;
			if(request.getParameter("end")!=null) {
				end=request.getParameter("end");
			}
			
			ArrayList<ProgramReserveDto> prlist=mapper.memberprogram(user_id);
			ArrayList<ProgramReserveDto> prlist2=mapper.oldmemberprogram(user_id, month, start ,end);
			model.addAttribute("user_id",user_id);
			model.addAttribute("prlist",prlist);
			model.addAttribute("prlist2",prlist2);
			return "/client/program/memberpreserve";
		} else {
			Cookie cookie=new Cookie("url","/main/memberpreserve");
			cookie.setMaxAge(60*60*24);
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/main/index";
		}
		
	}



}
