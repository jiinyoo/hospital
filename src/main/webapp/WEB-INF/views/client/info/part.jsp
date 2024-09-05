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
		width:800px;
		margin: auto;
	}
	
	table {
		border: 1px solid black;
		width :100%;
		margin-top: 20px;
	}
	.info-img {
		text-align: center;
		width: 30%;
	}
	
	.info-img img {
		width: 180px;
		height: 280px;
	}
</style>
</head>
<body>
	<section>
		<c:forEach var="doc" items="${dlist}">
		<table>
			<tr>
				<td class="info-img">
					<img src="/static/admin/programfile/${doc.doc_img }">
					<div><h2>${doc.doc_name }</h2>/${doc.doc_part }</div>
				</td>
				<td>
					<ul>
					<c:forEach var="his" items="${doc.historys}">
						<li>${his}</li>
					</c:forEach>
					</ul>
				</td>
			</tr>
		</table>
		</c:forEach>
	</section>
</body>
</html>