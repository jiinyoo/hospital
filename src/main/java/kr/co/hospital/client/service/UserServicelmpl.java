package kr.co.hospital.client.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;
import kr.co.hospital.client.mapper.UserMapper;

@Service
@Qualifier("use")
public class UserServicelmpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Override
	public String user()
	{
		return "client/user/user";
	}
	
	@Override
	public String userOk(UserDto udto)
	{	
		if(udto.getUser_id().startsWith("admin")) 
		{
            udto.setState(2);  // 관리자
        } 
		else 
		{
            udto.setState(0);  // 일반회원
        }
		mapper.userOk(udto);
		return "redirect:/main/login";
	}

	@Override
	public String useridCheck(String user_id)
	{
		System.out.println(mapper.useridCheck(user_id));
		return mapper.useridCheck(user_id);
	}
	
	@Override
    public String userInfo(HttpSession session, 
    		Model model) 
	{

        String userId=(String)session.getAttribute("user_id");
        Integer state=(Integer)session.getAttribute("state");

        if(userId!=null && state!=null) 
        {
            UserDto user=mapper.getUserInfo(userId);
            model.addAttribute("user",user);
            return "client/user/userInfo";
        }

        return "redirect:/main/login";
    }
	
	@Override
    public String updateUser(HttpSession session, 
    		Model model) 
	{
        String userId=(String) session.getAttribute("user_id");
        if (userId!=null) 
        {
            UserDto user=mapper.getUserInfo(userId);
            model.addAttribute("user",user);
            return "client/user/updateUser";
        }
        return "redirect:/main/login";
    }

    @Override
    public String updateOkUser(UserDto udto,
    		HttpSession session)
    {
        String userId=(String) session.getAttribute("user_id");
        if (userId!=null && userId.equals(udto.getUser_id())) 
        {
            mapper.updateOkUser(udto);
            return "redirect:/main/userInfo";
        }
        else 
        {
        	System.out.println("세션이 없거나 user_id가 일치하지 않음");
        	return "redirect:/main/login";
        }
    }

    @Override
	public String uchangePwd(HttpServletRequest request, Model model)
	{
    	
		HttpSession session=request.getSession();
		String gijonPwd = request.getParameter("gijon_pwd");  // 기존 비밀번호
		System.out.println("입력된 기존 비밀번호: " + gijonPwd);
	    String new_pwd = request.getParameter("new_pwd");      // 새로운 비밀번호
	    String confirmPwd = request.getParameter("confirm_pwd"); // 비밀번호 확인

	    String userId = (String) session.getAttribute("user_id");

	    if (userId == null) {
	        // 사용자 정보가 없으면 로그인 페이지로 리다이렉트
	        return "redirect:/main/login";
	    }

	    // 1. 기존 비밀번호 확인
	    UserDto user = mapper.getUserInfo(userId);  // DB에서 사용자 정보 가져옴
	    System.out.println("User: " + user);  // 디버깅을 위한 로그 추가
	    System.out.println("User Password from DB: " + user.getUser_pwd());
	    if(gijonPwd!=null)
	    {
	    if (!user.getUser_pwd().equals(gijonPwd)) {
	        
	        model.addAttribute("message", "기존 비밀번호가 일치하지 않습니다.");
	        return "client/user/uchangePwd";
	    }

	    int result = mapper.updatePwd(userId, new_pwd);
	    if (result > 0) {
	        
	        model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
	    } else {
	        
	        model.addAttribute("message", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
	    }
	    
	    }
	    return "client/user/uchangePwd";

	    
	}

}
