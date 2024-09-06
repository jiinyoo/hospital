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
		
		for(i=0;i<his.length-1;i++) {
			if(his[i].value.length==0) {
				his[i].parentElement.remove();				
			}
		}	
	}
	
	function subchk() {
		
		
		var his=document.getElementsByClassName("history");
		var history="";
		for(i=0;i<his.length;i++) {
			if(his[i].value.trim().length!=0) {
				history+=his[i].value+"/";
			}
		}
		document.getElementById("doc_history").value=history;
		return true;
	}
	
	function chgimg() {
		document.getElementById("fileInput").click();
	}
	
	function preview(e) {
		var reader=new FileReader();
		reader.onload=function() {
			var output=document.getElementById("docImg");
			output.src=reader.result;
		}
		reader.readAsDataURL(e.target.files[0]);
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
	
	
	window.onload=function() {
		var start=document.getElementsByClassName("Schk_rest");
		var end=document.getElementsByClassName("Echk_rest");
		
		<c:forEach var="day" items="${wdto}" varStatus="status">
        // 각 셀렉트 박스에 값 설정
        start[${status.index}].value = "${day.start_time.hour}";
        end[${status.index}].value = "${day.end_time.hour}";
		</c:forEach>
	}
</script>
<style>
	section {
		width:800px;
	}
	
	table {
		width:100%;
		border-collapse: collapse;
	}
	
	.main-table {
		margin:20px;
	}
	
	td,th {
		padding-left: 10px;
		text-align: left;
	}
	
	th {
		background: #f5f5f5;
		color: #333;
		font-weight: bold;
		width: 100px;
		height:40px;
	}
	
	input[type="text"] {
		width:100%;
		height: 25px;
	}
	
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
	
	.workday {
		width:700px;
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
<form method="post" action="upDoctorOk" enctype="multipart/form-data" onsubmit="return subchk()">
<input type="hidden" name="doc_history" id="doc_history">
<input type="hidden" name="doc_userid" value="${ddto.doc_userid}">
<input type="file" id="fileInput" name="file" style="display:none;" onchange="preview(event)">
<table class="main-table">
	<tr>
		<td>
			<div class="img">
			    <img id="docImg" src="/static/admin/programfile/${ddto.doc_img}" height="120">
			    <div class="img-change" onclick="chgimg()">사진을 변경하려면 클릭하세요</div>
			</div>
		</td>
		<td>
			<table class="sub-table">
				<tr>
					<th>성함 </th>
					<td><input type="text" name="doc_name" value="${ddto.doc_name}" readonly style="pointer-events: none;border:none;"></td>
				</tr>
				<tr>
					<th>분야</th>
					<td><input type="text" name="doc_part" value="${ddto.doc_part }"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td colspan="3"><input type="text" name="doc_phone" value="${ddto.doc_phone }"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>약력</th>
		<td id="his" colspan="3">
			<c:forEach var="history" items="${ddto.historys}">
			<div><input type="text" class="history" name="doc_his" value="${history}"onkeyup="chk()" placeholder="약력을 입력하세요"></div>
			</c:forEach>
		</td>
	</tr>
</table>
<input type="hidden" name="dayofweeks" value="mon">
<input type="hidden" name="dayofweeks" value="tue">
<input type="hidden" name="dayofweeks" value="wed">
<input type="hidden" name="dayofweeks" value="thu">
<input type="hidden" name="dayofweeks" value="fri">
<input type="hidden" name="dayofweeks" value="sat">
<input type="hidden" name="dayofweeks" value="sun">
<table class="workday">
	<tr>
		<th>요일</th>
		<th width="50%">시간</th>
		<th width="20%">쉬는날</th>
	</tr>
	<c:forEach begin="0" end="6" var="index">
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