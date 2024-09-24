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
	
	 $("#pro_inwon").css({
	        'width': '70px',
	        'height': '20px'
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
		width: 700px;
	}

	/* 테이블을 감싼 div에 스타일 적용 */
	.table-wrapper {
		margin-top:50px;
		margin-bottom:50px;
		padding: 20px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
		border-radius: 10px;
		background-color: white;
	}

	table {
		width: 670px;
		border-collapse: collapse;
		margin: 20px 0;
		background-color: white;
	}

	table td {
		border:1px solid white;
		padding: 10px;
	}

	#file {
		background-color: white;
		padding: 10px;
		border: 1px solid #ddd;
	}

	.yoil {
		margin-right: 10px;
	}

	#pro_info {
		width: 350px;
		height: 100px;
	}
	
#register {
	width:100px;
	background-color:#004fa8;
	height:30px;
	border: 1px solid #004fa8;
	border-radius:3px;
	color:white;

}
	
</style>
</head>
<body>
<section>
<form method="post" action="programwriteOk" enctype="multipart/form-data" onsubmit="return check()" name="pkc">
<div class="table-wrapper">
<table align="center" width="500px" height="500px";>
	<tr  align="center">
	<td colspan="3">
	<h2 >프로그램 입력</h2>
	</tr>
	<tr>
		<td width="300px"  style="background-color:#D5D5D5;">프로그램 명  </td>
		<td><input type="text" name="pro_name" style="width:350px;"></td>
	</tr>
	<tr>
		<td style="background-color:#D5D5D5;">프로그램 소개</td>
		<td><textarea name="pro_info" id="pro_info"></textarea></td>
	</tr>
	<tr>
		<td style="background-color:#D5D5D5;">강사명</td>
		<td><input type="text" name="teach_name" style="width:110px;"></td>
	</tr>
	<tr>
		<td style="background-color:#D5D5D5;">시간</td>
		<td><input type="time" name="pro_time" required></td>
	</tr>
	<tr>
		<td style="background-color:#D5D5D5;">총 인원 </td>
		<td><input type="text" id="pro_inwon" name="pro_inwon" value="10" readonly></td>
	</tr>
	<tr>
		<td style="background-color:#D5D5D5;">관련과 </td>
		<td><select name="pro_part"  style='width:110px;'>
			<option value="정신과">정신과</option>
			<option value="내분비과">내분비과</option>
			<option value="치과">치과</option>
			<option value="이비인후과">이비인후과</option>
        </select></td>
	</tr>
	<tr>
		<td style="background-color:#D5D5D5;">시작일</td>
    	<td><input type="date" id="start_date" name="start_date" required onclick=validCalendar()></td>
    </tr>
    <tr>
    	<td style="background-color:#D5D5D5;">종료일</td>
    	<td><input type="date" id="end_date" name="end_date" required onclick=validCalendar()></td>
    </tr>
    <tr>
    	<td style="background-color:#D5D5D5;">프로그램 요일 선택:</td>
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
		<td style="background-color:#D5D5D5;">대표 이미지</td>
		<td><input type="file" name="file" id="file"></td>
	</tr>
	<tr align="center">
		<td colspan="2"><input type="submit" value="등록하기"  id="register"></td>
	</tr>

</table>
</div>
</form>

</section>


</body>
</html>