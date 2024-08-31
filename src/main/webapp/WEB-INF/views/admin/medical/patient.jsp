<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {}
</style>
</head>
<body>
	<section>
		<table width="700">
			<tr>
				<th> 번호 </th>
				<th> 성함 </th>
				<c:if test="${user_id=='admin'}">
				<th> 담당의사 </th>
				</c:if>
				<th> 생년월일 </th>
				<th> 분야 </th>
				<th> 진료시간 </th>
			</tr>
			<c:forEach var="pdto" items="${pdto}">
			<tr>
				<td> ${pdto.res_id } </td>
				<td> <a href="patientView?res_id=${pdto.res_id}">${pdto.user_name }</a> </td>
				<c:if test="${user_id=='admin'}">
				<td> ${pdto.doc_name } </td>
				</c:if>
				<td> ${pdto.user_jumin }</td>
				<td> ${pdto.doc_part } </td>
				<td> ${pdto.res_date } ${pdto.res_time } </td>
			</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>