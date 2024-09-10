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
		<c:if test="${imap.state==1&&imap.answer==0}">
		<a href="/admin/inquiry/write?part=${imap.part}&group_order=${imap.group_order}&bimil=${imap.bimil}&origin_user_id=${imap.user_id}&inq_id=${imap.inq_id}"><input type="button" value="답변 달기"></a>
		</c:if>
		<c:if test="${imap.state==1&&imap.answer==1}">
		답변 완료
		</c:if>
		
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5"></td>
	</tr>

</table>
</section>


</body>
</html>
