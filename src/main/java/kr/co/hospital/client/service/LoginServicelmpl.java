package kr.co.hospital.client.service;

import java.time.LocalDateTime;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;
import kr.co.hospital.client.mapper.LoginMapper;

@Service
@Qualifier("log")
public class LoginServicelmpl implements LoginService {
	
	@Autowired
	private LoginMapper mapper;
	
	@Override
	public String login(HttpServletRequest request,Model model)
	{
		String err=request.getParameter("err");
		String menu=request.getParameter("menu");
		model.addAttribute("menu",menu);
		model.addAttribute("err",err);
		return "/client/login/login";
	}
	
	@Override
	public String loginOk(UserDto udto,HttpSession session,HttpServletRequest request, HttpServletResponse response)
	{
		String user_name=mapper.loginOk(udto);
		String menu=request.getParameter("menu");
		System.out.println(menu);
		if(user_name!=null)
		{
			System.out.println("로그인 성공");
			session.setAttribute("user_id",udto.getUser_id());
			String userid = udto.getUser_id();
			if(mapper.getState(userid)==2) 
			{
				return "redirect:/admin/main/index";
			} 
			else 
			{
				//게시판을 보려다가 로그인했으면 진료 후기 게시판으로 바로 로그인 되게 하는 것
				Cookie cookie=WebUtils.getCookie(request, "url");
				String url=null;
				if(cookie!=null)
				{
					url=cookie.getValue();
					cookie.setMaxAge(0); // 쿠키 유효 기간 (초 단위) - 여기서는 1일
					cookie.setPath("/");
					response.addCookie(cookie);
					return "redirect:"+url;
				}else {
					return "redirect:/main/index";				
				}				
			}
			
		}
		else
		{
			System.out.println("로그인실패");
			return "redirect:/main/login?err=1";
		}
	}
	@Override
    public String logout(HttpSession session)
   {
	    session.invalidate();
        return "redirect:/main/index";
   }
	
	@Override
    public String idSearch(HttpServletRequest request, Model model) {
        String user_email = request.getParameter("user_email");
        String user_name = request.getParameter("user_name");

        String user_id = mapper.findUserId(user_email, user_name); // 이메일과 이름을 모두 확인하는 쿼리

        if (user_id != null) {
            model.addAttribute("successMessage", "아이디: " + user_id);
        } else {
            model.addAttribute("errorMessage", "해당 이메일 및 이름으로 등록된 아이디가 없습니다.");
        }
        return "client/login/idSearch"; // 같은 페이지로 리턴
    }

    // 비밀번호 찾기: 이메일과 아이디를 모두 입력해야 비밀번호 재설정 링크를 전송
	@Override
	public String pwdSearch(HttpServletRequest request, Model model) {
	    String userEmail = request.getParameter("user_email");
	    String userId = request.getParameter("user_id");

	    // 1. 이메일과 아이디를 이용해 비밀번호를 조회
	    String password = mapper.findPassword(userEmail, userId);
	    
	    if (password != null) {
	        // 2. 비밀번호가 존재하면, 이메일로 비밀번호를 전송하거나 화면에 보여줍니다.
	        model.addAttribute("successMessage", "비밀번호는 " + password + "입니다."); // 비밀번호를 직접 보여줌 (보안상 이메일로 전송하는 것이 더 좋습니다)
	    } else {
	        model.addAttribute("errorMessage", "입력하신 정보와 일치하는 계정이 없습니다.");
	    }
	    
	    return "client/login/pwdSearch"; // 비밀번호 찾기 화면으로 리턴
	}

	    @Override
	    public String verifyCode(HttpServletRequest request, Model model) {
	        String inputCode = request.getParameter("verification_code");

	        HttpSession session = request.getSession();
	        String savedCode = (String) session.getAttribute("verificationCode");
	        LocalDateTime sentTime = (LocalDateTime) session.getAttribute("verificationTime");
	        
	        if (savedCode != null && sentTime != null) {
	            // 현재 시간이 인증번호 발송 시간에서 3분이 넘지 않았는지 확인
	            if (sentTime.plusMinutes(0).isAfter(LocalDateTime.now())) {
	                if (savedCode.equals(inputCode)) {
	                    model.addAttribute("successMessage", "인증 성공! 비밀번호는 '1234'입니다.");
	                } else {
	                    model.addAttribute("errorMessage", "인증번호가 일치하지 않습니다.");
	                }
	            } else {
	                model.addAttribute("errorMessage", "인증 시간이 초과되었습니다.");
	            }
	        } else {
	            model.addAttribute("errorMessage", "인증번호를 다시 요청하세요.");
	        }
	        
	        return "client/login/pwdSearch";
	    }

	    // 인증번호 생성 로직
	    private String generateVerificationCode() {
	        Random random = new Random();
	        int code = 100000 + random.nextInt(900000); // 6자리 랜덤 코드 생성
	        return String.valueOf(code);
	    }
}
