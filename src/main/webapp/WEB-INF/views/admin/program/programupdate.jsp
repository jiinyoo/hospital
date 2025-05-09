<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<title>Insert title here</title>
<style>
	section {
		margin:auto;
		width: 700px;
	}
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
	
	#update{
	width:100px;
	background-color:#004fa8;
	height:30px;
	border: 1px solid #004fa8;
	border-radius:3px;
	color:white;

}
</style>
<script>
$(function(){
    $("#pro_inwon").spinner({
        min: 10,
        max: 50
    });
    $('#file').on('change', function() {
        var fileName = "";
        $('#file_name').text(fileName);
    }); 
	 $("#pro_inwon").css({
	        'width': '70px',
	        'height': '20px'
	   });
});


window.onload = function() {
    <c:forEach items="${pdlist}" var="pddto">
        document.getElementsByClassName("yoil")[${pddto.day_of_week}].checked = true;
    </c:forEach>
    document.getElementById("pro_part").value = "${pdto.pro_part}";
    var proImg = "${pdto.pro_img}";
    if (proImg) {
        document.getElementById("file_name").textContent = proImg.split('/').pop(); // Display image file name
    }
}



function check() {
	
	var chk=0;
	var len=document.getElementsByClassName("yoil").length
	for(var i=0; i<len; i++) {
		if(document.getElementsByClassName("yoil")[i].checked) {
			chk=1;
		}
	}
	if(chk==0){
		alert("요일을 하나 이상 체크하세요")
		return false;
	} else {
		return true;
	}
}
</script>
</head>
<body>
<section>
<div class="table-wrapper">
<table align="center"  width="500px"  height="500px">
<form method="post" action="programupdateOk" enctype="multipart/form-data" onsubmit="return check()" name="pkc">
<input type="hidden" value="${pdto.pro_img}" name="originimg">
<input type="hidden" value="${pdto.pro_id}" name="pro_id">
	<tr align="center"  >
		<td colspan="2" ><h2>프로그램 수정</h2></td>
	</tr>
    <tr>
        <td width="200px"  style="background-color:#D5D5D5;">프로그램 명</td>
        <td><input type="text" name="pro_name" value="${pdto.pro_name}" style="width:350px"></td>
    </tr>
    <tr>
        <td  style="background-color:#D5D5D5;">프로그램 소개</td>
        <td><textarea name="pro_info" style="width:350px; height:180px">${pdto.pro_info}</textarea></td>
    </tr>
    <tr>
        <td  style="background-color:#D5D5D5;">강사명</td>
        <td><input type="text" name="teach_name" value="${pdto.teach_name}" style="width:110px"></td>
    </tr>
    <tr>
        <td  style="background-color:#D5D5D5;">시간</td>
        <td><input type="time" name="pro_time" value="${pdto.pro_time}"></td>
    </tr>
    <tr>
        <td  style="background-color:#D5D5D5;">총 인원</td>
        <td><input type="text" id="pro_inwon" name="pro_inwon" value="${pdto.pro_inwon}" readonly></td>
    </tr>
    <tr>
        <td  style="background-color:#D5D5D5;">관련과</td>
        <td><select name="pro_part" id="pro_part"  style="width:110px">
            <option value="정신과">정신과</option>
            <option value="내분비과">내분비과</option>
            <option value="치과">치과</option>
            <option value="이비인후과">이비인후과</option>
        </select></td>
    </tr>
    <tr>
        <td  style="background-color:#D5D5D5;">시작일:</td>
        <td><input type="date" id="start_date" name="start_date" value="${pdto.start_date}" required></td>
    </tr>
    <tr>
        <td  style="background-color:#D5D5D5;">종료일</td>
        <td><input type="date" id="end_date" name="end_date" value="${pdto.end_date}" required></td>
    </tr>
    <tr>
        <td  style="background-color:#D5D5D5;">프로그램 요일 선택:</td>
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
        <td  style="background-color:#D5D5D5;">대표 이미지
        </td>
        <td>
            <input type="file" name="file" id="file"> <br>
            <span id="file_name"></span>
        </td>
    </tr>
    <tr align="center">
        <td colspan="2"><input type="submit" value="수정하기" id="update"></td>
    </tr>
</form>
</table>
</div>
</section>

</body>
</html>