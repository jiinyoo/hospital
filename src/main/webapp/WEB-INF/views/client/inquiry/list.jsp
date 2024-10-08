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

	#part {
		background-color:orange;
	}

</style>
<script>
function check(user_id,bimil,inq_id) {
	var session_user_id="${session_user_id}";
	if(bimil==1) {
		if(user_id==session_user_id) {
			location.href="/inquiry/readnum?inq_id="+inq_id;
		} else {
			alert("작성자만 볼 수 있는 비밀글입니다.")
		}
	} else {
		location.href="/inquiry/readnum?inq_id="+inq_id;	
	}
}


function logincheck() {
	var session_user_id="${session_user_id}";
	if(session_user_id=="") {
		alert("로그인 하셔야 글 작성이 가능합니다.")
	}else {
		location.href="/inquiry/write";
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
	</tr>
	<c:forEach items="${imapAll}" var="imap">
	<tr>
		<td width="100">${imap.user_id}</td>
		<td width="600">
		<c:if test="${imap.bimil==1}">
			<span id="bimil"><img src="../../static/client/inquiry/lock.png" width="20px"></span>
		</c:if>
			<span id="part">${imap.part}</span>
			<span id="title" onclick="check('${imap.user_id}','${imap.bimil}','${imap.inq_id}')"><a href="#">${imap.title}</a></span>
		</a></td>
		<td width="200">${imap.writeday}</a></td>
		<td width="100">${imap.readnum}</td>
	</tr>
	</c:forEach>
	<tr align="right">
		<td colspan="4"><input type="button" value="글쓰기" onclick="logincheck()"></td>
	</tr>
</table>
</section>
</body>
</html>