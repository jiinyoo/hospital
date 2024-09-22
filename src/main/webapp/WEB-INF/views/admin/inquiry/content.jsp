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

</style>
<script>
function deletecheck() {
	return confirm("정말로 삭제하시겠습니까?")	
}
</script>
</head>
<body>
	<section>
	<table>
		<tr>
			<td>제목</td>
			<td>${aidto.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${aidto.user_id}</td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">${aidto.content}</td>
		</tr>
			<c:forEach items="${aidto.imgs}" var="img">
				<c:if test="${img!=''}">
		<tr>
				<td colspan="2">
				<div>
					<img src="../../static/client/inquiryfile/${img}">
				</div>
				</td>
		</tr>
				</c:if>
			</c:forEach>
		<tr>
			<td colspan="2" align="center">
			<!--1. 이글을 쓴 이의 userstate가 1이나 2면 수정 삭제 버튼이 뜬다.
				2. 이글을 쓴 이의 userstate가 0이면 삭제 버튼만 뜬다. inner join 필요-->
			<c:if test="${aidto.ustate==1 || aidto.ustate==2}">
			<a href="/admin/inquiry/update?inq_id=${aidto.inq_id}"><input type="button" value="수정"></a>
			<a href="/admin/inquiry/delete?inq_id=${aidto.inq_id}"><input type="button" value="삭제" onclick="return deletecheck()"></a>
			</c:if>
			<c:if test="${aidto.ustate==0}">
			<a href="/admin/inquiry/delete?inq_id=${aidto.inq_id}"><input type="button" value="삭제" onclick="return deletecheck()"></a>
			</c:if>
			</td>
		</tr>
	</table>
	</section>
</body>
</html>