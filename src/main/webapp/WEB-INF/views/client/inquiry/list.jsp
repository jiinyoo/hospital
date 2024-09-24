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
    }

    .write-button:hover {
        background-color: #033D7F;
    }
    
    .page {
        text-align: center;
        margin-top: 20px;
    }

    .page .arrow {
        display: inline-block;
        padding: 8px 16px;
        background-color: #004fa8;
        color: white;
        margin: 0 2px;
        text-decoration: none;
    }

    .page .arrow:hover {
        background-color: #033D7F;
    }
    
	#sform input,#sform select {
		font-family: 'goorm-sans-bold';
		margin-left:8px;
		height:30px;
	}
	
	#sform {
		margin-top: 20px;
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
        line-height: 30px;
	}
</style>
<script>
function check(user_id, bimil, inq_id, origin_user_id) {
    var session_user_id = "${session_user_id}";
    var sessionstate="${sessionstate}"
    if (bimil == 1) {
        if (user_id == session_user_id ) {//이 글의 user_id가 session_id와 같을 때
        	location.href = "/main/inquiryreadnum?inq_id=" + inq_id;
        } else if(origin_user_id == session_user_id) {
            location.href = "/main/inquiryreadnum?inq_id=" + inq_id;
        } else if (sessionstate ==1 || sessionstate==2) {
            location.href = "/main/inquiryreadnum?inq_id=" + inq_id;
        } else {
            alert("작성자만 볼 수 있는 비밀글입니다.");
        }
    } else {
        location.href = "/main/inquiryreadnum?inq_id=" + inq_id;
    }
}

function logincheck() {
	var session_user_id="${session_user_id}";
	if(session_user_id=="") {
		alert("로그인 하셔야 글 작성이 가능합니다.")
	}else {
		location.href="/main/inquirywrite";
	}
}




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
<body><!--(inquiry)list -->
<section>
	<table>
	<caption><h2 >진료과별 질문 게시판</h2></caption>
	<tr>
		<th>작성자</th>
		<th id="ntitle">제목</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${imapAll}" var="imap">
	<tr>
		<td width="100">${imap.user_id}</td>
		<td width="600" id="nntitle">
		<c:if test="${imap.bimil==1}">
			<span id="bimil"><img src="../../static/client/inquiry/lock.png" width="20px"></span>
		</c:if>
		<c:if test="${imap.state==1}">
			<span id="part">${imap.part}</span>
		</c:if>
		
		
		<!-- 빨간 줄 뜨지만 보이는 코드 -->
		
			<span id="title" onclick="check('${imap.user_id}','${imap.bimil}','${imap.inq_id}','${imap.origin_user_id != null ? imap.origin_user_id : ''}')"
			<c:if test="${imap.answer==0 && imap.state==2}">
				<c:if test="${imap.bimil==1}">
					style="position: relative; left: 26px;"
				</c:if>
				<c:if test="${imap.bimil!=1}">
        			 style="position: relative; left: 50px;"
				</c:if>
    		</c:if>>
	
			<a href="#">${imap.title}</a></span>
		</a></td>
		<td width="200">${imap.writeday}</a></td>
		<td width="100">${imap.readnum}</td>
	</tr>
	</c:forEach>
	</table>

	<div align="center" class="page">		
		<c:if test="${pstart!=1}" >		
			<a href="/main/inquirylist?page=${pstart-1}&sword=${sword}&stype=${stype}"><span class="arrow">◀◀</span></a>
		</c:if>
		<c:if test="${pstart==1}">		
			 <span class="arrow">◀◀</span>
		</c:if>
		
		<c:if test="${page!=1}">
			<a href="/main/inquirylist?page=${page-1}&sword=${sword}&stype=${stype}"><span class="arrow">◁</span></a>
		</c:if>
		<c:if test="${page==1}">
			<span class="arrow">◁</span>
		</c:if>
		
		
		<c:forEach begin="${pstart}" end="${pend}" var="i">
			<c:if test="${page==i}">
				<a href="/main/inquirylist?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow" style="background-color:#033D7F;">${i}</span></a>
			</c:if>
			<c:if test="${page!=i}">
				<a href="/main/inquirylist?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow">${i}</span></a>
			</c:if>
		</c:forEach>	
		
		<c:if test="${page!=chong }">
			<a href="/main/inquirylist?page=${page+1}&sword=${sword}&stype=${stype}"><span class="arrow">▷</span></a>
		</c:if>
		<c:if test="${page==chong }">
			<span class="arrow">▷</span>
		</c:if>
		
		<c:if test="${pend!=chong }">
			<a href="/main/inquirylist?page=${pend+1}&sword=${sword}&stype=${stype}"><span class="arrow">▶▶</span></a>
		</c:if>
		<c:if test="${pend==chong}">
			<span class="arrow">▶▶</span>
		</c:if>
	</div>
	<div align="center">
		
		<form name="pkc" action="/main/inquirylist" method="post" id="sform">
			<select name="stype">
				<option value="user_id">작성자</option>			
				<option value="title">제목</option>
				<option value="part">진료과</option>
			</select>
			<input type="text" name="sword" id="sword">
			<input type="submit" value="검색">
		</form>
	</div>
	<div align="right">
		<input type="button" value="글쓰기" onclick="logincheck()" class="write-button">
	</div>
</section>
</body>
</html>