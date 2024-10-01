package kr.co.hospital.client.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.hospital.client.dto.UserDto;
import kr.co.hospital.client.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	@Qualifier("log")
	private LoginService service;
	
	@RequestMapping("/main/login")
	public String login(HttpServletRequest request,
			Model model)
	{
		return service.login(request,model);
	}
	
	@RequestMapping("/main/loginOk")
	public String loginOk(UserDto udto,
			HttpSession session, HttpServletRequest request, HttpServletResponse response)
	{
		return service.loginOk(udto,session,request,response);
	}
	
	@RequestMapping("/main/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}
	
	 @GetMapping("/main/idSearch")
	 public String idSearchPage() {
	    return "client/login/idSearch";
     }

	 @PostMapping("/main/idSearch")
	 public String idSearch(HttpServletRequest request, Model model) {
	    return service.idSearch(request, model);
	 }

	 @GetMapping("/main/pwdSearch")
	 public String pwdSearchPage() {
	    return "client/login/pwdSearch";
	 }

	 @PostMapping("/main/pwdSearch")
	    public String sendVerificationCode(@RequestParam("user_id") String user_id,
	                                       @RequestParam("user_email") String user_email,
	                                       HttpServletRequest request,
	                                       Model model) {
	        // 인증번호 생성 및 이메일 전송
	        return service.pwdSearch(request, model);
	    }

	    // 인증번호 검증
	    @PostMapping("/main/verifyCode")
	    public String verifyCode(@RequestParam("verification_code") String inputCode,
	                             HttpServletRequest request, Model model) {
	        return service.verifyCode(request, model);
	    }
	    
	    @RequestMapping("/main/changePwd")
	    public String changePwd(HttpServletRequest request,Model model)
	    {
	    	return service.changePwd(request, model);
	    }
	    
	    @RequestMapping("/memberLoginForm/getKakaoAuthUrl")
	    public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) {
	    		String reqUrl="https://kauth.kakao.com/oauth/authorize?client_id=e6287009ad2655ad9740b77a4826ae8e&redirect_uri=http://localhost:8098/auth&response_type=code";
	    		return reqUrl;	
	    }
	    
	    @RequestMapping("/auth")
	    public String getKakaoToken(@RequestParam String code, HttpServletRequest request) {
	        // 받은 인가 코드로 액세스 토큰 요청
	        String tokenUrl = "https://kauth.kakao.com/oauth/token";
	        
	        // 필요한 파라미터들
	        String clientId = "e6287009ad2655ad9740b77a4826ae8e"; // 본인의 REST API 키
	        String redirectUri = "http://localhost:8098/auth"; // redirect_uri

	        // HTTP 요청 파라미터 설정
	        RestTemplate restTemplate = new RestTemplate();
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

	        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
	        params.add("grant_type", "authorization_code");
	        params.add("client_id", clientId);
	        params.add("redirect_uri", redirectUri);
	        params.add("code", code);
	        
	        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
	        System.out.println(requestEntity);
	        // 액세스 토큰 요청
	        ResponseEntity<String> response = restTemplate.postForEntity(tokenUrl, requestEntity, String.class);
	        System.out.println(response);
	        // 응답 처리
	        if (response.getStatusCode() == HttpStatus.OK) {
	            // 액세스 토큰 추출
	            String responseBody = response.getBody();
	            // JSON 파싱 후 토큰 정보 추출
	            // 이후 사용자 정보 요청으로 이어짐
	            // 예시로 사용자 정보를 가져오는 부분도 아래에 추가
	        }

	        return "redirect:/main/index"; // 로그인 성공 시 메인 페이지 등으로 리디렉션
	    }

	    
	    
	    
}
