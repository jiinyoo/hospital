<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {margin: 30px; width: 600px;}
	section > table  {width: 100%;}
	table tr {height: 30px;}
	.doc-img {width:20%; text-align: center;}
	th {background: #ccc;}
	.inner-table {width:100%;}
	.inner-table th {width:30%;}
</style>
</head>
<body>
	<section>
		<table>
			<tr>	
				<th colspan="2">의사정보</th>
			</tr>
			<tr>
				<td class="doc-img"> <img src="/static/admin/programfile/${doctor.doc_img }" width="100" alt="사진"> </td>
				<td>
					<table class="inner-table">
						<tr>
							<th>이름</th>
							<td>${doctor.doc_name}</td>
						</tr>
						<tr>
							<th>번호</th>
							<td>${doctor.doc_phone}</td>
						</tr>
						<tr>
							<th>분야</th>
							<td>${doctor.doc_part}</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<th colspan="2"> 약력 </th>
			</tr>
			<tr>
				<td colspan="2">
					<ul>
						<c:forEach var="his" items="${history}">
						<li>${his}</li>
						</c:forEach>
					</ul>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>