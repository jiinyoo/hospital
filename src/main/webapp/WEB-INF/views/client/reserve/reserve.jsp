<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<style>
    
    section {
        width: 1200px;
        margin: 30px auto;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
    }

    .category {
        border: 1px solid #ddd;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        min-height: 350px;
    }
    
    .category h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 1.5em;
        color: #555;
    }
    
    .doc_part, .doc_name {
        display: block;
        border: none;
        width: 100%;
        height: 45px;
        margin: 10px 0;
        background: #eee;
        color: #333;
        font-size: 1em;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    
    .doc_part:hover, .doc_name:hover {
        background-color: #ddd;
    }

    .doc_part.active, .doc_name.active {
        background-color: #007bff;
        color: white;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    
    th, td {
        width: 14.28%;
        padding: 10px;
        border: 1px solid #ddd;
        text-align: center;
    }

    .disabled {
        color: #aaa;
        pointer-events: none;
    }

    #cal-btn {
        text-align: center;
        margin: 15px 0;
    }

    #cal-btn button {
        border: none;
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        font-size: 1em;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    #cal-btn button:hover {
        background-color: #0056b3;
    }

    .time-btn {
        border: none;
        background-color: #007bff;
        color: white;
        margin: 10px;
        width: 50px;
        height: 30px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .time-btn.disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }

    .time-btn:hover:not(.disabled) {
        background-color: #0056b3;
    }

    #calendar {
        margin-top: 20px;
    }

    #calendarTitle {
        text-align: center;
        font-size: 1.2em;
        margin-bottom: 10px;
    }

    input[type="button"] {
        font-size: 1em;
    }

</style>

