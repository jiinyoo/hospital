<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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


    .write-button {
    	font-family: 'goorm-sans-bold';
        display: inline-block;
        padding: 10px 20px;
        background-color: #004fa8;
        color: white;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        margin-top: 20px;
        text-align: right;
        border:none;
    }

    .write-button:hover {
        background-color: #033D7F;
    }
    
    .page {
        text-align: center;
        margin-top: 20px;
        cursor: pointer;
    }

    .arrow {
        display: inline-block;
        padding: 8px 16px;
        background-color: #004fa8;
        color: white;
        margin: 0 2px;
        border-radius: 4px;
        text-decoration: none;
        font-size: 16px;
    }

    .arrow:hover {
        background-color: #033D7F;
    }
    
    .page .current-page {
    background-color: #033D7F;
    color: white;
    font-weight: bold;
    cursor: pointer;
}
    
	#sform input,#sform select {
		font-family: 'goorm-sans-bold';
		margin-left:8px;
		height:30px;
	}
	
	#sform {
		margin-top: 20px;
		text-align: center;
	}
	
	
	#sform input[type="submit"] {
		font-family: 'goorm-sans-bold';
        display: inline-block;
        width: 70px;
        height:30px;
        background-color: #004fa8;
        color: white;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        line-height: 18px;
        border:none;
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
	text-align: center;
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
<script>


window.onload=function() {
	
	var sword = "${param.sword}";
	var stype = "${param.stype}";
	if (sword) {
		document.getElementById("sword").value = sword;
	}
	if (stype) {
		document.getElementsByName("stype")[0].value = stype;
	}
	
}
</script>
</head>
<body>

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

<section class="content">
<table>
	<caption><h2>진료 후기 게시판</h2></caption>
	<br>
	<tr>
		<th>작성자</th>
		<th id="ntitle">제 목</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${bmapAll}" var="bdto">
	<tr>
		<td width="100">${bdto.user_id}</td>
		<td   id="nntitle"  width="600"><a href="/main/boardreadnum?board_id=${bdto.board_id}">${bdto.board_title}</a></td>
		<td width="200">${bdto.writeday}</td>
		<td width="100">${bdto.board_readnum}</td>
	</tr>
	</c:forEach>

</table>
<br>
<div align="center" class="page">
	<c:if test="${pstart!=1}">		
		<a href="/main/boardlist?page=${pstart-1}&sword=${sword}&stype=${stype}"><span class="arrow"><i class="fas fa-angle-double-left"></i></span></a>
	</c:if>
	<c:if test="${pstart==1}">		
		 <span class="arrow"><i class="fas fa-angle-double-left"></i></span>
	</c:if>
	
	<c:if test="${page!=1}">
		<a href="/main/boardlist?page=${page-1}&sword=${sword}&stype=${stype}"><span class="arrow"><i class="fas fa-angle-left"></i></span></a>
	</c:if>
	<c:if test="${page==1}">
		<span class="arrow"><i class="fas fa-angle-left"></i></span>
	</c:if>
	
	
	<c:forEach begin="${pstart}" end="${pend}" var="i">
		<c:if test="${page==i}">
			<a  href="/main/boardlist?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow" style="background-color:#033D7F;">${i}</span></a>
		</c:if>
		<c:if test="${page!=i}">
			<a href="/main/boardlist?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow" >${i}</span></a>
		</c:if>
	</c:forEach>	
	
	<c:if test="${page!=chong }">
		<a href="/main/boardlist?page=${page+1}&sword=${sword}&stype=${stype}"><span class="arrow" ><i class="fas fa-angle-right"></i></span></a>
	</c:if>
	<c:if test="${page==chong }">
		<span class="arrow" ><i class="fas fa-angle-right"></i></span>
	</c:if>
	
	<c:if test="${pend!=chong }">
		<a href="/main/boardlist?page=${pend+1}&sword=${sword}&stype=${stype}"><span class="arrow" ><i class="fas fa-angle-double-right"></i></span></a>
	</c:if>
	<c:if test="${pend==chong}">
		<span class="arrow" ><i class="fas fa-angle-double-right"></i></span>
	</c:if>
</div>
<br>
<div>
	<form name="pkc" id="sform" action="/main/boardlist" method="post">
		<select name="stype">
			<option value="user_id">작성자</option>			
			<option value="board_title">제목</option>
			<option value="board_content">내용</option>
		</select>
		<input type="text" name="sword" id="sword">
		<input type="submit" value="검색">
	</form>
</div>
<div align="right">
	<input type="button" class="write-button" onclick="location='../../main/boardwrite'" value="글쓰기">
</div>
</section>
</div>
</body>
</html>