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
        max: maxSpinnerValue,
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

    // 스피너 값 변경 감지 (값을 수동으로 입력할 경우)
    $("#p_inwon").on("change", function() {
        var currentValue = $(this).spinner("value");
        if (currentValue > maxAvailableInwon) {
            $("#inwoninnertext").text("잔여 인원은 " + maxAvailableInwon + "명입니다. 더 이상 신청할 수 없습니다.");
            $(this).spinner("value", maxAvailableInwon); // 스피너를 최대 값으로 설정
        } else {
            $("#inwoninnertext").text(""); // 잔여 인원이 초과하지 않으면 경고 메시지 삭제
        }
    });
});
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
            <input type="hidden" name="reserve_date" value="${reserve_date}">
            <input type="hidden" name="state" value="0">
            <h2><caption>${pdto.pro_name}&nbsp;예약</caption></h2>
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
                <td><input type="text" id="p_inwon" name="p_inwon" value="1" onchange="inwoncheck(this.value)">
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
            <td>선택일자 프로그램 현재 신청 인원 및 잔여 인원</td>
            <td><span id="restinwon">${pccdto.minus_inwon}</span>/${pccdto.pro_inwon}</td>        
        </tr>
    </table>
</section>
</body>
</html>