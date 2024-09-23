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
        text-align: left;
        color: #004fa8;
        margin-bottom: 20px;
        font-size: 30px;
        margin-left: 10px;
        
    }
    
    /* 테이블 스타일 */
    table {
        width: 100%;
		border-collapse: collapse;
        margin: 0 auto;
        
    }
    
    #ntitle {
    	width:700px;
    	text-align: left;
    	padding-left: 20px;
    	color:black;
    	
    }
    
    #nntitle {
    	text-align: left;
    	padding-left: 20px;
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
        font-weight: bold;
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
        text-align: center;
        margin-top: 20px;
    }

    .page a {
        display: inline-block;
        padding: 8px 16px;
        background-color: #004fa8;
        color: white;
        margin: 0 2px;
        
        text-decoration: none;
    }

    .page a:hover {
        background-color: #033D7F;
    }
    

    
    #nuser {
    	
    }
</style>
</head>
<body>
<%-- <p>pstart: ${pstart}, pend: ${pend}, chong: ${chong}, page: ${page}</p> --%>

 <section>
   <table width="900" align="center">
    <caption> <h2> 공지 사항 </h2></caption>
    <tr id="table-header" align="center">
      <th id="nuser"> 작성자 </th>
      <th id="ntitle"> 제 목 </th>
      <th> 조회수 </th>
      <th> 작성일 </th>
    </tr>
    <c:forEach items="${nmapAll}" var="ndto">
    <tr align="center">
      <td> 관리자 </td>
      <td id="nntitle"> 
       <a href="notice_readnum?notice_id=${ndto.notice_id}">${ndto.title}</a>
      </td>
      <td> ${ndto.readnum} </td>
      <td> ${ndto.writeday} </td>
    </tr>  
    </c:forEach>
   </table>
   
   <div class="page">
   
       <c:if test="${page > 1}">
    	<a href="notice_list?page=${page - 1}">◀◀</a>
	   </c:if>

       
       <c:forEach var="i" begin="${pstart}" end="${pend}">
       
           <c:if test="${page==i}">
               <a style="background-color: #033D7F;">${i}</a>
           </c:if>
           
           <c:if test="${page!=i}">
               <a href="notice_list?page=${i}">${i}</a>
           </c:if>
           
       </c:forEach>
       
       <c:if test="${page < chong}">
    	<a href="notice_list?page=${page + 1}">▶▶</a>
	   </c:if>

       
   </div>
   
   <c:if test="${user_id=='admin'}">
     <div class="write-button">
       <a href="notice_write">공지 작성</a>
     </div>
   </c:if>
   
 </section>

</body>
</html>