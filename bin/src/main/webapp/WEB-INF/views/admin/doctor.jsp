<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {width: 600px; border: 1px solid black; padding-left: 20px;}
</style>
</head>
<body>	
<section>
	<table>
		<h2>의료진</h2>
		<tr>
			<td> 번호 </td>
			<td> 이름 </td>
			<td> 진료과 </td>
			<td> 전화번호 </td>
			<td> 근무시작일 </td>
		</tr>
		<c:forEach var="doctor" items="${doctorList}">
		<tr>
			<td> ${doctor.doc_id } </td>
			<td> <a href="view?doc_id=${doctor.doc_id}">${doctor.doc_name }</a> </td>
			<td> ${doctor.doc_part } </td>
			<td> ${doctor.doc_phone } </td>
			<td> ${doctor.writeday } </td>
		</tr>	
		</c:forEach>
	</table>
</section>
</body>
</html>