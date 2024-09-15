<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
	<table>
		<caption>${user_id}님 예약이 완료 되셨습니다.</caption>
		<tr>
			<td>프로그램 명 </td>
			<td>${pdto.pro_name}</td>
		</tr>
		<tr>
			<td>예약번호</td>
			<td>${prdto.pres_number}</td>
		</tr>
		<tr>
			<td>프로그램 활동일</td>
			<td>${prdto.pres_date}</td>		
		</tr>
		<tr>
			<td>프로그램 시작시간</td>
			<td>${prdto.pres_time}</td>
		</tr>
		<tr>
			<td>예약 인원</td>
			<td>${prdto.p_inwon}</td>
		</tr>
	</table>
	</section>
</body>
</html>