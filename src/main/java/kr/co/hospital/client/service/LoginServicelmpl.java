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
import kr.co.hospital.util.MailSend;
import kr.co.hospital.util.UserUtils;

@Service
@Qualifier("log")
public class LoginServicelmpl implements LoginService {
	
	@Autowired
	private LoginMapper mapper;
	
	@Autowired
	private MailSend mailSend;
	
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
			int state=mapper.getState(udto.getUser_id());
	        session.setAttribute("state",state);
	        
			if(state==1 || state==2) 
			{
				return "redirect:/admin/main/index";
			} 
			else 
			{
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
    public String idSearch(HttpServletRequest request, Model model) 
	{
        String user_email=request.getParameter("user_email");
        String user_name=request.getParameter("user_name");

        String user_id=mapper.findUserId(user_email, user_name); // 이메일과 이름을 모두 확인하는 쿼리

        if (user_id!=null) 
        {
            model.addAttribute("successMessage", "아이디: " + user_id);
        } 
        else 
        {
            model.addAttribute("errorMessage", "해당 이메일 및 이름으로 등록된 아이디가 없습니다.");
        }
        return "client/login/idSearch"; // 같은 페이지로 리턴
    }

    // 비밀번호 찾기: 이메일과 아이디를 모두 입력해야 비밀번호 재설정 링크를 전송
	@Override
	public String pwdSearch(HttpServletRequest request, Model model) 
	{
	    String userEmail=request.getParameter("user_email");
	    String user_id=request.getParameter("user_id");

	    String password=mapper.findPassword(userEmail, user_id);
	    
	    if (password!=null) 
	    {
	    	// 세션에 이메일과 userId만 저장 (비밀번호는 저장하지 않음)
	    	String verificationCode = generateVerificationCode();  // 랜덤 인증번호 생성
	        HttpSession session = request.getSession();
	        session.setAttribute("verificationCode", verificationCode);
	        session.setAttribute("userEmail", userEmail);
	        session.setAttribute("userid", user_id);
	        session.setAttribute("password", password);  // 비밀번호도 세션에 임시 저장
	        session.setAttribute("verificationTime", LocalDateTime.now());  // 인증번호 생성 시간 저장
	        
	    	 String subject="비밀번호 찾기 인증번호";
	         String body="인증번호는: " +verificationCode+ " 입니다.";
	         
	         int emailStatus=mailSend.setEmail(userEmail, subject, body);
	         System.out.println("세션에 저장된 인증번호: " + session.getAttribute("verificationCode"));
	         System.out.println("세션에 저장된 인증 시간: " + session.getAttribute("verificationTime"));
	         
	         if(emailStatus==1) 
	         {
	             model.addAttribute("successMessage", "비밀번호가 이메일로 전송되었습니다.");
	             model.addAttribute("isSent", true);
	         } 
	         else 
	         {
	             model.addAttribute("errorMessage", "비밀번호 전송에 실패했습니다. 다시 시도해주세요.");
	         }
	     } 
	     else 
	     {
	         model.addAttribute("errorMessage", "입력하신 정보와 일치하는 계정이 없습니다.");
	     }
	    
	    model.addAttribute("user_id", user_id);
	    model.addAttribute("user_email", userEmail);
	    
	    return "client/login/pwdSearch"; // 비밀번호 찾기 화면으로 리턴
	}

	@Override
	public String verifyCode(HttpServletRequest request, Model model) 
	{
	    String inputCode=request.getParameter("verification_code");

	    HttpSession session=request.getSession();
	    String savedCode=(String) session.getAttribute("verificationCode");
	    LocalDateTime sentTime=(LocalDateTime) session.getAttribute("verificationTime");
	    String user_id=(String) session.getAttribute("userid");

	    System.out.println("세션에 저장된 인증번호: "+ savedCode);
	    System.out.println("세션에 저장된 인증 시간: "+ sentTime);
	    
	    if (savedCode != null && sentTime != null) 
	    {
	        // 인증 시간이 초과되지 않았는지 확인 3분
	        if (sentTime.plusMinutes(3).isAfter(LocalDateTime.now())) 
	        {
	            if (savedCode.equals(inputCode)) 
	            {
	            	session.setAttribute("reset_user_id", user_id);  
	                session.removeAttribute("userid");
	                return "client/login/changePwd";  // 비밀번호 변경 페이지로 리턴
	            } 
	            else 
	            {
	                model.addAttribute("errorMessage", "인증번호가 일치하지 않습니다.");
	            }
	        } 
	        else 
	        {
	            model.addAttribute("errorMessage", "인증 시간이 초과되었습니다.");
	        }
	    } 
	    else 
	    {
	        model.addAttribute("errorMessage", "인증번호를 다시 요청하세요.");
	    }

	    return "client/login/pwdSearch";  // 비밀번호를 표시하는 페이지로 리턴
	}

	private String generateVerificationCode() 
	{
	    return UserUtils.ranPwd();
	}
	
	@Override
	public String changePwd(HttpServletRequest request, Model model)
	{
		HttpSession session=request.getSession();
		String user_id=(String) session.getAttribute("reset_user_id");
	    String newPwd=request.getParameter("new_pwd");
	    String confirmPwd=request.getParameter("confirm_pwd");

	    if (newPwd.equals(confirmPwd)) 
	    {
	        // 새로운 비밀번호 저장 로직
	        int result = mapper.updatePwd(user_id, newPwd);
	        
	        if (result > 0) {
	            session.removeAttribute("reset_user_id");  // 비밀번호 변경 후 세션에서 reset_user_id 제거
  // 비밀번호 변경 후 세션에서 reset_user_id 제거
	              // 비밀번호 변경 후 세션에서 reset_user_id 제거
	            model.addAttribute("success", true);
	        } else {
	            model.addAttribute("success", false);
	        }
	    } 
	    else 
	    {
	        model.addAttribute("success", false);
	    }

	    return "client/login/changePwd";

	    
	}


	    
}
