<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload=function() {
	 var today = new Date();
	 currentYear = today.getFullYear(); // 전역 변수에 저장
	 currentMonth = today.getMonth() + 1; // 전역 변수에 저장
	 loadCalendar(currentYear, currentMonth);
	 document.getElementById("currentMonthYear").innerText=currentYear+"년"+currentMonth+"월";
	 
}

function loadCalendar(year, month) {
    var xhr = new XMLHttpRequest();  // XMLHttpRequest 객체 생성
    var url = "/program/calendar?year=" + year + "&month=" + month;  // 요청 URL에 파라미터 추가

    xhr.open("GET", url, true);  // 비동기 요청 설정

    // 성공 시
    xhr.onload = function() {
        if (xhr.status === 200) {  // 서버 응답이 성공적이면
            document.getElementById("calendar").innerHTML = xhr.responseText;  // HTML 업데이트
            
        } else {
            alert("달력을 로드하는 데 실패했습니다.");  // 오류 처리
        }
    };

    // 오류 발생 시
    xhr.onerror = function() {
        alert("요청을 처리하는 중 오류가 발생했습니다.");
    };

    xhr.send();  // 요청 보내기
}


function prevMonth(value) {
	
	
	
}

</script>
</head>
<body>
<section>
	
	<div id="calendar-navigation">
        <button id="prevMonth" onclick="prevMonth(-1)">◀ 이전</button>
        <span id="currentMonthYear"></span>  <!-- 현재 월/연도 표시 -->
        <button id="nextMonth" onclick="nextMonth(+1)">다음 ▶</button>
    </div>
	<div id="calendar"></div>

</section>
</body>
</html>