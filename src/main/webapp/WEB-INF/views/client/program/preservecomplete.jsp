<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<style>
section {
    margin: 100px auto; /* 페이지 중앙 정렬 및 위에서 100px 간격 */
    width: 600px; /* 상자의 너비 */
    background-color: white; /* 흰색 배경 */
    border: 1px solid #dddddd; /* 테두리 추가 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    border-radius: 10px; /* 모서리를 둥글게 */
    padding: 20px; /* 안쪽 여백 */
    text-align: left; /* 텍스트 정렬 */
}

section table {
    width: 100%; /* 테이블 너비를 상자에 맞춤 */
}

section caption {
    font-size: 1.5em; /* 캡션 크기 */
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}

section td {
    padding: 10px; /* 셀 내부 여백 */
    font-size: 20px; /* 글자 크기 */
}
	
</style>
<script>

</script>





<title>Insert title here</title>
</head>
<body>
	<section>
	<table>
		<caption>${user_id}님 예약이 완료 되셨습니다.</caption>
		<tr>
			<td style="background-color:grey; " width="200px">프로그램 명 </td>
			<td style="background-color:#F6F6F6;" >${pdto.pro_name}</td>
		</tr>
		<tr>
			<td style="background-color:grey; ">예약번호</td>
			<td style="background-color:#F6F6F6;">${prdto.pres_number}</td>
		</tr>
		<tr>
			<td style="background-color:grey; ">프로그램 활동일</td>
			<td style="background-color:#F6F6F6;">${prdto.pres_date}</td>		
		</tr>
		<tr>
			<td style="background-color:grey; ">프로그램 시작시간</td>
			<td style="background-color:#F6F6F6;">${prdto.pres_time}</td>
		</tr>
		<tr>
			<td  style="background-color:grey; ">예약 인원</td>
			<td  style="background-color:#F6F6F6;">${prdto.p_inwon}</td>
		</tr>
	</table>
	</section>
</body>
</html>