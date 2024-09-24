<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$("#pro_inwon").spinner({
		min:10,
		max:50
		
	});
});



function check() {
	
	var chk=0;
	var len=document.getElementsByClassName("yoil").length
	for(var i=0; i<len; i++) {
		if(document.getElementsByClassName("yoil")[i].checked) {
			chk=1;
		}
	}
	var input=document.getElementById("file");
	if(input.files.length==0) {
		alert("사진 파일을 추가하세요.");
		return false;
	} else if(chk==0){
		alert("요일을 하나 이상 체크하세요")
		return false;
	} else {
		return true;
	}
	
}



//오늘 이전의 일자는 두 달력에서 모두 활성화 되면 안됨
//end_date가 start_date보다 뒤의 날짜여야 함

function validCalendar() {
	var today=new Date();
	var currentYear=today.getFullYear();
	var currentMonth=("0"+(today.getMonth()+1)).slice(-2);
	var currentDate=("0"+today.getDate()).slice(-2);
	var formatdate=currentYear+"-"+currentMonth+"-"+currentDate;
	document.getElementById("start_date").setAttribute("min", formatdate);
	document.getElementById("end_date").setAttribute("min", formatdate);
	
	if(document.getElementById("start_date").value!="") {
		var startdate=new Date(document.getElementById("start_date").value);
		startdate.setDate(startdate.getDate()+1) //반환값이랑 실체 객체에 반영되는 것은 상이할 수 있다.
		var endstartYear=startdate.getFullYear();
		var endstartMonth=("0"+(startdate.getMonth()+1)).slice(-2);
		var endstartDate=("0"+startdate.getDate()).slice(-2);
		var formatdate=endstartYear+"-"+endstartMonth+"-"+endstartDate
		document.getElementById("end_date").setAttribute("min", formatdate);
	}
} 






</script>
<style>
	section {
		margin:auto;
	}
	
	#pro_info {
		width:300px;
		height:200px;
	
	}

</style>
</head>
<body>
<section>
<form method="post" action="programwriteOk" enctype="multipart/form-data" onsubmit="return check()" name="pkc">
<table align="center" width="500px" height="500px";>
	<caption><h2>프로그램 입력</h2></caption>
	<tr>
		<td width="200px">프로그램 명  </td>
		<td><input type="text" name="pro_name"></td>
	</tr>
	<tr>
		<td>프로그램 소개</td>
		<td><textarea name="pro_info" id="pro_info"></textarea></td>
	</tr>
	<tr>
		<td>강사명</td>
		<td><input type="text" name="teach_name"></td>
	</tr>
	<tr>
		<td>시간</td>
		<td><input type="time" name="pro_time" required></td>
	</tr>
	<tr>
		<td>총 인원 </td>
		<td><input type="text" id="pro_inwon" name="pro_inwon" value="10" readonly></td>
	</tr>
	<tr>
		<td>관련과 </td>
		<td><select name="pro_part">
			<option value="정신과">정신과</option>
			<option value="내분비과">내분비과</option>
			<option value="치과">치과</option>
			<option value="이비인후과">이비인후과</option>
        </select></td>
	</tr>
	<tr>
		<td>시작일</td>
    	<td><input type="date" id="start_date" name="start_date" required onclick=validCalendar()></td>
    </tr>
    <tr>
    	<td>종료일</td>
    	<td><input type="date" id="end_date" name="end_date" required onclick=validCalendar()></td>
    </tr>
    <tr>
    	<td>프로그램 요일 선택:</td>
    	<td>   
    	<input type="checkbox" name="day_of_week" value="0" class="yoil"> 일요일<br>
        <input type="checkbox" name="day_of_week" value="1" class="yoil"> 월요일<br>
        <input type="checkbox" name="day_of_week" value="2" class="yoil"> 화요일<br>
        <input type="checkbox" name="day_of_week" value="3" class="yoil"> 수요일<br>
        <input type="checkbox" name="day_of_week" value="4" class="yoil"> 목요일<br>
        <input type="checkbox" name="day_of_week" value="5" class="yoil"> 금요일<br>
        <input type="checkbox" name="day_of_week" value="6" class="yoil"> 토요일<br>
        </td>
    </tr>
	<tr>
		<td>대표 이미지</td>
		<td><input type="file" name="file" id="file"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="등록하기"></td>
	</tr>

</table>

</form>

</section>


</body>
</html>