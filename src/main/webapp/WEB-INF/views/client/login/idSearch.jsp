<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <style>
        /* 스타일 추가 */
        .search-container {
            width: 80%;
            max-width: 600px;
            margin: 80px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .search-container h3 {
            font-size: 24px;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }

        .search-container input[type="text"] {
            width: calc(100% - 40px);
            padding: 15px;
            margin: 10px 0;
            font-size: 16px;
            border: 1px solid #ced4da;
            border-radius: 10px;
        }

        .search-container input[type="submit"] {
        	font-family: 'goorm-sans-bold';
            width: calc(100% - 40px);
            padding: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 10px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .search-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 20px;
            color: green;
        }

        .error {
            margin-top: 20px;
            color: red;
        }
        
  .additional-links 
  {
    text-align: center;
    margin-top: 20px;
    
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
</head>
<body>
    <div class="search-container">
        <h3>아이디 찾기</h3>
        <form method="post" action="${pageContext.request.contextPath}/main/idSearch">
    <label for="user_email">이메일</label>
    <input type="text" name="user_email" placeholder="이메일을 입력하세요">
    <br>
    <br>
    <label for="user_name">이름</label>
    <br>
    <input type="text" name="user_name" placeholder="이름을 입력하세요">
    
    <input type="submit" value="아이디 찾기">
</form>
<!-- 성공 메시지 -->
<div class="message">
    <c:if test="${not empty successMessage}">
        <p>${successMessage}</p>
    </c:if>
</div>
<!-- 실패 메시지 -->
<div class="error">
    <c:if test="${not empty errorMessage}">
        <p>${errorMessage}</p>
    </c:if>
</div>
    
        <div class="additional-links">
          <a href="/main/user">회원가입</a> | 
          <a href="/main/login">로그인</a> | 
          <a href="/main/pwdSearch">비밀번호 찾기</a>
        </div>
        
     </div>
</body>
</html>