<script>
	var isChkPart=0;
	var isChkDoc=0;
	var isChkDate=0;
	var selectedWorkingDays = [];
	var currentYear, currentMonth;
	
	// 분야를 선택하면 의사리스트 업데이트
	function chkpart(part, my) {
		var DP=document.getElementsByClassName("doc_part");
		var doc_part=document.getElementById("doc_part");
		
		
	    var chk = new XMLHttpRequest();
	    chk.onload = function() {
	        var doctors=JSON.parse(chk.responseText);
	        document.getElementById("doc_list").innerHTML = '';  // 이전 리스트 초기화

	        for (doctor of doctors) {
	            var addInput=document.createElement("input");
	            addInput.type="button";
	            addInput.value=doctor.doc_name;
				addInput.className="doc_name";
	            // 여기서 onclick 이벤트를 자바스크립트로 직접 할당
	            addInput.setAttribute("onclick", "chkDoc("+doctor.doc_id+", this)");

	            var addDiv=document.createElement("div");
	            addDiv.appendChild(addInput);
	            
	   /*         var addSpan=document.createElement("span");
	            addSpan.innerText=doctor.doc_part;
	            addDiv.appendChild(addSpan);*/
	            
	            document.getElementById("doc_list").appendChild(addDiv);
	            
	        }
	        for(i=0;i<DP.length;i++) {
				if(my==DP[i]) {
	        		my.style.background="red";
				} else {
					DP[i].style.background="#ccc";
				}
	        }
	    };
	    chk.open("get", "chkpart?doc_part=" + part);
	    chk.send();
	    isChkPart=1;
	    isChkDoc=0;
	}
	
	// 의사를 선택하면 달력 업데이트
	function chkDoc(docid, my) {
		var DN=document.getElementsByClassName("doc_name");
		var DP=document.getElementsByClassName("doc_part");
		var doc_part=document.getElementById("doc_part");
		
		document.getElementById("doc_id").value=docid;
		
		var chk=new XMLHttpRequest();
		chk.onload=function() {
			var data=JSON.parse(chk.responseText);
			var part=data.getPart;
			doc_part.value=part;
			var workingdays=data.workingday;
			selectedWorkingDays = workingdays;
			for(i=0;i<DN.length;i++) {
				if(my===DN[i]) {
					DN[i].style.background="red";
					
				} else {
					DN[i].style.background="#ccc";
				}
			}
			for(i=0;i<DP.length;i++) {
				if(part==DP[i].value) {
					DP[i].style.background="red";
				} else {
					DP[i].style.background="#ccc";
				}
			}
			
			getCal(currentYear, currentMonth, selectedWorkingDays);
		}
		chk.open("get","chkDoc?doc_id="+docid);
		chk.send();
		isChkPart=1;
		isChkDoc=1;
	}
	
	// 달력 불러오기
	function getCal(year, month, workingdays=selectedWorkingDays) {
	    var xhr = new XMLHttpRequest();
	    xhr.onload = function() {
	        if (xhr.status === 200) {
	            var data = JSON.parse(xhr.responseText);  // JSON 데이터를 파싱
	            renderCalendar(data,workingdays);  // 받은 데이터를 가지고 달력 렌더링
	            updateNavigationButtons(); // 버튼 상태 업데이트
	        }
	    }
	    xhr.open("get", "getCal?year=" + year + "&month=" + month);
	    xhr.send();
	}

	function renderCalendar(data, workingdays) {
	    // 월과 연도를 표시하는 부분
	    var calendarHeaderHtml = '<h2>' + data.year + '년 ' + data.month + '월</h2>';

	    var calendarHtml = '<table><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr><tr>';
	    
	    // 첫 번째 주 앞에 빈 칸 삽입
	    for (var i = 0; i < data.firstDayOfWeek; i++) {
	        calendarHtml += '<td></td>';
	    }

	    // 날짜 삽입
	    for (var day = 1; day <= data.lastDay; day++) {
	        var currentDate = new Date(data.year, data.month - 1, day);
	        var dayOfWeek = currentDate.getDay();  // 0: 일요일, 1: 월요일, ..., 6: 토요일
	        
	        // 오늘 날짜 이전은 비활성화
	        if (data.year == data.todayYear && data.month == data.todayMonth && day < data.todayDay) {
	            calendarHtml += '<td><span class="disabled">' + day + '</span></td>';
	        } 
	        // 근무일이 아닌 경우 비활성화
	        else if (!workingdays.includes(dayOfWeek)) {
	            calendarHtml += '<td><span class="disabled">' + day + '</span></td>';
	        } 
	        // 근무일인 경우 활성화
	        else {
	            calendarHtml += '<td><a href="#" onclick="selectDate(' + data.year + ', ' + data.month + ', ' + day + ')">' + day + '</a></td>';
	        }

	        // 토요일마다 줄 바꿈
	        if ((data.firstDayOfWeek + day) % 7 == 0) {
	            calendarHtml += '</tr><tr>';
	        }
	    }

	    calendarHtml += '</tr></table>';

	    // 달력과 연월을 표시
	    document.getElementById("calendarTitle").innerHTML = calendarHeaderHtml;
	    document.getElementById("calendar").innerHTML = calendarHtml;  // 달력을 업데이트
	}


	
	function changeMonth(change) {
	    // 달을 변경하며, 1월과 12월을 처리
	    currentMonth += change;
	    if (currentMonth < 1) {
	        currentMonth = 12;
	        currentYear -= 1;
	    } else if (currentMonth > 12) {
	        currentMonth = 1;
	        currentYear += 1;
	    }
	    // 변경된 year와 month로 달력 다시 요청
	    getCal(currentYear, currentMonth, selectedWorkingDays);
	}

	// 이전 달력 disalbed 만들기
	function updateNavigationButtons() {
	    var today = new Date();
	    var previousMonthButton = document.getElementById("prevMonth");

	    // 이전달 버튼 비활성화 조건: 현재 날짜보다 이전인 달로 이동하면 비활성화
	    if (currentYear < today.getFullYear() || (currentYear == today.getFullYear() && currentMonth <= today.getMonth() + 1)) {
	        previousMonthButton.disabled = true;
	    } else {
	        previousMonthButton.disabled = false;
	    }
	}

	// 날짜 선택하면 예약 가능한 시간 업데이트
	function selectDate(year, month, day) {
    if (isChkPart == 1 && isChkDoc == 1) {
        var doc = document.getElementById("doc_id").value;
        var chk = new XMLHttpRequest();
        chk.onload = function () {
            var datas = JSON.parse(chk.responseText);
            var reserve = document.getElementById("reserveList");
            reserve.innerHTML = "";
            var reservelists = datas.reservelist;
            var reservedtimes = datas.reservedTime;

            var formatDate = year + "-" + (month < 10 ? '0' + month : month) + "-" + (day < 10 ? '0' + day : day);
            document.getElementById("res_date").value = formatDate;

            var today = new Date();
            var isToday = today.getFullYear() === year && (today.getMonth() + 1) === month && today.getDate() === day;

            for (i = 0; i < reservelists.length; i++) {
                var reservetime1 = reservelists[i];
                var reservetime = reservetime1.substring(0, 5);
                var timeParts = reservetime.split(":");
                var hour = parseInt(timeParts[0], 10);
                var minute = parseInt(timeParts[1], 10);

                var addInput = document.createElement("input");
                addInput.type = "button";
                addInput.value = reservetime;
                addInput.className = "time-btn";

                // 시간이 이미 예약된 경우 비활성화
                if (reservedtimes.includes(reservetime1)) {
                    addInput.disabled = true;
                    addInput.className += " disabled";
                }

                // 오늘 날짜이고, 현재 시간 이전의 시간도 비활성화
                if (isToday && (hour < today.getHours() || (hour === today.getHours() && minute < today.getMinutes()))) {
                    addInput.disabled = true;
                    addInput.className += " disabled";
                }

                addInput.setAttribute("onclick", "chkin('" + reservetime1 + "')");
                reserve.appendChild(addInput);
            }
        }
        chk.open("get", "chkDate?year=" + year + "&month=" + month + "&day=" + day + "&doc_id=" + doc);
        chk.send();
    } else {
        alert("담당선생님을 선택해주세요.");
    }
}

	
	function chkin(time) {
		var chk1=document.getElementById("doc_id").value;
		var chk2=document.getElementById("doc_part").value;
		var chk3=document.getElementById("res_date").value;
		var chk4=document.getElementById("res_time");
		chk4.value=time;
		if(!chk1 || !chk2 || !chk3 || !chk4.value) {
			alert("잘못된 경로");
		} else {
			var timePart=chk4.value.split(":");
			var hour=parseInt(timePart[0],10);
			var min=timePart[1];
			if (confirm(chk3+" "+hour+"시 "+min+"분 예약을 진행하시겠습니까?")) { // 확인 창 추가
				var form=document.getElementById("reserveForm");
			//	window.history.replaceState(null, null, "/main/index");

				form.submit();
			}
		}
	}
	
	// window.onload시에 현재날짜 전역변수에 저장, getCal함수에 보내서 달력 생성
	window.onload = function() {
		var docParam=${param.doc_id==null?"-1":param.doc_id};
	    var today = new Date();
	    currentYear = today.getFullYear(); // 전역 변수에 저장
	    currentMonth = today.getMonth() + 1; // 전역 변수에 저장
	    // 페이지 로드 시 현재 월의 달력 로드
	    getCal(currentYear, currentMonth);
	    
	    if (docParam !== "-1") {
	        var doctorButton = document.querySelector('input[data-docid="' + docParam + '"]');
	        if (doctorButton) {
	            chkDoc(docParam, doctorButton);  // 해당 버튼을 선택하여 의사 선택 함수 호출
	        }
	    }
	}
	
	window.onpageshow = function(event) {
		
		   if(event.persisted || (window.performance && window.performance.navigation.type == 2))
		    	history.go(1);
		};
