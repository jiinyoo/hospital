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
</script>
<style>
	section {
		width:500px;
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
	<tr>
		<td colspan="4" style="text-align: center;"> <input type="submit" value="수정"> </td>
	</tr>
</table>

</form>
</section>
</body>
</html>