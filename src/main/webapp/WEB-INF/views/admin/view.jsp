<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {margin:auto; width: 600px;}
	table {}
</style>
</head>
<body>
	<section>
		<table>
			<tr>	
				<td rowspan="3"> <img src="" alt="사진"> </td>
				<td> <div>이름</div><div>${doctor.doc_name }</div> </td>
			</tr>
			<tr>
				<td> <div>번호</div><div>${doctor.doc_phone }</div> </td>
			</tr>
			<tr>
				<td> <div>분야</div><div>${doctor.doc_part }</div> </td>
			</tr>
			<tr>
				<td> 약력 </td>
				<td>
					<ul>
					<c:forEach var="his" items="${history}">
						<li>${his}</li>
					</c:forEach>
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <a href="">수정</a> <a href="">삭제</a>
			</tr>
		</table>
	</section>
</body>
</html>