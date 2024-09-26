package kr.co.hospital.client.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.admin.dto.WorkdayDto;
import kr.co.hospital.client.dto.ReserveDto;
import kr.co.hospital.client.dto.UserDto;
import kr.co.hospital.client.mapper.ReserveMapper;

@Service
@Qualifier("res")
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveMapper mapper;

	@Override
	public String reserve(HttpServletRequest request,Model model,HttpSession session,
			HttpServletResponse response,RedirectAttributes redirect) {
		
		if(session.getAttribute("user_id")==null) {
			String user_id=request.getParameter("user_id")==null?"":request.getParameter("user_id");
			String user_phone=request.getParameter("user_phone")==null?"":request.getParameter("user_phone");
			String user_jumin=request.getParameter("user_jumin")==null?"":request.getParameter("user_jumin");
			

			if(user_id.isEmpty() || user_phone.isEmpty() || user_jumin.isEmpty()) {
				System.out.println("ing");
				Cookie url=new Cookie("url", "/main/reserve");
				url.setMaxAge(500);
				url.setPath("/");
				response.addCookie(url);
				return "redirect:/main/beforeReserve";				
			} else {
				
				//2
				model.addAttribute("user_jumin",user_jumin);
				model.addAttribute("user_id",user_id);
				model.addAttribute("user_phone",user_phone);
			}
		}
			model.addAttribute("doctor",mapper.getDoctors());
			model.addAttribute("part",mapper.getPart());
			//2
			Cookie chk=new Cookie("chk", "1");
			chk.setMaxAge(500);
			chk.setPath("/");
			response.addCookie(chk);
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
	public String reserveOk(ReserveDto rdto,HttpSession session,HttpServletResponse response,RedirectAttributes redirect,
			HttpServletRequest request) {
		String res_code="";
		Cookie chk=WebUtils.getCookie(request, "chk");
		
		if(chk==null) {
			Cookie url=new Cookie("url", "/main/reserve");
			url.setMaxAge(500);
			url.setPath("/");
			response.addCookie(url);
			return "redirect:/main/beforeReserve?err=1";
		} else {
			res_code="R";
			LocalDate today=LocalDate.now();
			int year=today.getYear();
			int month=today.getMonthValue();
			int day=today.getDayOfMonth();
			res_code+=year+String.format("%02d", month)+String.format("%02d", day);
			String resnum=String.format("%03d", mapper.getResnum(res_code)); 
			res_code+=resnum;
			if(session.getAttribute("user_id")==null) {
				rdto.setIsMember(1);
				rdto.setRes_code(res_code);
				mapper.reserveOk(rdto);
			} else {
				UserDto udto=mapper.getUserinfo(rdto.getUser_id());
				rdto.setIsMember(0);
				rdto.setUser_jumin(udto.getUser_jumin());
				rdto.setUser_phone(udto.getUser_phone());
				rdto.setRes_code(res_code);
				mapper.reserveOk(rdto);
			}
		}
		chk=new Cookie("chk", "");
		chk.setMaxAge(0);
		chk.setPath("/");
		response.addCookie(chk);
		redirect.addFlashAttribute("rdto", mapper.reserveConfirm(res_code));
		return "redirect:/main/addSuccess";
	}

	@Override
	public String beforeReserve(ReserveDto rdto) {
		return "/client/reserve/beforeReserve";
	}

	@Override
	public String reserveView(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {
	    ArrayList<ReserveDto> rdto = new ArrayList<>();
	    ArrayList<ReserveDto> past = new ArrayList<>();
	    int month = (request.getParameter("month") == null) ? 1 : Integer.parseInt(request.getParameter("month"));
	    
	    // LocalDate로 날짜만 처리
	    LocalDate startDate;
	    LocalDate endDate;

	    if (request.getParameter("start") == null || request.getParameter("start").isEmpty()) {
	        startDate = LocalDate.now().minusMonths(month); // month에 따른 지난 날짜로 설정
	    } else {
	        startDate = LocalDate.parse(request.getParameter("start")); // 날짜만 파싱
	    }

	    if (request.getParameter("end") == null || request.getParameter("end").isEmpty()) {
	        endDate = LocalDate.now(); // 현재 날짜로 설정
	    } else {
	        endDate = LocalDate.parse(request.getParameter("end"));
	    }

	    // LocalDateTime으로 변환 (시작은 자정, 종료는 하루의 마지막 시간)
	    LocalDateTime start = startDate.atStartOfDay(); // 시작일의 자정
	    LocalDateTime end = endDate.atTime(23, 59, 59); // 종료일의 마지막 시간

	    System.out.println(start + "부터 " + end + "까지");
	    System.out.println(month);

	    if (session.getAttribute("user_id") == null) {
	        String chk = request.getParameter("chk");
	        if ("0".equals(chk)) { // 핸드폰 번호로 조회
	            String userid = request.getParameter("user_id");
	            String phone = request.getParameter("user_phone");
	            phone = "and user_phone='" + phone + "' and isMember='1'";
	            rdto = mapper.reserveView(userid, phone);
	        // past = mapper.pastReserve(userid, phone, month);
	        } else if ("1".equals(chk)) { // 주민번호로 조회
	            String userid = request.getParameter("user_id");
	            String jumin = request.getParameter("user_jumin");
	            jumin = "and user_phone='" + jumin + "' and isMember='1'";
	            rdto = mapper.reserveView(userid, jumin);
	        // past = mapper.pastReserve(userid, jumin, month);
	        } else {
	            Cookie url = new Cookie("url", "/main/reserveView");
	            url.setMaxAge(60 * 3);
	            url.setPath("/");
	            response.addCookie(url);
	            return "redirect:/main/reserveSearch";
	        }
	    } else {
	        String userid = session.getAttribute("user_id").toString();
	        rdto = mapper.reserveView(userid, null);
	        System.out.println(month + " " + start + " " + end);
	        past = mapper.pastReserve(userid, month, start, end);
	    }

	    // 쿠키 처리: URL 초기화
	    Cookie url = new Cookie("url", "");
	    url.setMaxAge(0);
	    url.setPath("/");
	    response.addCookie(url);

	    // 의사 정보 조회
	    ArrayList<String> doc = new ArrayList<>();
	    for (ReserveDto reserve : rdto) {
	        doc.add(mapper.getDoctor(reserve.getDoc_id()));
	    }

	    ArrayList<String> doc1 = new ArrayList<>();
	    for (ReserveDto reserve : past) {
	        doc1.add(mapper.getDoctor(reserve.getDoc_id()));
	    }

	    // 모델에 데이터 추가
	    model.addAttribute("doc", doc);
	    model.addAttribute("pastDoc", doc1);
	    model.addAttribute("past", past);
	    model.addAttribute("rdto", rdto);

	    return "/client/reserve/reserveView";
	}


	@Override
	public String cancelRes(HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("user_id")==null) {
			String res_id=request.getParameter("res_id");
			String user_phone=request.getParameter("user_phone");
			String user_id=request.getParameter("user_id");
			
			mapper.delRes(res_id, user_id, user_phone);
			return "redirect:/main/delsuccess";
			
		} else {
			String res_id=request.getParameter("res_id");
			String userid=session.getAttribute("user_id").toString();
			
			mapper.delRes(res_id,userid,null);
			return "redirect:/main/reserveView";
		}
	} 
	
	

}
