<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=button]
{
	width:100px;
	height:50px;

}

table td{
	border-spacing:0px;
	border:1px solid black;

}
</style>
<script>
</script>
</head>
<body>
<section>
<a href="/admin/program/programwrite"><input type="button" value="프로그램 등록"></a>
	<table>
		<tr>
			<td width="100px">프로그램 이름</td>
			<td width="100px">강사</td>
			<td width="100px">파트</td>
			<td width="100px">프로그램 이미지</td>
			<td width="100px">삭제 및 수정</td>
			<td width="150px">시작일</td>
			<td width="150px">종료일</td>
			<td width="100px">해당요일</td>
		</tr>
	<c:forEach items="${plist}" var="pdto">
	
		<tr>
			<td>${pdto.pro_name}</td>
			<td>${pdto.teach_name}</td>
			<td>${pdto.pro_part}</td>
			<td>
				<img src="../../static/admin/programfile/${pdto.pro_img}" width="300px">
			</td>
			<td><a href="/admin/program/programdelete?pro_id=${pdto.pro_id}"><input type="button" value="삭제"></a>
				<a href="/admin/program/programupdate?pro_id=${pdto.pro_id}"><input type="button" value="수정"></a>
			</td>
			<td>${pdto.start_date}</td>
			<td>${pdto.end_date}</td>
			<td>${pdto.days_of_week}</td>
			<td>
			
			 </td>
		</tr>
	</c:forEach>
	
	</table>
		

</section>
</body>
</html>