<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  function adServer(server)
  {
  	document.mform.email2.value=server;
  }
</script>
</head>
<body>
<main>
  <form name="mform" method="post" action="userOk">
    <h3 align="center"> 회원 가입 </h3>
    <div>
      <input type="text" name="user_id" id="txt" placeholder="아이디">
    </div>
    <div>
      <input type="text" name="user_name" id="txt" placeholder="이름">
    </div>
    <div>
      <input type="password" name="user_pwd" id="txt" placeholder="비밀번호">
    </div>
    <div>
      <input type="password" name="pwd2" id="txt" placeholder="비밀번호 확인">
    </div>
    <div> 
      <input type="text" name="user_phone" id="txt" placeholder="전화번호">
    </div>
    <div>
      <input type="text" name="user_email" id="txt" placeholder="이메일 아이디">
      <input type="text" name="email2" id="txt" placeholder="이메일 주소">
      <select onchange="adServer(this.value)">
       <option> 직접입력 </option>
       <option value="naver.com"> 네이버 </option>
       <option value="daum.net"> 다음 </option>
       <option value="yahoo.com"> 야후 </option>
       <option value="google.com"> 구글 </option>
      </select>
    </div>
    <div>
      <input type="text" name="user_jumin" id="txt" placeholder="주민번호 앞자리"> - *******
    </div>
    <div>
      <input type="text" name="user_addr" id="txt" placeholder="주소">
    </div>
    <div>
      <input type="submit" value="회원 등록" id="submit">
    </div>
    
    
  </form>
</main>

</body>
</html>