<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<table>
			<tr>
				<td>예약번호</td>
				<td>진찰과</td>
				<td>의사명</td>
				<td>예약일</td>
				<td>비고</td>
			</tr>
			<c:forEach var="res" items="${rdto }" varStatus="sts">
			<fmt:parseDate value="${res.res_date} ${res.res_time}" pattern="yyyy-MM-dd HH:mm" var="date"/>
			<fmt:formatDate value="${date }" pattern="yyyy-MM-dd" var="date"/>
			<tr>
				<td>${res.res_code}</td>
				<td>${res.doc_part }</td>
				<td>${doctor[sts.index].doc_name }</td>
				<td align="center">
					<div>${res.res_date }</div>
					<div>${res.res_time }</div>
				</td>
				<td>${res.state==1?'진료완료':'진료예정'}</td>
			</tr>
			</c:forEach>		
		</table>
	</section>
	<c:if test="${empty rdto }">
	예약정보가 없습니다.
	</c:if>
</body>
</html>