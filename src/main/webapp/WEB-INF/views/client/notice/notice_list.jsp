<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 페이지 스타일 */
    body {
        font-family: 'goorm-sans-bold', sans-serif;
        background-color: #f2f4f9;
        margin: 0;
        padding: 0;
    }
    
    section {
        width: 80%;
        max-width: 900px;
        margin: 50px auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* 제목 스타일 */
    h3 {
        text-align: center;
        color: #B5B2FF;
        margin-bottom: 20px;
        font-size: 22px;
    }
    
    /* 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
    }

    table, th, td {
        border: 1px solid #ccc;
    }

    th, td {
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #B5B2FF;
        color: white;
    }

    /* 링크 스타일 */
    a {
        color: #7D78FF;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        color: #5a58e0;
    }

    /* 글 작성 버튼 스타일 */
    .write-button {
        margin-top: 20px;
        text-align: center;
    }

    .write-button a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #B5B2FF;
        color: white;
        border-radius: 10px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
    }

    .write-button a:hover {
        background-color: #7D78FF;
    }
</style>
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
    <c:forEach items="${nmapAll}" var="ndto">
    <tr align="center">
      <td align="left"> 
       <a href="notice_readnum?notice_id=${ndto.notice_id}">${ndto.title}</a>
      </td>
      <td> 관리자 </td>
      <td> ${ndto.readnum} </td>
      <td> ${ndto.writeday} </td>
    </tr>  
    </c:forEach>
   </table>
   
   <c:if test="${user_id=='admin'}">
     <div class="write-button">
       <a href="notice_write">글 작성</a>
     </div>
   </c:if>
 </section>

</body>
</html>