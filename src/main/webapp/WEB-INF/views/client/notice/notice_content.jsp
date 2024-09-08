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
    	제 목
    </div>
    <div> 
    	${ndto.title} 
    </div>
    
    <div> 
    	작성자 
   	</div>
   	<div>
    	${ndto.user_id} 
    </div>
    
    <div> 
    	${ndto.readnum} <span id="rnum"> <조회수> </span>
    </div>
    
    <div> 
    	${ndto.content} 
    </div>
    
    <div>
       <c:forEach items="${imgs}" var="img">
         <img src="/static/client/notice/${img}" style="max-width: 100%; height: auto;">
       </c:forEach>
     </div>
     
    <div>
       <a href="notice_list"> 목록 </a>
     <c:if test="${user_id=='admin'}">
       <a href="notice_update?notice_id=${ndto.notice_id}"> 수정 </a>
       <a href="notice_delete?notice_id=${ndto.notice_id}"> 삭제 </a>
     </c:if>
    </div>
  </section>

</body>
</html>