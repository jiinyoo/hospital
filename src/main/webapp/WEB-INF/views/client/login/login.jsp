<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: 'goorm-sans-bold', sans-serif;
    background-color: #f2f4f9;
    margin: 0;
    padding: 0;
  }

  section {
    width: 80%;
    max-width: 500px;
    margin: 40px auto;
    padding: 60px;
    background-color: #ffffff;
    border-radius: 40px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  h3 {
    text-align: center;
    color: #B5B2FF;
    margin-bottom: 20px;
  }
  
  div {
    margin: auto;
  }
  
  .ha {
    margin-bottom:8px;
    padding:4px;
  }

  input[type="text"],
  input[type="password"],
  input[type="submit"] {
    font-family: 'goorm-sans-bold', sans-serif;
    width: calc(100% - 22px);
    padding: 10px;
    margin: 5px 0;
    margin-bottom:20px;
    border: 1px solid #ced4da;
    border-radius: 10px;
    box-sizing: border-box;
  }

  input[type="submit"] {
    background-color: #B5B2FF;
    color: white;
    border: none;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #7D78FF;
  }

  .err {  
    color:  #dc3545;
    font-size: 17px;
  }
</style>
<script>
    function check(my)
    {
        if(my.userid.value.trim().length==0)
        {
        	alert("아이디를 입력하세요");
        	return false;
        }	
        else if(my.pwd.value.trim().length==0)
      	{
            alert("비밀번호를 입력하세요");
            return false;
       	}
        else
            return true;   	
    }
</script>
</head>
<body>
 <section>
 	<form method="post" action="loginOk" onsubmit="return check(this)">
  	<input type="hidden" name="menu" value="${menu}">
  		<h3> 로그인 ${user_name }</h3>
  		<div>
   		<div class="ha"> 아이디 </div>
    		<input type="text" name="user_id" value="admin" id="txt">
  		</div>
  		<div>
   		<div class="ha"> 비밀번호 </div>
   			<input type="password" name="user_pwd" value="1234" id="pwd">
  		</div>
  		<p>
   			<input type="submit" value="로그인" id="submit">
 		 </p>
  	<c:if test="${err==1}">
   		<div class="err" align="center"> 아이디 혹은 비밀번호가 다릅니다 </div>
  	</c:if>
 	</form>
 </section>
</body>
</html>