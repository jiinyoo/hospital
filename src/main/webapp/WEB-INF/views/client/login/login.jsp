<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>

  body {
    font-family: 'goorm-sans-bold';
    background-color: #f2f4f9;
    margin: 0;
    padding: 0;
  }

  .login-container 
  {
    width: 80%;
    max-width: 900px;
    margin: 80px auto;
    padding: 40px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .login-left 
  {
    display: flex;
    align-items: center;
    width: 50%;
    margin-bottom: 15px;
  }

  .login-left .icon 
  {
    font-size: 60px;
    color: #007bff;
    margin-right: 20px;
    margin-bottom: 15px;
  }

  .login-left h3 
  {
    font-size: 24px;
    color: #007bff;
    margin-bottom: 10px;
  }

  .login-left p 
  {
    font-size: 14px;
    color: #555;
  }

  .login-right 
  {
    width: 50%;
    text-align: right;
  }

  .login-right input[type="text"],
  .login-right input[type="password"] 
  {
  	font-family: 'goorm-sans-bold';
    width: calc(100% - 40px);
    padding: 15px;
    margin: 10px 0;
    font-size: 16px;
    border: 1px solid #ced4da;
    border-radius: 10px;
  }

  .login-right input[type="submit"] 
  {
  	font-family: 'goorm-sans-bold';
    width: calc(100% - 40px);
    padding: 15px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 16px;
    border-radius: 13px;
    margin-top: 10px;
    transition: background-color 0.3s ease;
  }

  .login-right input[type="submit"]:hover 
  {
    background-color: #0056b3;
  }

  .additional-links 
  {
    text-align: center;
    margin-top: 20px;
    padding-left: 26px;
  }

  .additional-links a 
  {
    margin: 0 10px;
    font-size: 14px;

    color: #007bff;
    text-decoration: none;
  }

  .additional-links a:hover 
  {
    text-decoration: underline;
  }

</style>

<script>
    function check(my)
    {
        if(my.userid.value.trim().length == 0)
        {
        	alert("아이디를 입력하세요");
        	return false;
        }	
        else if(my.pwd.value.trim().length == 0)
      	{
            alert("비밀번호를 입력하세요");
            return false;
       	}
        else
            return true;   	
    }
    
    function showError() 
    {
        var err="${param.err}";
        if (err=='1') 
        {
            alert("아이디 또는 비밀번호가 틀렸습니다.");
        }
    }
    
    window.onload = showError;  // 페이지 로드 시 에러 확인
    
    function idSearch() 
    {
      alert("아이디 찾기 페이지로 이동합니다.");
    }

    function pwdSearch() 
    {
      alert("비밀번호 찾기 페이지로 이동합니다.");
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
 
</head>
<body>
  <div class="login-container">
    <div class="login-left">
      <i class="fas fa-lock icon"></i>
      <div>
        <h3>회원 로그인</h3>
        <p>회원 아이디와 비밀번호를 이용하여 로그인하여 주세요.</p>
      </div>
    </div>

    <div class="login-right">
      <form method="post" action="loginOk" onsubmit="return check(this)">
        <input type="hidden" name="menu" value="${menu}">
        
        <input type="text" id="userid" name="user_id" value="admin" placeholder="아이디를 입력하세요.">
        <input type="password" name="user_pwd" value="1234"  placeholder="비밀번호를 입력하세요.">
        <input type="submit" value="LOGIN">
        
        <div class="additional-links">
          <a href="/main/user">회원가입</a> | 
          <a href="/main/idSearch">아이디 찾기</a> | 
          <a href="/main/pwdSearch">비밀번호 찾기</a>
        </div>
      </form>
    </div>
  </div>

 
</body>
</html>
