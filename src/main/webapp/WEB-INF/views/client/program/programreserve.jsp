<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
	section {
        margin:auto;
        width: 1300px;
        height: 100vh; /* 뷰포트 전체 높이 사용 */
    }
    /* 테이블의 최대 너비 설정 및 가운데 정렬 */

#programtable {
	margin-top:30px;
	align:center;
	text-align:center;
	border-spacing:0px;
	border:1px solid black;
}

#programtable td {
	border:1px solid black;
}


#programtable tr:first-child{
	background-color: #B5B2FF;
}



#calendar-outer table {
	border-spacing:0px;
	margin:auto;

}


#calendar-outer table thead {
	background-color: #B5B2FF;
}


#calendar-outer table td {
	text-align:center;
	vertical-align: top;
	padding: 5px;
	width:100px;
	height:100px;
	border-spacing:none;
}

.program {
	display: block;
	margin-top: 5px;
	font-size: small;

}

#calendar-navigation {
    width: 100%; /* 부모 요소 기준으로 가득 채움 */
    display: flex; /* 플렉스 박스 사용 */
    justify-content: center; /* 가운데 정렬 */
    margin: 20px 0; /* 위, 아래 여백 설정 */
} 

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var num=0
window.onload=function() {
	 num=0
	 var today = new Date();
	 currentYear = today.getFullYear(); // 전역 변수에 저장
	 currentMonth = today.getMonth() + 1; // 전역 변수에 저장
	 loadCalendar(currentYear, currentMonth);
	 document.getElementById("currentMonthYear").innerText=currentYear+"년"+currentMonth+"월";
}

var i=0
function changeMonth(value) {
	 	var today = new Date();
		currentYear = today.getFullYear(); // 전역 변수에 저장
		num=num+value;
		currentMonth = today.getMonth()+1+num; // 전역 변수에 저장
	 	if(currentMonth==0){
	 		i=0
	 	}
	   	if(currentMonth<0) {
	   		i=(Math.floor((currentMonth-1)/12)*-1)-1
	   	}
	   	if(currentMonth>0) {
		   	i=Math.floor((currentMonth-1)/12)-1   
		}
		if(currentMonth<=(-12*i)) {
			 currentMonth=12*(i+1)+currentMonth;
			 currentYear=currentYear-(i+1);
		}
		if(currentMonth>12*i+12) {
			 currentMonth=currentMonth-12*(i+1);
			 currentYear=currentYear+(i+1);
		}
	 
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


</script>
</head>
<body>
<section>
	<div id="programs">
		<table id="programtable">
		<caption><h2>진행 예정 및 진행 중 프로그램</h2></caption>
		    <tr>
		        <td width="150px">프로그램 이름 </td>
		        <td width="100px">강사</td>
		        <td width="100px">파트</td>
		        <td width="300px">프로그램 이미지</td>
		        <td width="150px">시작일</td>
		        <td width="150px">종료일</td>
		        <td width="100px">해당요일</td>
		        <td width="150px">일일 수용 인원</td>
		        <td width="120px">진행/진행 예정</td>
		        
		    </tr>
		    <c:forEach items="${plist}" var="pdto">
		    
		        <c:set var="end_date" value="${pdto.end_date}"/>
		        <c:set var="start_date" value="${pdto.start_date}"/>
		        <fmt:parseDate value="${end_date}" var="end_date" pattern="yyyy-MM-dd"/>
		        <fmt:parseDate value="${start_date}" var="start_date" pattern="yyyy-MM-dd"/>
		        <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" var="today"/>
		        <fmt:parseDate value="${today}" var="today_date" pattern="yyyy-MM-dd"/>
		
		
		      <c:choose>
				  <c:when test="${start_date.equals(today_date) || (start_date.before(today_date) && end_date.after(today_date))}">
				      <!-- 진행 중인 프로그램 -->
				      <tr>
				          <td>${pdto.pro_name}</td>
				          <td>${pdto.teach_name}</td>
				          <td>${pdto.pro_part}</td>
				          <td><img src="../../static/admin/programfile/${pdto.pro_img}" width="300px"></td>
				          <td>${pdto.start_date}</td>
				          <td>${pdto.end_date}</td>
				          <td>${pdto.days_of_week}</td>
				          <td>${pdto.pro_inwon}</td>
				          <td>진행 중</td>
				      </tr>
				  </c:when>
				  <c:when test="${start_date.after(today_date)}">
				      <!-- 진행 예정 프로그램 -->
				      <tr>
				          <td>${pdto.pro_name}</td>
				          <td>${pdto.teach_name}</td>
				          <td>${pdto.pro_part}</td>
				          <td><img src="../../static/admin/programfile/${pdto.pro_img}" width="300px"></td>
				          <td>${pdto.start_date}</td>
				          <td>${pdto.end_date}</td>
				          <td>${pdto.days_of_week}</td>
				          <td>${pdto.pro_inwon}</td>
				          <td>진행 예정</td>
				      </tr>
				  </c:when>
				  <c:otherwise>
				      <!-- 기타 조건, 모든 조건이 일치하지 않는 경우 -->
				      <!-- 예를 들어 종료된 프로그램 처리 등 -->
				  </c:otherwise>
				</c:choose>

		    </c:forEach>
		</table>
	</div>
	
	
	<div id="space"></div>
	
	
	
	<div id="calendar-outer">
	<div id="calendar-navigation">
        <button id="prevMonth" onclick="changeMonth(-1)">◀ 이전</button>
        <span id="currentMonthYear"></span>  <!-- 현재 월/연도 표시 -->
        <button id="nextMonth" onclick="changeMonth(+1)">다음 ▶</button>
    </div>
	<div id="calendar"></div>
	</div>
</section>
</body>
</html>