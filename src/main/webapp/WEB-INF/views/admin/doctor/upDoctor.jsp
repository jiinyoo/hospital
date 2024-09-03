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
		for(i=0;i<his.length-1;i++) {
			history+=his[i].value+"/";
		}
		document.getElementById("doc_history").value=history;
		return true;

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

	select {
		width: 100%;
		height: 150px;
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
</style>
</head>
<body>
<section>
<form method="post" action="upDoctorOk" enctype="multipart/form-data" onsubmit="return subchk()">
<input type="hidden" name="doc_history" id="doc_history">
<input type="hidden" name="doc_userid" value="${ddto.doc_userid}">
<table>
	<tr>	
		<th>성함 </th>
		<td><input type="text" name="doc_name" value="${ddto.doc_name}" readonly style="pointer-events: none;border:none;"></td>
		<th>분야</th>
		<td><input type="text" name="doc_part" value="${ddto.doc_part }"></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td colspan="3"><input type="text" name="doc_phone" value="${ddto.doc_phone }"></td>
	</tr>
	<tr>
		<th>약력</th>
		<td id="his" colspan="3">
			<c:forEach var="history" items="${ddto.historys}">
			<div><input type="text" class="history" name="doc_his" value="${history}"onkeyup="chk()" placeholder="약력을 입력하세요"></div>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th> 프로필 사진 추가 </th>
		<td colspan="3"> <input type="file" name="file" id="file"> </td>
	</tr>
	<tr>
		<td colspan="4" style="text-align: center;"> <input type="submit" value="수정"> </td>
	</tr>
</table>
</form>
</section>
</body>
</html>