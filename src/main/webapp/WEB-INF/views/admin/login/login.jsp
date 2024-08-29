<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  <h3> 로그인 </h3>
  <div>
   <div> 아이디 </div>
   <input type="text" name="userid" value="admin" id="txt">
  </div>
  <div>
   <div> 비밀번호 </div>
   <input type="password" name="pwd" value="1234" id="pwd">
  </div>
  <p align="center">
   <input type="submit" value="로그인" id="submit">
  </p>
  <c:if test="${err==1}">
   <div> 아이디 혹은 비밀번호가 다릅니다 </div>
  </c:if>
 </form>
</section>
</body>
</html>