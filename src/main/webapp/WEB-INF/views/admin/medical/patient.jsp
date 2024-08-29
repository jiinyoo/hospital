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
				<c:if test="${admin=='admin'}">
				<th> 담당의사 </th>
				</c:if>
				<th> 생년월일 </th>
				<th> 분야 </th>
				<th> 진료시간 </th>
			</tr>
			<c:forEach var="pdto" items="${pdto}">
			<tr>
				<td> ${pdto.res_id } </td>
				<td> <a href="patientVeiw?user_name=${pdto.res_id}">${pdto.user_name }</a> </td>
				<c:if test="${admin=='admin'}">
				<td> ${pdto.doc_name } </td>
				</c:if>
				<td> ${pdto.user_jumin }</td>
				<td> ${pdto.doc_part } </td>
				<td> ${pdto.res_date } ${pdto.res_time } </td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="${admin=='admin'?6:5}" align="center">
				<c:forEach var="i" begin="${pstart}" end="${pend}">
				<a href="afterMedi?page=${i}">${i}</a>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<form method="get" action="afterMedi">
						<select name="stype">
							<option value="m.user_name">성함</option>
							<c:if test="${admin=='admin'}">
							<option value="m.doc_name">담당의사</option>
							</c:if>
							<option value="m.medi_part">분야</option>
						</select>
						<input type="text" name="sword">
						<input type="submit" value="검색">
					</form>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>