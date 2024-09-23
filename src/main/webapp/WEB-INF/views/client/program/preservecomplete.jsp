<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 캐시 무효화 설정 -->

<!-- HTML 메타 캐시 제어 -->
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">




<style>
section {
       margin:auto;
       width: 1300px;
       height: 100vh; /* 뷰포트 전체 높이 사용 */
   }
   
   
table {
	margin:auto;
	margin-top:200px;

}



section {
    margin: auto;
    width: 1300px;
    height: 100vh; /* 뷰포트 전체 높이 사용 */
    display: flex;
    justify-content: center;
    align-items: center; /* 가운데 정렬 */
}

table {
    margin-top: 100px; /* 위쪽 간격 제거 */
    width: 600px; /* 테이블 너비 설정 */
    border-collapse: collapse; /* 셀 간의 테두리 겹침 방지 */
    background-color: #fff; /* 테이블 배경색 */
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* 테두리 그림자 추가 */
    border-radius: 10px; /* 테두리 둥글게 */
    overflow: hidden; /* 테두리 둥글게 할 때 내부 콘텐츠 넘어가는 문제 해결 */
}

table caption {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}

table td {
    padding: 15px;
    font-size: 16px;
    border-bottom: 1px solid #ddd; /* 셀 사이 구분선 */
}

table tr:last-child td {
    border-bottom: none; /* 마지막 행은 구분선 제거 */
}

table tr:nth-child(even) {
    background-color: #f9f9f9; /* 짝수 행에 배경색 추가 */
}
</style>






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