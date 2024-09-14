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
$(function(){
    // 스피너 설정 및 spin 이벤트 비동기 처리
    $("#p_inwon").spinner({
        min: 1,
        max: 5,
        spin: function(event, ui) {
                inwoncheck(ui.value); 
        }
    });
});


// span 인원에서 spinner의 값을 더한 후, 수용 가능한 인원 초과 시 경고를 띄움
function inwoncheck(checkinwon) {
    var minus = parseInt($("#restinwon").text()); // 잔여 인원 값 가져오기
    var chong = minus + checkinwon;
    var pro_inwon = parseInt("${pdto.pro_inwon}"); // 총 수용 인원

    if (chong > pro_inwon) {
        alert("현재 수용 가능 인원을 초과하였습니다.");
    }
    document.getElementById("p_inwon").value=checkinwon-1;
}
</script>
<style>
    #space {
        height:100px;
    }
</style>
</head>
<body>
<section>
    <form action="preserveOk" method="post" name="pkc" onsubmit="return check()">
        <table>
            <input type="hidden" name="pro_id" value="${pdto.pro_id}">
            <input type="hidden" name="user_id" value="${user_id}">
            <input type="hidden" name="state" value="0">
            <h2><caption>${pdto.pro_name}&nbsp;예약</caption></h2>
            <tr>
                <td>파트</td>
                <td><input type="text" name="pres_part" value="${pdto.pro_part}" readonly></td>
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
                <td><input type="text" id="p_inwon" name="p_inwon" value="1" onchange="inwoncheck(this.value)"></td>
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
            <td width="800"><img src="../../static/admin/programfile/${pdto.pro_img}" width="780"></td>
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
            <td>프로그램 현재 신청 인원 및 잔여 인원</td>
            <td><span id="restinwon">${pdto.minus_inwon}</span>/${pdto.pro_inwon}</td>        
        </tr>
    </table>
</section>
</body>
</html>