<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

      /* 페이지 전체에서 가운데 정렬 */
    section {
        margin:auto;
        width: 1300px;
        height: 100vh; /* 뷰포트 전체 높이 사용 */
    }
 
    table {
        width:1000px;
    	margin:auto;
    	margin-top:50px;
    	border-collapse: collapse;
    	
    }

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
	<main>
	<table>
		<tr>
			<td>제목</td>
			<td>${idto.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${idto.user_id}</td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">${idto.content}</td>
		</tr>
		<tr>
			<td colspan="2">
			<c:forEach items="${idto.imgs}" var="img">
				<c:if test="${img!=''}">
				<div>
					<img src="../../static/client/inquiryfile/${img}">
				</div>
				</c:if>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<c:if test="${session_user_id==idto.user_id}">
			<a href="/inquiry/update?inq_id=${idto.inq_id}"><input type="button" value="수정"></a>
			<a href="/inquiry/delete?inq_id=${idto.inq_id}"><input type="button" value="삭제" onclick="return deletecheck()"></a>
			</c:if>
			</td>
		</tr>
	</table>
	</main>
</body>
</html>