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
    
    
    $("#p_inwon").css({
        'width': '70px',
        'height': '20px'
    });
});




</script>
<style>
section {
       margin:auto;
       width: 1300px;
   }

#reserve {
    margin: 100px auto 0 auto; /* 위에서 100px 간격, 좌우 중앙 정렬 */
    width: 600px; /* 테이블 너비 설정 */
    background-color: white; /* 흰색 배경 */
    border: 1px solid #dddddd; /* 얇은 테두리 추가 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    border-radius: 10px; /* 모서리를 둥글게 */
    padding: 20px; /* 안쪽 여백 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

#reserve caption {
    font-size: 1.5em; /* 제목 크기 키우기 */
    font-weight: bold;
    margin-bottom: 10px;
    text-align: center; /* 캡션 중앙 정렬 */
}

#reserve td {
	font-size:20px;
    padding: 10px; /* 셀 내부 여백 */
}

#reserve input[type="submit"] {
    background-color: #007BC9; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색 */
    padding: 10px 20px; /* 버튼 내부 여백 */
    border: none;
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer;
    font-weight:bold;
	font-family: 'goorm-sans-bold';
}

#reserve input[type="submit"]:hover {
    background-color: #005999; /* 마우스 오버 시 색상 변경 */
}


#pres_part {
	border:none;
	font-size:20px;
	font-weight:bold;
	font-family: 'goorm-sans-bold';
	background-color:#F6F6F6
}

#reserve input[type="date"] {
	font-size:20px;
	font-weight:bold;
	border:none;
	font-family: 'goorm-sans-bold';
}

#reserve input[type="time"] {
	font-size:20px;
	font-weight:bold;
	border:none;
	font-family: 'goorm-sans-bold';
}
#sogae {
    margin: 100px auto 100px auto; /* 위에서 100px 간격, 좌우 중앙 정렬 */
    width: 1000px; /* 테이블 너비 설정 */
    background-color: white; /* 테이블 전체 배경을 흰색으로 설정 */
    border: 1px solid #dddddd; /* 테두리 추가 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    border-radius: 10px; /* 모서리를 둥글게 */
    padding: 20px; /* 테이블 내부 여백 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

#sogae td {
    padding: 15px; /* 셀 내부 여백 */
    font-size: 18px; /* 글자 크기 설정 */
    background-color: white; /* 셀의 배경색을 흰색으로 통일 */
}

#sogae img {
    display: block;
}

#sogae h2 {
    font-size: 1.5em; /* 제목 크기 */
    font-weight: bold;
    text-align: center; /* 제목 중앙 정렬 */
    margin-bottom: 20px;
}

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
			<tr align="center">  
				<td colspan="2">      
         	 	<h2>${pdto.pro_name}&nbsp;예약</h2>
         	 	</td>
         	 </tr>
            <input type="hidden" name="pro_id" value="${pdto.pro_id}">
            <input type="hidden" name="user_id" value="${user_id}">
            <input type="hidden" name="reserve_date" value="${reserve_date}">
            <input type="hidden" name="state" value="0">
            
            <tr>
                <td width="200" style="background-color:grey; ">파트</td>
                <td width="400" style="background-color:#F6F6F6;"><input type="text" name="pres_part" value="${pdto.pro_part}" readonly  id="pres_part"></td>
            </tr>
            <tr>
                <td style="background-color:grey;">예약일</td>
                <td style="background-color:#F6F6F6;"><input type="date" name="pres_date" value="${reserve_date}" readonly style="background-color:#F6F6F6;"></td>
            </tr>
            <tr>
                <td style="background-color:grey;">예약 시간</td>
                <td style="background-color:#F6F6F6;"><input type="time" name="pres_time" value="${pdto.pro_time}" readonly style="background-color:#F6F6F6;"></td>
            </tr>
            <tr>
                <td style="background-color:grey;">인원</td>
                <td style="background-color:#F6F6F6;"><input type="text" id="p_inwon" name="p_inwon" value="1" readonly>
                	<br><span id="inwoninnertext"></span>
                </td>
            </tr>
       		<tr>
            <td colspan="2" align="center"><input type="submit" value="예약 신청하기"></td>
            </tr>
        </table>
    </form>
    <div id="space">
    </div>
    <table id="sogae">
    	<tr align="center">
        	<td colspan="2"><h2>프로그램 소개</h2></td>
        </tr>
        <tr>
            <td width="500"   style="background-color:grey; ">프로그램 명</td>
            <td width="800" style="background-color:#F6F6F6;">${pdto.pro_name}</td>
        </tr>
        <tr>
            <td width="500" style="background-color:grey; ">프로그램 이미지</td>
            <td width="800" style="background-color:#F6F6F6;"><img src="../../static/admin/programfile/${pdto.pro_img}" width="200"></td>
        </tr>
        <tr>
            <td style="background-color:grey; ">프로그램 설명</td>
            <td style="background-color:#F6F6F6;">${pdto.pro_info}</td>
        </tr>
        <tr>
            <td style="background-color:grey; ">강사</td>
            <td style="background-color:#F6F6F6;">${pdto.teach_name}</td>
        </tr>
        <tr>
            <td style="background-color:grey; ">선택일자 프로그램 현재 신청 인원 및 잔여 인원</td>
            <td style="background-color:#F6F6F6;"><span id="restinwon">${pccdto.minus_inwon}</span>/${pccdto.pro_inwon}</td>        
        </tr>
    </table>
</section>
</body>
</html>