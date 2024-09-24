<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
        background-color: #fff; /* 전체 배경색 흰색 설정 */
        margin: 0; /* 기본 여백 제거 */
    }
    section {
        margin: auto;
        width: 1300px;
        height: 100vh; /* 뷰포트 전체 높이 사용 */
        display: flex; /* Flexbox 사용 */
        justify-content: center; /* 가로 가운데 정렬 */
        align-items: center; /* 세로 가운데 정렬 */
    }
    /* 테이블의 최대 너비 설정 및 가운데 정렬 */
    table {
        width: 1000px;
        margin: auto;
        margin-top: 30px;
        border-collapse: collapse;
        background-color: #fff; /* 테이블 배경색 흰색 설정 */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        border-radius: 5px; /* 모서리 둥글게 */
    }

    /* 테이블 내부 요소 스타일링 */
    td {
        border-top: 1px solid #d3d3d3; /* 연한 회색 */
        border-right: 1px solid #d3d3d3; /* 오른쪽 경계선 연한 회색 */
        padding: 10px; /* 셀 내부 여백 조정 */
        height: 30px;  /* 셀 높이 명확히 설정 */
        text-align: center; /* 가운데 정렬 */
    }

    td:last-child {
        border-right: none; /* 마지막 열의 오른쪽 경계선 제거 */
    }

    img {
        max-width: 100%; /* 이미지 너비 조정 */
        height: auto; /* 비율 유지 */
    }
    
    
    .buttons {
    	width:50px;
    	height:40px;
    	border-radius:3px;
    	border : 1px solid #004fa8;
    	background-color:#004fa8;
    	color:white;
    	
    
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
			<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">제목</td>
			<td>${aidto.title}</td>
		</tr>
		<tr>
			<td style="background-color:#ECEBEF;border-left:5px solid #004fa8;">작성자</td>
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
			<a href="/admin/inquiry/update?inq_id=${aidto.inq_id}"><input type="button" value="수정" class="buttons"></a>
			<a href="/admin/inquiry/delete?inq_id=${aidto.inq_id}"><input type="button"  class="buttons" value="삭제" onclick="return deletecheck()"></a>
			</c:if>
			<c:if test="${aidto.ustate==0}">
			<a href="/admin/inquiry/delete?inq_id=${aidto.inq_id}"><input type="button" value="삭제" class="buttons" onclick="return deletecheck()"></a>
			</c:if>
			</td>
		</tr>
	</table>

	</section>
</body>
</html>