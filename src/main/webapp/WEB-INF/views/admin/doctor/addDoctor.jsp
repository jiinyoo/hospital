<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function chk() {
		 
		var his=document.getElementsByClassName("history");
		if(his[his.length-1]==document.activeElement) {
			if(his.length<10 && his[his.length-1].value!=="") {
				var addDiv=document.createElement("div");
				var addInput=document.createElement("input");
				addInput.type="text";
				addInput.name="doc_his";
				addInput.placeholder="약력을 입력하세요";
				addInput.className="history";
				addInput.onkeyup=chk;
				addDiv.appendChild(addInput);
				document.getElementById("his").appendChild(addDiv);
			}  
		}
		
		for(i=0;i<his.length;i++) {
			if(his[i].value.trim().length!=0) {
				history+=his[i].value+"/";
			}
		}	
	}
	
	function subchk() {
		var file=document.getElementById("file");
		
		var phone1=document.getElementById("phone1").value;
		var phone2=document.getElementById("phone2").value;
		var phone3=document.getElementById("phone3").value;
		var phone="";		
		
		var his=document.getElementsByClassName("history");
		var history="";
		for(i=0;i<his.length-1;i++) {
			history+=his[i].value+"/";
		}
		document.getElementById("doc_history").value=history;
		
		if(!phone1 || !phone2 || !phone3) {
			alert("휴대폰 번호를 입력해주세요.");
			return false;
		} else if(file.value=="") {
			alert("사진을 첨부해주세요.");
			return false;
		} else {
			phone=phone1+"-"+phone2+"-"+phone3;
			document.getElementById("doc_phone").value=phone;
			return true;
		}
	}

	function restchk(my,n) {
		n=parseInt(n);
		var dayofweek=document.getElementsByClassName("dayofweeks");
		var start=document.getElementsByClassName("Schk_rest");
		var end=document.getElementsByClassName("Echk_rest");
		
		if(my.checked) {
			dayofweek[n].disabled=true;
			start[n].disabled=true;
			end[n].disabled=true;
		} else {
			dayofweek[n].disabled=false;
			start[n].disabled=false;
			end[n].disabled=false;
		}
	}
	
	function uptime(my) {
        var parentRow = my.closest("tr"); // 현재 행을 찾음
        var startTime = parseInt(my.value); // 선택된 시작 시간을 가져옴
        var endSelect = parentRow.querySelector(".Echk_rest"); // 해당 행의 종료시간 셀렉트박스 찾기

        // 종료시간 셀렉트박스의 옵션들을 초기화하고 시작시간보다 큰 옵션만 활성화
        endSelect.innerHTML = ""; // 기존 옵션 초기화
        for (var i = startTime + 1; i <= 18; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = (i < 10 ? "0" : "") + i + ":00";
            endSelect.appendChild(option);
        }
    }
	
	function onlyNum(next, length, text) {
		
		text.value=text.value.replace(/[^0-9]/g,"");
		
		if(text.value.length==length) {
			document.getElementById(next).focus();
		}
	}
	
	window.onload=function() {
		var start=document.getElementsByClassName("Schk_rest");
		var end=document.getElementsByClassName("Echk_rest");
		var dayofweek=document.getElementsByClassName("dayofweeks");
		var rest=document.getElementsByClassName("rest");
		
		start[0].disabled=true;
		end[0].disabled=true;
		rest[0].checked=true;
		dayofweek[0].disabled=true;
	}
