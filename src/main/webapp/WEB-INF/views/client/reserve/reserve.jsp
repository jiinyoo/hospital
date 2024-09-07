<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<style>
	section {
		width:1100px;
		margin: 30px auto;
	}
	table {
		width: 100%;
		border-collapse: collapse;
	}
	th, td {
		width: 14.28%;
		text-align: center;
		border: 1px solid #ccc;
		padding: 10px;
	}
</style>
</head>
<body>
<section>
	<h1>${year}년 ${month}월</h1>
	<table>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
			<!-- 첫 주의 첫날까지 빈 칸을 출력 -->
			<c:if test="${firstday > 0}">
				<c:forEach var="i" begin="0" end="${firstday - 1}">
					<td></td>
				</c:forEach>
			</c:if>

			<!-- 날짜 출력 -->
			<c:forEach var="day" begin="1" end="${chong}" varStatus="status">	
				<c:set var="date" value="${year}-${month<10?'0':''}${month}-${day<10?'0':''}${day}" />
				<td><a href="${date }">${day}</a></td>
				<!-- 한 주가 끝나면 줄바꿈 -->
				<c:if test="${(firstday + status.index-1) % 7 == 6}">
					</tr><tr>
				</c:if>
			</c:forEach>

			<!-- 마지막 주가 끝나지 않았다면 빈 칸 출력 -->
			<c:forEach var="i" begin="0" end="${(6 - (firstday + chong) % 7)}">
				<td></td>
			</c:forEach>
		</tr>
	</table>
</section>
</body>
</html>
