<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:800px;
		margin: 30px auto;
	}
	
	section table {
		width: 100%;
	}
	
	th {
		text-align: left;
		background: #ccc;
		
	}
	
	th,td {padding: 7px 16px;}
</style>
</head>
<body>
	<section>
		<table>
			<tr>
				<th>예약번호</th>
				<th>진찰과</th>
				<th>의사명</th>
				<th>예약일</th>
				<th>비고</th>
			</tr>
			
			<c:forEach var="res" items="${rdto }" varStatus="sts">
			
			<tr>
				<td>${res.res_code}</td>
				<td>${res.doc_part }</td>
				<td>${doctor[sts.index].doc_name }</td>
				<td>${res.res_date } ${res.res_time } </td>
				<td> ${resDate[sts.index]} </td>
			</tr>
			</c:forEach>		
		</table>
	</section>
	<c:if test="${empty rdto }">
	예약정보가 없습니다.
	</c:if>
</body>
</html>