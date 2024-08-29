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
    <div> ${ndto.title} </div>
    <div> ${ndto.readnum} </div>
    <div> ${ndto.content} </div>
    <div>
      <a href="list"> 목록 </a>
     <c:if test="${userid=='admin'}">
      <a href="update?id=${ndto.id}"> 수정 </a>
      <a href="update?id=${ndto.id}"> 삭제 </a>
     </c:if>
    </div>
  </section>

</body>
</html>