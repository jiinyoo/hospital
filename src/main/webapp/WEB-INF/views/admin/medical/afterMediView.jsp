<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 800px;
		margin: 0;
	}

	table {
		width: 100%;
		border-collapse: collapse;
	}

	table td {
		padding: 10px;
	}

	table td:nth-child(odd) {
	    background-color: #f0f0f0;
	    text-align: center;
	    font-weight: bold;
	}

	#res_code {
		border: none;
		background-color: transparent;
		pointer-events: none;
		width: 100%;
	}

	textarea {
		width: 100%;
		height: 100px;
	}

	select {
		width: 100%;
		height: 150px;
	}

	select#medi_type {
		margin-left: 10px;
	}
</style>
</head>
<body>
	<section>
		<table>
			<tr>
				<td> 성함 </td>
				<td> ${mdto.user_name } </td>
				<td> 생년월일 </td>
				<td> ${mdto.user_jumin } </td>
			</tr>
			<tr>
				<td> 방문과 </td>
				<td> ${mdto.medi_part }</td>
				<td> 방문일자 </td>
				<td> ${mdto.medi_visit }</td>
			</tr>
			<tr>
				<td> 증상 </td>
				<td> ${mdto.medi_content } </td>
				<td> 처방 </td>
				<td>
					<ul>
					<c:forEach var="medi" items="${mdto.medi_types}">
					<li>${medi }</li>
					</c:forEach>
					</ul>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>