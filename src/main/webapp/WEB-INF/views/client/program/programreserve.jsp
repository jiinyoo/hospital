<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>

table td {
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



.modal {
    display: none; /* 기본적으로 보이지 않음 */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
}

.btn {
    margin: 5px;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn:hover {
    background-color: #45a049;
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



function viewconfirm(user_id,pro_ju,pro_name) {
	
	    if (confirm(user_id + "님 " + "토요일"+(pro_ju + 1) + "주차"+pro_name+ "수업을 신청하시겠습니까?")) {
	        alert("hi");
	    }
	
}



function showModal(message, callback) {
    // 모달 요소 가져오기
    var modal = document.getElementById("confirmModal");
    var modalMessage = document.getElementById("modalMessage");
    var confirmBtn = document.getElementById("confirmBtn");
    var cancelBtn = document.getElementById("cancelBtn");

    // 메시지 설정
    modalMessage.textContent = message;

    // 모달 보이기
    modal.style.display = "flex";

    // 확인 버튼 클릭 시
    confirmBtn.onclick = function() {
        modal.style.display = "none"; // 모달 숨기기
        callback(true); // 확인 선택 시 true 전달
    };

    // 취소 버튼 클릭 시
    cancelBtn.onclick = function() {
        modal.style.display = "none"; // 모달 숨기기
        callback(false); // 취소 선택 시 false 전달
    };
}

function viewconfirm(user_id, pro_ju, pro_name) {
    var message = user_id + "님, 토요일 " + (pro_ju + 1) + "주차 " + pro_name + " 수업을 신청하시겠습니까?";
    
    // 커스텀 모달 호출
    showModal(message, function(confirmed) {
        if (confirmed) {
            alert("수업 신청이 완료되었습니다.");
            location.href="/program/preserveOk?user_id="+user_id+"&pro_ju?="+pro_ju+"&pro_name?="+pro_name;
        } else {
            alert("수업 신청이 취소되었습니다.");
        }
    });
}

</script>
</head>
<body>
<section>
	
	<div id="confirmModal" class="modal">
    <div class="modal-content">
        <span id="modalMessage"></span>
        <br/><br/>
        <button id="confirmBtn" class="btn">확인</button>
        <button id="cancelBtn" class="btn">취소</button>
    </div>
	</div>
	
	
	
	
	
	
	<div id="calendar-navigation">
        <button id="prevMonth" onclick="changeMonth(-1)">◀ 이전</button>
        <span id="currentMonthYear"></span>  <!-- 현재 월/연도 표시 -->
        <button id="nextMonth" onclick="changeMonth(+1)">다음 ▶</button>
    </div>
	<div id="calendar"></div>

</section>
</body>
</html>