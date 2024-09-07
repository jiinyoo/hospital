<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <section>
    <caption> <h3> 공지사항 내용 </h3></caption>
    
    <div> 
    	${ndto.title} 
    </div>
    
    <div> 
    	${ndto.readnum} 
    </div>
    
    <div> 
    	${ndto.content} 
    </div>
    
    <div>
       <c:forEach items="${ndto.imgs}" var="img" >
         <img src="../resources/room/${ndto.img}" width="50" height="32" valign="middle">
       </c:forEach>
     </div>
     
    <div>
       <a href="notice_list"> 목록 </a>
     <c:if test="${user_id=='admin'}">
       <a href="notice_update?id=${ndto.user_id}"> 수정 </a>
       <a href="notice_update?id=${ndto.user_id}"> 삭제 </a>
     </c:if>
    </div>
  </section>

</body>
</html>