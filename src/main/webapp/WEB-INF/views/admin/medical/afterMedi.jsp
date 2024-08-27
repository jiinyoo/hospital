<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {margin: 30px;}
	table {text-align: center;}
</style>
</head>
<body>
	<section>
		<table width="700">
			<tr>
				<th> 번호 </th>
				<th> 성함 </th>
				<th> 생년월일 </th>
				<th> 담당의사 </th>
				<th> 분야 </th>
				<th> 방문일 </th>
			</tr>
			<c:forEach var="mdto" items="${mdto}">
			<tr>
				<td> ${mdto.medi_id } </td>
				<td> ${mdto.user_name } </td>
				<td> ${mdto.user_jumin }</td>
				<td> ${mdto.doc_name } </td>
				<td> ${mdto.medi_part} </td>
				<td> ${mdto.medi_visit} </td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center">
				<c:forEach var="i" begin="${pstart}" end="${pend}">
				<a href="afterMedi?page=${i}">${i}</a>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<form method="get" action="afterMedi">
						<select name="stype">
							<option value="user_name">성함</option>
							<option value="doc_name">담당의사</option>
							<option value="medi_part">분야</option>
						</select>
						<input type="text" name="sword">
					</form>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>