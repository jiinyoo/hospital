<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
    margin: 10px auto;
    width: 1300px;
    min-height: 600px;
}

table {
    margin: 20px auto;
    width: 900px; /* 테이블의 너비를 고정 */
    background-color: white; /* 테이블 배경을 흰색으로 설정 */
    border-collapse: collapse; /* 테두리 겹침 제거 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 테두리에 그림자 추가 */
    border-radius: 10px; /* 테이블 모서리를 둥글게 처리 */
    overflow: hidden; /* 둥근 모서리에서 넘치는 부분 숨김 */
}

table caption {
    font-size: 1.5em;
    font-weight: bold;
    margin: 10px 0; /* 캡션 위아래 여백 설정 */
    text-align: center;
}

table td, table th {
    padding: 15px; /* 셀 내부 여백 */
    text-align: center; /* 텍스트 가운데 정렬 */
    border-bottom: 1px solid #dddddd; /* 셀 사이에 경계선 추가 */
    font-size: 16px; /* 글자 크기 */
}

table th {
    background-color: #f2f2f2; /* 테이블 헤더 배경색 */
    font-weight: bold;
}

#pre tr:first-child td {
    background-color: #BDBDBD; /* 첫 번째 행의 컬럼명 배경을 밝은 회색으로 설정 */
    font-weight: bold; /* 컬럼명은 굵게 표시 */
}

#past tr:nth-child(2) td {
    background-color: #f5f5f5; /* 두 번째 행의 배경을 밝은 회색으로 설정 */
    font-weight: bold; /* 글자를 굵게 설정 */
}
table tr:last-child td {
    border-bottom: none; /* 마지막 행의 경계선 제거 */
}

input[type="button"] {
    padding: 10px 20px; /* 버튼 내부 여백 */
    background-color: #007BC9; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    border: none;
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer;
}

input[type="button"]:hover {
    background-color: #005999; /* 마우스 오버 시 버튼 배경색 변경 */
}

input[type="submit"] {
    padding: 10px 20px; /* 버튼 내부 여백 */
    background-color: #007BC9; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    border: none;
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #005999; 
}

input[type="date"] {
    padding: 5px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid #dddddd;
}

/* 1개월, 3개월, 6개월, 전체보기 링크 스타일 */
.month-link {
    display: inline-block;
    padding: 10px 15px; /* 링크 내부 여백 */
    background-color: #007BC9; /* 파란색 배경 */
    color: white; /* 흰색 텍스트 */
    text-decoration: none; /* 밑줄 제거 */
    border-radius: 5px; /* 모서리를 둥글게 처리 */
    margin-right: 10px; /* 링크 간 간격 추가 */
    font-weight: bold;
}

.month-link:hover {
    background-color: #005999; /* 마우스 오버 시 배경색 변경 */
}
</style>
<script>

function check() {
	return confirm("정말로 취소하시겠습니까?")	
}



function validCalendar() {
	
	if(document.getElementById("start").value!="") {
		var startdate=new Date(document.getElementById("start").value);
		startdate.setDate(startdate.getDate()+1) //반환값이랑 실체 객체에 반영되는 것은 상이할 수 있다.
		var endstartYear=startdate.getFullYear();
		var endstartMonth=("0"+(startdate.getMonth()+1)).slice(-2);
		var endstartDate=("0"+startdate.getDate()).slice(-2);
		var formatdate=endstartYear+"-"+endstartMonth+"-"+endstartDate
		document.getElementById("end").setAttribute("min", formatdate);
	}
}

</script>
</head>
<body>
<section>
	<table width="900" id="pre">
	<caption style="height:40px"><h2>예정 프로그램</h2></caption>
	<tr style=" background-color: #f5f5f5; ">
		<td >예약 번호</td>
		<td>프로그램 명</td>
		<td>강사명</td>
		<td>예약일</td>
		<td>프로그램 시행일</td>
		<td>취소 버튼</td>
	</tr>
	<c:forEach items="${prlist}" var="prdto">
	<tr>
		<td>${prdto.pres_number}</td>	
		<td>${prdto.pro_name}</td>
		<td>${prdto.teach_name}</td>
		<td>${prdto.writeday}</td>
		<td>${prdto.pres_date}</td>
		<c:if test="${prdto.state==0}">
		<td><a href="/main/memberpreserve?pres_id=${prdto.pres_id}&pres_date=${prdto.pres_date}&p_inwon=${prdto.p_inwon}&pro_id=${prdto.pro_id}" onclick="return check()"><input type="button" value="예약 취소"></a></td>
		</c:if>
		<c:if test="${prdto.state==1||prdto.state==3}">
			<td>예약 취소 완료</td>
		</c:if>
	</tr>
	</c:forEach>
	</table>
	
	<table width="900"  id="past">
	<caption style="height:40px"><h2>지난 프로그램 예약</h2></caption>
	<form method="post" action="/main/memberpreserve">
	<input type="hidden" name="month" value="0">
	<tr>
		<td colspan="3" height="100px">
			<a href="/main/memberpreserve?month=1" class="month-link">1달이내</a>
			<a href="/main/memberpreserve?month=3" class="month-link">3달이내</a>
			<a href="/main/memberpreserve?month=6" class="month-link">6달이내</a>
			<a href="/main/memberpreserve?month=12" class="month-link">전체보기</a>
		</td>
		<td colspan="3">
			<input type="date" name="start" id="start">
			<input type="date" name="end" id="end" onclick=validCalendar()>
			<input type="submit" value="기간 검색">
		</td>
	<tr>	
	</form>

	<tr style=" background-color: #BDBDBD; ">
		<td>예약 번호</td>
		<td>프로그램 명</td>
		<td>강사명</td>
		<td>예약일</td>
		<td>프로그램 시행일</td>
		<td>비고</td>
	</tr>
	<c:forEach items="${prlist2}" var="prdto2">
	<tr>
		<td>${prdto2.pres_number}</td>	
		<td>${prdto2.pro_name}</td>
		<td>${prdto2.teach_name}</td>
		<td>${prdto2.writeday}</td>
		<td>${prdto2.pres_date}</td>
		<td>지난 프로그램</td>
		
	</tr>
	</c:forEach>
	</table>

</section>
</body>
</html>