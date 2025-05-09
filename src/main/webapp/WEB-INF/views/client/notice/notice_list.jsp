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
        background-color: #ffffff;
        border-radius: 10px;

    }

    /* 제목 스타일 */
    h2 {
        text-align: left;
        color: #004fa8;
        margin-bottom: 20px;
        padding-top:19px;
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

/* 전체 레이아웃 설정 */
.page-layout {
    display: flex;
    justify-content: center; /* 공지사항 섹션을 중앙 정렬 */
    width: 1500px;
    margin: 0 auto;
    position: relative;
}

/* 왼쪽 사이드바 스타일 */
.sidebar {
    position: absolute;
    left: 0;
    width: 170px;
    padding: 30px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    top: 50px; /* 페이지의 상단과 사이드바 간격 */
    text-align: center;
}

.sidebar h3 {
	
    font-size: 28px;
    color: #004fa8;
    margin-bottom: 20px;
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar ul li {
    margin-bottom: 15px;
}

.sidebar ul li a {
    text-decoration: none;
    color: #004fa8;
    font-weight: bold;
    font-size: 18px;
}

.sidebar ul li a:hover {
    color: #033D7F;
}

/* 가운데 공지사항 섹션 스타일 */
.content {
    flex: 1;
    max-width: 1100px;
    background-color: white;
    border-radius: 10px;
    padding: 30px 50px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    margin-left: 200px; /* 사이드바와 공지사항 섹션 간의 간격 */
}

    

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

</head>
<body>
<%-- <p>pstart: ${pstart}, pend: ${pend}, chong: ${chong}, page: ${page}</p> --%>

 <div class="page-layout">
   <!-- 왼쪽 사이드바 -->
   <div class="sidebar">
      <h3>커뮤니티</h3>
      <ul>
         <li><a href="/main/notice_list">공지사항</a></li>
         <li><a href="/main/inquirylist">진료과별 질문</a></li>
         <li><a href="/main/boardlist">진료 후기</a></li>
         <li><a href="/main/healthInfo">건강 정보</a></li>
      </ul>
   </div>

   <!-- 가운데 공지사항 섹션 -->
   <section class="content">
      <table>
         <caption><h2>공지 사항</h2></caption>
         <tr id="table-header" align="center">
            <th>작성자</th>
            <th id="ntitle">제 목</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
         <c:forEach items="${nmapAll}" var="ndto">
            <tr align="center">
               <td>병원장</td>
               <td id="nntitle">
                  <a href="notice_readnum?notice_id=${ndto.notice_id}">${ndto.title}</a>
               </td>
               <td>${ndto.writeday}</td>
               <td>${ndto.readnum}</td>
            </tr>
         </c:forEach>
      </table>

      <div class="page">
         <c:if test="${page > 1}">
            <a href="notice_list?page=${page - 1}">
               <i class="fas fa-angle-double-left"></i>
            </a>
         </c:if>
         <c:forEach var="i" begin="${pstart}" end="${pend}">
            <c:if test="${page==i}">
               <a class="current-page">${i}</a>
            </c:if>
            <c:if test="${page!=i}">
               <a href="notice_list?page=${i}">${i}</a>
            </c:if>
         </c:forEach>
         <c:if test="${page < chong}">
            <a href="notice_list?page=${page + 1}">
               <i class="fas fa-angle-double-right"></i>
            </a>
         </c:if>
      </div>

      <c:if test="${user_id=='admin'}">
         <div class="write-button">
            <a href="notice_write">공지 작성</a>
         </div>
      </c:if>
   </section>
</div>


</body>
</html>