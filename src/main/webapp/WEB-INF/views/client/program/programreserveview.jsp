<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
$(function() {
    var maxSpinnerValue = 5; // 스피너의 최대값은 5명
    var maxAvailableInwon = ${pccdto.pro_inwon - pccdto.minus_inwon}; // 잔여 인원 계산
    // 스피너 설정 및 spin 이벤트 처리
    $("#p_inwon").spinner({
        min: 1,
        max: 5,
        spin: function(event, ui) {
            if (ui.value > maxAvailableInwon) {
                $("#inwoninnertext").text("잔여 인원은 " + maxAvailableInwon + "명입니다. 더 이상 신청할 수 없습니다.");
                $(this).spinner("value", maxAvailableInwon); // 스피너를 최대 값으로 설정
                return false; // 스피너 값 증가 중단
            } else {
                $("#inwoninnertext").text(""); // 잔여 인원이 초과하지 않으면 경고 메시지 삭제
            }
        }
    });
});








</script>
<style>
section {
       margin:auto;
       width: 1300px;
   }


 #space {
     height:100px;
 }
 
    
 #reserve {
    margin: auto;
    width: 60%; /* 중앙에 위치하도록 넓이 설정 */
    border-collapse: collapse; /* 테두리가 하나로 합쳐지도록 설정 */
    text-align: left; /* 텍스트가 왼쪽 정렬되도록 설정 */
}
	
	/* 테이블 스타일 */
table {
    width: 100%; /* 테이블을 섹션에 맞게 꽉 채움 */
    border-collapse: collapse; /* 테두리 겹침 제거 */
    margin-bottom: 30px; /* 테이블 간 간격 추가 */
    background-color: #f9f9f9; /* 테이블 배경색 */
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

/* 테이블 셀 스타일 */
table th, table td {
    border: 1px solid #ddd; /* 셀 테두리 */
    padding: 12px 15px; /* 셀 내부 여백 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
    font-size: 16px; /* 글자 크기 */
    color: #333; /* 텍스트 색상 */
}

/* 헤더 셀 스타일 */
table th {
    background-color: #0073e6; /* 헤더 배경색 */
    color: white; /* 헤더 글자색 */
    text-transform: uppercase; /* 대문자 변환 */
    font-weight: bold; /* 굵은 글씨 */
    letter-spacing: 0.05em; /* 글자 간격 조정 */
}

/* 짝수 행 배경색 */
table tr:nth-child(even) {
    background-color: #f2f2f2; /* 짝수 행 배경색 */
}

/* 제출 버튼 스타일 */
input[type="submit"] {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #0056b3; /* 호버 시 색상 변경 */
}

/* 인원수 경고 텍스트 스타일 */
#inwoninnertext {
    color: red;
    font-size: 14px;
    margin-top: 5px;
}
    
    
</style>
<script>
window.onpageshow = function(event) {
	
	   if(event.persisted || (window.performance && window.performance.navigation.type == 2))
	    	history.go(1);
	};
</script>


</head>
<body>
<section>
    <form action="preserveOk" method="post" name="pkc" onsubmit="return check()">
        <table id="reserve">
            <caption><h2>${pdto.pro_name}&nbsp;예약</h2></caption>
            <input type="hidden" name="pro_id" value="${pdto.pro_id}">
            <input type="hidden" name="user_id" value="${user_id}">
            <input type="hidden" name="reserve_date" value="${reserve_date}">
            <input type="hidden" name="state" value="0">
            
            <tr>
                <td width="200">파트</td>
                <td width="400"><input type="text" name="pres_part" value="${pdto.pro_part}" readonly></td>
            </tr>
            <tr>
                <td>예약일</td>
                <td><input type="date" name="pres_date" value="${reserve_date}" readonly></td>
            </tr>
            <tr>
                <td>예약 시간</td>
                <td><input type="time" name="pres_time" value="${pdto.pro_time}" readonly></td>
            </tr>
            <tr>
                <td>인원</td>
                <td><input type="text" id="p_inwon" name="p_inwon" value="1" readonly>
                	<br><span id="inwoninnertext"></span>
                </td>
            </tr>
            <td></td>
            <td><input type="submit" value="예약 신청하기"></td>
        </table>
    </form>
    <div id="space">
    </div>
    <table>
        <caption><h2>프로그램 소개</h2></caption>
        <tr>
            <td width="500">프로그램 명</td>
            <td width="800">${pdto.pro_name}</td>
        </tr>
        <tr>
            <td width="500">프로그램 이미지</td>
            <td width="800"><img src="../../static/admin/programfile/${pdto.pro_img}" width="200"></td>
        </tr>
        <tr>
            <td>프로그램 설명</td>
            <td>${pdto.pro_info}</td>
        </tr>
        <tr>
            <td>강사</td>
            <td>${pdto.teach_name}</td>
        </tr>
        <tr>
            <td>선택일자 프로그램 현재 신청 인원 및 잔여 인원</td>
            <td><span id="restinwon">${pccdto.minus_inwon}</span>/${pccdto.pro_inwon}</td>        
        </tr>
    </table>
</section>
</body>
</html>