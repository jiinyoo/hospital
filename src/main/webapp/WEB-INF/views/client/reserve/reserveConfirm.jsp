<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:300px;
		margin: auto;
	}
</style>
</head>
<body>
	<section>
		<h2>${rdto.user_id}님 예약완료</h2>
		<h3>예약 번호 : ${rdto.res_code }</h4>
		<div>예약 날짜 : ${rdto.res_date }</div>
		<div>예약 시간 : ${rdto.res_time }</div>
		<button onclick="location='/main/index'">메인으로</button>
	</section>
</body>
</html>