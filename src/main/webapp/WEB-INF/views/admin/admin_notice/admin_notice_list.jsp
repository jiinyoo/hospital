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
    
    section {
    	
        width: 100%;
        max-width: 1100px;
        margin: 50px auto;
        padding: 30px 50px;
        background-color: #ffffff;
        border-radius: 10px;

    }

    /* 제목 스타일 */
    h2 {
    	
        text-align: center;
        color: #004fa8;
        margin-bottom: 20px;
        font-size: 30px;
        
    }
    
    /* 테이블 스타일 */
    table {
    	
        width: 100%;
		border-collapse: collapse;
        margin: 0 auto;
        
    }
    
    #ntitle {
    	width:500px;
    	text-align: left;
    	padding-left: 50px;
    	color:black;
    	
    }
    
    #nntitle {
    	text-align: left;
    	padding-left: 50px;
    }
	
	td {
		border-bottom: 1px solid #ccc;

	}

    th, td {
        padding: 6px;
        text-align: center;
    }

    th {
    	background: #f9f9f9 url(/static/client/notice/divide_line.png) no-repeat 0 center;
    	width:150px;
    	border-top:1px solid black;
    	border-bottom: 1px solid #ccc;
    }

    /* 링크 스타일 */
    a {
        color: #004fa8;
        text-decoration: none;

    }

    a:hover {
        color: blue;
    }

    /* 글 작성 버튼 스타일 */
    .write-button {
        margin-top: 20px;
        text-align: right;
    }

    .write-button a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #004fa8;
        color: white;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
    }

    .write-button a:hover {
        background-color: #033D7F;
    }
    
    .page {
    	font-family: 'Noto Sans', sans-serif;
        text-align: center;
        margin-top: 20px;
    }

    .page a {
        display: inline-block;
        padding: 8px 16px;
        background-color: #004fa8;
        color: white;
        margin: 0 2px;
        border-radius: 4px;
        text-decoration: none;
        font-size: 16px;
    }

    .page a:hover {
        background-color: #033D7F;
    }
    
	.page .current-page {
    background-color: #033D7F;
    color: white;
    font-weight: bold;
    cursor: pointer;
}
</style>
</head>
<body>
 <section>
   <table width="900" align="center">
    <caption> <h2> 공지 사항 </h2></caption>
    <tr id="table-header" align="center">
    <tr align="center">
      <th id="nuser"> 작성자 </th>
      <th id="ntitle"> 제 목 </th>
      <th> 조회수 </th>
      <th> 작성일 </th>
    </tr>
    <c:forEach items="${nmapAll}" var="ndto">
    <tr align="center">
      <td> 병원장 </td>
      <td id="nntitle"> 
       <a href="admin_notice_readnum?notice_id=${ndto.notice_id}">${ndto.title}</a>
      </td>
      <td> ${ndto.readnum} </td>
      <td> ${ndto.writeday} </td>
    </tr>  
    </c:forEach>
   </table>
   
   	<div class="page">
   
       <c:if test="${page > 1}">
    	<a href="admin_notice_list?page=${page - 1}">
    		<i class="fas fa-angle-double-left"></i>
    	</a>
	   </c:if>

       
       <c:forEach var="i" begin="${pstart}" end="${pend}">
       
           <c:if test="${page==i}">
               <a class="current-page">${i}</a>
           </c:if>
           
           <c:if test="${page!=i}">
               <a href="admin_notice_list?page=${i}">${i}</a>
           </c:if>
           
       </c:forEach>
       
       <c:if test="${page < chong}">
    	<a href="admin_notice_list?page=${page + 1}">
    		<i class="fas fa-angle-double-right"></i>
    	</a>
	   </c:if>

       
   </div>
   
   <c:if test="${user_id=='admin'}">
     <div class="write-button">
       <a href="admin_notice_write">글 작성</a>
     </div>
   </c:if>
 </section>

</body>
</html>