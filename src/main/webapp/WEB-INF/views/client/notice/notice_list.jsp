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
   <table width="900" align="center">
    <caption> <h3> 공지 사항 </h3></caption>
    <tr align="center">
      <td> 제 목 </td>
      <td> 작성자 </td>
      <td> 조회수 </td>
      <td> 작성일 </td>
    </tr>
    <tr align="center">
      <td align="left"> 
       <a href="readnum?id=${ndto.id}">${ndto.title}</a>
      </td>
      <td> 관리자 </td>
      <td> ${ndto.readnum} </td>
      <td> ${ndto.writeday} </td>
    </tr>  
   </table>
   <c:if test="${userid=='admin'}">
     <div class="" align="center">
       <a href="write"> 글 작성 </a>
     </div>
   </c:if>
 </section>

</body>
</html>