</script>
</head>
<body>
<section>
    <!-- 분야 선택 -->
    <div class="category">
        <h2>진료분야</h2>
        	<div><input type="button" class="doc_part" value="전체" onclick="chkpart('',this)"></div>
        <c:forEach var="part" items="${part }">
        	<div><input type="button" class="doc_part" value="${part }" onclick="chkpart('${part}',this)"></div>
        </c:forEach>
    </div>

    <!-- 의료진 선택 -->
    <div class="category">
        <h2>의료진</h2>
        <div id="doc_list">
	        <c:forEach var="doc" items="${doctor }">
	        	<div>
	        		<input type="button" class="doc_name" value="${doc.doc_name }" data-docid="${doc.doc_id}" onclick="chkDoc(${doc.doc_id},this)">
	        	</div>
	        </c:forEach>
        </div>
    </div>

    <!-- 날짜 선택 -->
	<div class="category">
		<div>
			<span id="calendarTitle"></span> <!-- 현재 연도와 월을 표시 -->
			<div id="cal-btn">
				<button id="prevMonth" onclick="changeMonth(-1)">이전달</button>
				<button onclick="changeMonth(1)">다음달</button>
			</div>
		</div>
		<div id="calendar">
			<!-- 달력이 비동기적으로 여기에 렌더링됩니다 -->
		</div>
	</div>

    <!-- 시간 선택 -->
    <div class="category">
        <h2>시간</h2>
        <div id="reserveList">
        <!-- 스타일 class=time-btn -->
        </div>
    </div>
</section>
<form method="post" action="reserveOk" id="reserveForm">
<input type="hidden" name="user_id" value="${user_id }">
<input type="hidden" name="user_jumin" value="${user_jumin }">
<input type="hidden" name="user_phone" value="${user_phone }">
<input type="hidden" name="doc_id" id="doc_id">
<input type="hidden" name="doc_part" id="doc_part">
<input type="hidden" name="res_date" id="res_date">
<input type="hidden" name="res_time" id="res_time">
</form>
</body>
</html>
