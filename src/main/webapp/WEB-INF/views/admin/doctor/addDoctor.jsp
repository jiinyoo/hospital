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
		
		if(file.value=="") {
			alert("사진을 첨부해주세요.");
			return false;
		}
		var his=document.getElementsByClassName("history");
		var history="";
		for(i=0;i<his.length-1;i++) {
			history+=his[i].value+"/";
		}
		document.getElementById("doc_history").value=history;
		return true;

	}

	function restchk(my) {
		var start=document.getElementsByClassName("Schk_rest");
		var end=document.getElementsByClassName("Echk_rest");
		var chk=document.getElementsByClassName("rest");
		
		for(i=0;i<chk.length;i++) {
			if(chk[i]===my) {
				if(my.checked) {
					start[i].disabled=true;
					end[i].disabled=true;
				} else {
					start[i].disabled=false;
					end[i].disabled=false;
				}
			}
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
	
	
</script>
<style>
	section {
		width: 800px;
	}

	table {
		width: 100%;
		border-collapse: collapse;
	}

	th, td {
		padding: 10px;
		text-align: left;
	}

	th {
		background-color: #f0f0f0;
		text-align: center;
		font-weight: bold;
	}

	td input[type="text"], td input[type="file"], td textarea {
		width: 100%;
		padding: 5px;
		box-sizing: border-box;
	}

	textarea {
		width: 100%;
		height: 100px;
	}



	select#medi_type {
		margin-left: 10px;
	}

	input[type="submit"] {
		background-color: #4CAF50;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	input[type="submit"]:hover {
		background-color: #45a049;
	}
	
	.workday {
		width:700px;;
		margin: auto;
		margin-top: 30px;
	}
	
	.workday td {
		text-align: center;
		height: 40px;
	}
	
	.workday select {
		width:100px;
		height: 30px;
		margin: 0 20px;
	}
	

  

  #workday div select {
    width: 80px;
  }
</style>
</head>
<body>
<section>
<form method="post" action="addDoctorOk" enctype="multipart/form-data" onsubmit="return subchk()">
<input type="hidden" name="doc_history" id="doc_history">
<input type="hidden" name="doc_userid" value="${user.user_id}">
<table>
	<tr>	
		<th>성함 </th>
		<td><input type="text" name="doc_name" value="${user.user_name}" readonly style="pointer-events: none;border:none;"></td>
		<th>분야</th>
		<td><input type="text" name="doc_part"></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td><input type="text" name="doc_phone"></td>
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
<input type="hidden" name="dayofweeks" value="0">
<input type="hidden" name="dayofweeks" value="1">
<input type="hidden" name="dayofweeks" value="2">
<input type="hidden" name="dayofweeks" value="3">
<input type="hidden" name="dayofweeks" value="4">
<input type="hidden" name="dayofweeks" value="5">
<input type="hidden" name="dayofweeks" value="6">
<table class="workday">
	<tr>
		<th>요일</th>
		<th width="50%">시간</th>
		<th width="20%">쉬는날</th>
	</tr>
	<c:forEach begin="0" end="6" var="index">
	<input type="hidden" name="dayofweeks" value="index">
	<tr>
		<td>
			<c:if test="${index==0 }"> 월 </c:if>
			<c:if test="${index==1 }"> 화 </c:if>
			<c:if test="${index==2 }"> 수 </c:if>
			<c:if test="${index==3 }"> 목 </c:if>
			<c:if test="${index==4 }"> 금 </c:if>
			<c:if test="${index==5 }"> 토 </c:if>
			<c:if test="${index==6 }"> 일 </c:if>
		</td>
		<td>
			<select name="start_times" class="Schk_rest" onchange="uptime(this)">
				<c:forEach begin="9" end="18" var="times">
					<option value="${times}">${times<10?'0':''}${times}:00</option>
				</c:forEach>
			</select> TO
			<select name="end_times" class="Echk_rest">
				<c:forEach begin="10" end="18" var="times">
					<option value="${times}">${times<10?'0':''}${times}:00</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<label>쉬는 날 <input type="checkbox" onchange="restchk(this)" class="rest"></label>
		</td>
	</tr>
	</c:forEach>
</table>

<input type="submit" value="등록">
</form>
</section>
</body>
</html>