</script>
<style>
	body {user-select: none;}
	section {
		width:600px;
		margin:auto;
	}
	
	table {
		width:100%;
		border-collapse: collapse;
	}
	
	.main-table {
		margin:20px;
		border: 1px solid black;
	}
	
	.main-table td {padding-right:10px;}
	td,th {
		padding-left: 10px;
		text-align: left;
	}
	
	.main-table th {
		background: #f5f5f5;
		color: #333;
		font-weight: bold;
		height:40px;
	}
	
	
	input[type="text"] {
		width:100%;
		height: 25px;
		border:none;
		border-bottom: 1px solid black;
		outline: none;
	}
	
	.history {margin:5px 0;}
	
	.img {
		position: relative;
	}
	.img img {
  		width: 100%;
	    height: 100%;
	    display: block;
	    transition: opacity 0.3s ease; /* 불투명도 전환에 애니메이션 적용 */
	}
	
	.img .img-change {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: rgba(0, 0, 0, 0); /* 기본 상태는 투명 */
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    color: white;
	    font-size: 14px;
	    font-weight: bold;
	    opacity: 0; /* 기본적으로 텍스트는 보이지 않음 */
	    transition: background 0.3s ease, opacity 0.3s ease; /* 배경과 텍스트가 부드럽게 나타남 */
	    text-align: center;
	}
	
	.img:hover img {
	    opacity: 0.5; /* 마우스를 올리면 이미지가 불투명해짐 */
	}
	
	.img:hover .img-change {
	    background: rgba(0, 0, 0, 0.5); /* 어두운 배경 */
	    opacity: 1; /* 텍스트를 보이게 설정 */
	}
	
	#phone-container input {
		width: 25%;
	}
	
	.workday {
		margin: auto;
		margin: 20px;
		border:1px solid black;
	}
	
	.workday td, .workday th {
		text-align: center;
		height: 40px;
	}
	
	.workday th {
		background: #f5f5f5;
		color: #333;
		font-weight: bold;
	}
	
	.workday td {
		border-bottom: 1px solid black;
	}
	.workday select {
		width:100px;
		height: 30px;
		margin: 0 20px;
	}

	#workday div select {
		width: 80px;
	}
	
	#btn-con {text-align: center;}
	.btn {
		border:none;
		width:100px;
		height: 30px;
		text-align: center;
		background: #7D78FF;
		color:white;
	}
	
	.btn:hover { background: #5C1DB5;}
	
	#doc_part {
		width:100px;
		height: 30px;
		border: 1px solid transparent;
		outline: none;
	}
	
	#doc_part:hover {
		border:1px solid #ccc;
	}
</style>
</head>
<body>
<section>
<form method="post" action="addDoctorOk" enctype="multipart/form-data" onsubmit="return subchk()">
<input type="hidden" name="doc_history" id="doc_history">
<input type="hidden" name="doc_userid" value="${user.user_id}">
<table class="main-table">
	<tr>	
		<th>성함 </th>
		<td><input type="text" name="doc_name" value="${user.user_name}" readonly style="pointer-events: none;border:none;"></td>
		<th>분야</th>
		<td>
			<select name="doc_part" id="doc_part">
				<option>정신과</option>
				<option>내분비과</option>
				<option>치과</option>
				<option>이비인후과</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td width="200">
			<div id="phone-container">
				<input type="hidden" name="doc_phone" id="doc_phone">
				<input type="text" name="phone1" id="phone1" oninput="onlyNum('phone2',3,this)" maxlength="3" placeholder="앞자리">-
				<input type="text" name="phone2" id="phone2" oninput="onlyNum('phone3',4,this)" maxlength="4" placeholder="중간">-
				<input type="text" name="phone3" id="phone3" oninput="onlyNum(null,null,this)" maxlength="4" placeholder="뒷자리">
			</div>
		</td>
		<th>이메일 </th>
		<td><input type="text" name="user_email" value="${user.user_email }"  readonly style="pointer-events: none;border:none;"></td>
	</tr>
	<tr>
		<th>약력</th>
		<td id="his" colspan="3">
			<div><input type="text" class="history" name="doc_his" onkeyup="chk()" placeholder="약력을 입력하세요"></div>
		</td>
	</tr>
	<tr>
		<th> 프로필 사진 추가 </th>
		<td colspan="3"> <input type="file" id="file" name="file"> </td>
	</tr>
</table>
<table class="workday">
	<tr>
		<th>요일</th>
		<th width="50%">시간</th>
		<th width="20%">쉬는날</th>
	</tr>
	<c:forEach begin="0" end="6" var="index">
	<input type="hidden" class="dayofweeks" name="dayofweeks" value="${index }">
	<tr>
		<td width="10%" ${index==6 || index==0 ? "style='color:red;'":"" }>
			<c:if test="${index==1 }"> 월 </c:if>
			<c:if test="${index==2 }"> 화 </c:if>
			<c:if test="${index==3 }"> 수 </c:if>
			<c:if test="${index==4 }"> 목 </c:if>
			<c:if test="${index==5 }"> 금 </c:if>
			<c:if test="${index==6 }"> 토 </c:if>
			<c:if test="${index==0 }"> 일 </c:if>
		</td>
		<td>
			<select name="start_times" class="Schk_rest" onchange="uptime(this)">
				<c:forEach begin="9" end="18" var="times">
					<option value="${times}">${times<10?'0':''}${times}:00</option>
				</c:forEach>
			</select>~
			<select name="end_times" class="Echk_rest">
				<c:forEach begin="10" end="18" var="times">
					<option value="${times}">${times<10?'0':''}${times}:00</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<label>쉬는 날 <input type="checkbox" onchange="restchk(this,'${index}')" class="rest"></label>
		</td>
	</tr>
	</c:forEach>
</table>
<div id="btn-con">
	<input type="submit" value="등록" class="btn">
</div>
</form>
</section>
</body>
</html>