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
        /* text-align: center; */
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
        font-weight: normal;
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
    	font-family: 'Noto Sans', sans-serif;
        text-align: center;
        margin-top: 20px;
        border:none;
       
    }

    .arrow {
        display: inline-block;
        padding: 8px 16px;
        background-color: #004fa8;
        color: white;
        margin: 0 2px;
        border-radius: 5px;
        text-decoration: none;
        cursor: pointer;
    }

    .arrow:hover {
        background-color: #033D7F;
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
	
	#answerbutton {
		height:30px;
		width:70px;
		background-color:#004fa8;
		color:white;
		border:1px solid #004fa8;
		border-radius:3px;
	}
	
</style>


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
<body><!--(inquiry)list -->
<section>
	<table>
	<caption><h2 style="text-align:center">진료과별 질문 게시판</h2></caption>
	<tr>
		<th>작성자</th>
		<th id="ntitle">제목</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>답변 버튼</th>	
	</tr>
	<c:forEach items="${imapAll}" var="imap">
	<tr>
		<td width="100">${imap.user_id}</td>
		<td width="300" id="nntitle">
		<c:if test="${imap.bimil==1}">
			<span id="bimil"><img src="../../static/client/inquiry/lock.png" width="20px"></span>
		</c:if>
		<c:if test="${imap.state==1}">
			<span id="part">${imap.part}</span>
		</c:if>
		<!-- 빨간 줄 뜨지만 동작하는 코드 -->
			<span id="title"
			<c:if test="${imap.answer==0 && imap.state==2}">
				<c:if test="${imap.bimil==1}">
					style="position: relative; left: 26px;"
				</c:if>
				<c:if test="${imap.bimil!=1}">
        			 style="position: relative; left: 50px;"
				</c:if>
    		</c:if>>
    		<a href="/admin/inquiry/readnum?inq_id=${imap.inq_id}">${imap.title}</a></span>
		</a>
		</td>
		<td width="200">${imap.writeday}</a></td>
		<td width="100">${imap.readnum}</td>
		<td width="100">
		<c:if test="${imap.state==1 && imap.answer==0}">
		<a href="/admin/inquiry/write?part=${imap.part}&group_order=${imap.group_order}&bimil=${imap.bimil}&origin_user_id=${imap.user_id}&inq_id=${imap.inq_id}"><input type="button" value="답변 달기" id="answerbutton"></a>
		</c:if>
		<c:if test="${imap.state==1 && imap.answer==1}">
		답변 완료
		</c:if>
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5"></td>
	</tr>
	<tr align="center" class="page">
		<td colspan="5">
		
		
		<c:if test="${pstart!=1}">		
			<a href="/admin/inquiry/list?page=${pstart-1}&sword=${sword}&stype=${stype}"><span class="arrow"><i class="fas fa-angle-double-left"></i></span></a>
		</c:if>
		<c:if test="${pstart==1}">		
			<span class="arrow"><i class="fas fa-angle-double-left"></i></span>
		</c:if>
		
		<c:if test="${page!=1}">
			<a href="/admin/inquiry/list?page=${page-1}&sword=${sword}&stype=${stype}"><span class="arrow"><i class="fas fa-angle-left"></i></span></a>
		</c:if>
		<c:if test="${page==1}">
			<span class="arrow"><i class="fas fa-angle-left"></i></span>
		</c:if>
		
		
		<c:forEach begin="${pstart}" end="${pend}" var="i">
			<c:if test="${page==i}">
				<a href="/admin/inquiry/list?page=${i}&sword=${sword}&stype=${stype}" ><span class="arrow" style="background-color:#033D7F;">${i}</span></a>
			</c:if>
			<c:if test="${page!=i}">
				<a href="/admin/inquiry/list?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow">${i}</span></a>
			</c:if>
		</c:forEach>	
		
		<c:if test="${page!=chong }">
			<a href="/admin/inquiry/list?page=${page+1}&sword=${sword}&stype=${stype}"><span class="arrow"><i class="fas fa-angle-right"></i></span></a>
		</c:if>
		<c:if test="${page==chong }">
			<span class="arrow"><i class="fas fa-angle-right"></i></span>
		</c:if>
		
		<c:if test="${pend!=chong }">
			<a href="/admin/inquiry/list?page=${pend+1}&sword=${sword}&stype=${stype}"><span class="arrow"><i class="fas fa-angle-double-right"></i></span></a>
		</c:if>
		<c:if test="${pend==chong}">
			<span class="arrow"><i class="fas fa-angle-double-right"></i></span>
		</c:if>
		</td>
		</tr>
		<tr align="center">
			<td colspan="5">
			<form name="pkc" action="/admin/inquiry/list" method="post" id="sform">
				<select name="stype">
					<option value="user_id">작성자 아이디</option>			
					<option value="title">제목</option>
					<option value="part">과</option>
					<input type="text" name="sword" id="sword">
					<input type="submit" value="검색">
				</select>
			</form>
			</td>
		</tr>


</table>
</section>


</body>
</html>
