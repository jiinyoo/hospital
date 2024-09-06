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
	  #workday {
    display: flex;
    flex-wrap: wrap; /* 여러 줄로 나뉠 경우 줄바꿈 허용 */
    gap: 20px; /* 각 요소 간의 간격 */
  }

  #workday > div {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-right: 20px;
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
<div id="workday">
	<div class="day-container">
	<input type="hidden" name="dayofweeks" value="mon">
	<div>월</div>
	<div>시작시간
		<select name="start_times" class="Schk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>종료시간
		<select name="end_times" class="Echk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>
      쉬는 날 <input type="checkbox" onchange="restchk(this)" class="rest">
    </div>
	</div>
	
	<div class="day-container">
	<input type="hidden" name="dayofweeks" value="tue">
	<div>화</div>
	<div>시작시간
		<select name="start_times" class="Schk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>종료시간
		<select name="end_times" class="Echk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>
      쉬는 날 <input type="checkbox" onchange="restchk(this)" class="rest">
    </div>
	</div>
	
	<div class="day-container">
	<input type="hidden" name="dayofweeks" value="wed">
	<div>수</div>
	<div>시작시간
		<select name="start_times" class="Schk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>종료시간
		<select name="end_times" class="Echk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>
      쉬는 날 <input type="checkbox" onchange="restchk(this)" class="rest">
    </div>
	</div>
	
	<div class="day-container">
	<input type="hidden" name="dayofweeks" value="thu">
	<div>목</div>
	<div>시작시간
		<select name="start_times" class="Schk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>종료시간
		<select name="end_times" class="Echk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>
      쉬는 날 <input type="checkbox" onchange="restchk(this)" class="rest">
    </div>
	</div>
	
	<div class="day-container">
	<input type="hidden" name="dayofweeks" value="fri">
	<div>금</div>
	<div>시작시간
		<select name="start_times" class="Schk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>종료시간
		<select name="end_times" class="Echk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>
      쉬는 날 <input type="checkbox" onchange="restchk(this)" class="rest">
    </div>
	</div>
	
	<div class="day-container">
	<input type="hidden" name="dayofweeks" value="sat">
	<div>토</div>
	<div>시작시간
		<select name="start_times" class="Schk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>종료시간
		<select name="end_times" class="Echk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>
      쉬는 날 <input type="checkbox" onchange="restchk(this)" class="rest">
    </div>
	</div>
	
	<div class="day-container">
	<input type="hidden" name="dayofweeks" value="sun">
	<div>일</div>
	<div>시작시간
		<select name="start_times" class="Schk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>종료시간
		<select name="end_times" class="Echk_rest">
			<c:forEach begin="9" end="18" var="times">
				<option>${times<10?'0':''}${times}:00</option>
			</c:forEach>
		</select>
	</div>
	<div>
      쉬는 날 <input type="checkbox" onchange="restchk(this)" class="rest">
    </div>
	</div>
	
</div>
<input type="submit" value="등록">
</form>
</section>
</body>
</html>