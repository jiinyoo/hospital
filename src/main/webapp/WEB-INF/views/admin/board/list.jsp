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
	
	a {
		text-decoration:none;
		color:black;
		
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


function check() {
	return confirm("정말로 삭제하시겠습니까?")	
}

</script>
</head>
<body>
<section>
<table>

	<caption><h2>진료 후기 게시판</h2></caption>
	<tr>
		<td>작성자</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>삭제버튼</td>
	</tr>
	<c:forEach items="${bmapAll}" var="bdto">
	<tr>
		<td width="100">${bdto.user_id}</td>
		<td width="600"><a href="../../admin/board/readnum?board_id=${bdto.board_id}">${bdto.board_title}</a></td>
		<td width="200">${bdto.writeday}</td>
		<td width="100">${bdto.board_readnum}</td>
		<td width="150"><a href="/admin/board/delete?board_id=${bdto.board_id}" onclick="return check();"><input type="button" value="삭제"></a></td>
	</tr>
	</c:forEach>
	<tr align="center">
		<td colspan="5">
		
		
		<c:if test="${pstart!=1}">		
			<a href="/admin/board/list?page=${pstart-1}&sword=${sword}&stype=${stype}">◀◀</a>
		</c:if>
		<c:if test="${pstart==1}">		
			 ◀◀
		</c:if>
		
		<c:if test="${page!=1}">
			<a href="/admin/board/list?page=${page-1}&sword=${sword}&stype=${stype}">◁</a>
		</c:if>
		<c:if test="${page==1}">
			◁
		</c:if>
		
		
		<c:forEach begin="${pstart}" end="${pend}" var="i">
			<c:if test="${page==i}">
				<a href="/admin/board/list?page=${i}&sword=${sword}&stype=${stype}" style="color:red;">${i}</a>
			</c:if>
			<c:if test="${page!=i}">
				<a href="/admin/board/list?page=${i}&sword=${sword}&stype=${stype}">${i}</a>
			</c:if>
		</c:forEach>	
		
		<c:if test="${page!=chong }">
			<a href="/admin/board/list?page=${page+1}&sword=${sword}&stype=${stype}">▷</a>
		</c:if>
		<c:if test="${page==chong }">
			▷
		</c:if>
		
		<c:if test="${pend!=chong }">
			<a href="/admin/board/list?page=${pend+1}&sword=${sword}&stype=${stype}">▶▶</a>
		</c:if>
		<c:if test="${pend==chong}">
			▶▶
		</c:if>
		</td>
	</tr>
	<tr align="center">
		<td colspan="5">
		<form name="pkc" action="/admin/board/list" method="post">
			<select name="stype">
				<option value="user_id">작성자 아이디</option>			
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
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