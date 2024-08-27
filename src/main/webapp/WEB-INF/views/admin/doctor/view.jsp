<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {margin: 30px; width: 600px; border: 1px solid black;}
	.doctor {display: flex;}
	.doc_photo {width:30%; height: 100px; border:1px solid black;}
	.info {
		display: grid; 
		width:100%;
		grid-template-columns:0.3fr 1fr;
		border:1px solid black;
		align-items: center;
	}
</style>
</head>
<body>
	<section>
		<div class="doctor">
			<div class="doc_photo"> <img src="" alt="사진"> </div>
			<div class="info">
				<div>이름</div><div>${doctor.doc_name}</div>
				<div>번호</div><div>${doctor.doc_phone}</div>
				<div>분야</div><div>${doctor.doc_part}</div>
			</div>
		</div>
			<ul> 약력
				<c:forEach var="his" items="${history}">
				<li>${his}</li>
				</c:forEach>
			</ul>
	</section>
</body>
</html>