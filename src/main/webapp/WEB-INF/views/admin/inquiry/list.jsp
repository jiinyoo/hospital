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
        margin:auto;
        width: 1300px;
        height: 100vh; /* 뷰포트 전체 높이 사용 */
    }
    /* 테이블의 최대 너비 설정 및 가운데 정렬 */
    table {
    
        width:1000px;
    	margin:auto;
    	margin-top: 30px;
    	border-collapse: collapse;
    }

    /* 테이블 내부 요소 스타일링 */
    td {
	    border-top: 1px solid black;
	    padding: 10px; /* 셀 내부 여백 조정 */
	    height: 30px;  /* 셀 높이 명확히 설정 */
	}
	
	table tr:first-child {
    	background-color: #B5B2FF;
	}
	
	
	#part {
		background-color:orange;
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
	<caption><h2>진료과별 질문 게시판</h2></caption>
	<tr>
		<td>작성자</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>답변 버튼</td>	
	</tr>
	<c:forEach items="${imapAll}" var="imap">
	<tr>
		<td width="100">${imap.user_id}</td>
		<td width="300">
		<c:if test="${imap.bimil==1}">
			<span id="bimil"><img src="../../static/client/inquiry/lock.png" width="20px"></span>
		</c:if>
		<c:if test="${imap.state==1}">
			<span id="part">${imap.part}</span>
		</c:if>
			<span id="title"><a href="/admin/inquiry/readnum?inq_id=${imap.inq_id}">${imap.title}</a></span>
		</a>
		</td>
		<td width="200">${imap.writeday}</a></td>
		<td width="100">${imap.readnum}</td>
		<td width="100">
		<c:if test="${imap.state==1 && imap.answer==0}">
		<a href="/admin/inquiry/write?part=${imap.part}&group_order=${imap.group_order}&bimil=${imap.bimil}&origin_user_id=${imap.user_id}&inq_id=${imap.inq_id}"><input type="button" value="답변 달기"></a>
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
	<tr align="center">
		<td colspan="5">
		
		
		<c:if test="${pstart!=1}">		
			<a href="/admin/inquiry/list?page=${pstart-1}&sword=${sword}&stype=${stype}">◀◀</a>
		</c:if>
		<c:if test="${pstart==1}">		
			 ◀◀
		</c:if>
		
		<c:if test="${page!=1}">
			<a href="/admin/inquiry/list?page=${page-1}&sword=${sword}&stype=${stype}">◁</a>
		</c:if>
		<c:if test="${page==1}">
			◁
		</c:if>
		
		
		<c:forEach begin="${pstart}" end="${pend}" var="i">
			<c:if test="${page==i}">
				<a href="/admin/inquiry/list?page=${i}&sword=${sword}&stype=${stype}" style="color:red;">${i}</a>
			</c:if>
			<c:if test="${page!=i}">
				<a href="/admin/inquiry/list?page=${i}&sword=${sword}&stype=${stype}">${i}</a>
			</c:if>
		</c:forEach>	
		
		<c:if test="${page!=chong }">
			<a href="/admin/inquiry/list?page=${page+1}&sword=${sword}&stype=${stype}">▷</a>
		</c:if>
		<c:if test="${page==chong }">
			▷
		</c:if>
		
		<c:if test="${pend!=chong }">
			<a href="/admin/inquiry/list?page=${pend+1}&sword=${sword}&stype=${stype}">▶▶</a>
		</c:if>
		<c:if test="${pend==chong}">
			▶▶
		</c:if>
		</td>
		</tr>
		<tr align="center">
			<td colspan="4">
			<form name="pkc" action="/admin/inquiry/list" method="post">
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
