<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function chk(n) {
		var medi = document.getElementById("medi_type");
		var options = medi.options;
		var su = prompt("수량을 입력하세요:", "1");
		if (su === null || su < 1) {
			return; // 취소하거나 유효하지 않은 수량 입력 시 추가하지 않음
		}
		
		for (var i=0;i<options.length;i++) {
			if (options[i].value === n.value) {
				return;
			}
		}
		
		var addOp = document.createElement("option");
		addOp.value = n.value+"-"+su+"일치";
		addOp.innerText = n.innerHTML+"-"+su+"일치";
		medi.appendChild(addOp);
	}
	
	function del(delindex) {
		var medi = document.getElementById("medi_type");
		medi.remove(delindex);
	}
	
	function sub() {
		var medi = document.getElementById("medi_type");
		var type = "";
		for (i = 0; i < medi.options.length; i++) {
			type += medi.options[i].value + "/";
		}
		
		document.getElementById("type").value = type;
		return true;
	}
</script>
<style>
	section {
		width: 800px;
		margin: 0 auto;
	}

	table {
		width: 100%;
		border-collapse: collapse;
	}

	table td {
		padding: 10px;
	}

	table td:nth-child(odd) {
	    background-color: #f0f0f0;
	    text-align: center;
	    font-weight: bold;
	}

	#res_code {
		border: none;
		background-color: transparent;
		pointer-events: none;
		width: 100%;
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
</style>
</head>
<body>
	<form method="get" action="medicalOk" onsubmit="return sub()">
		<input type="hidden" name="doc_id" value="${rdto.doc_id }">
		<input type="hidden" name="user_name" value="${rdto.user_name}">
		<input type="hidden" name="user_id" value="${rdto.user_id }">
		<input type="hidden" name="medi_part" value="${rdto.doc_part }">
		<input type="hidden" id="type" name="medi_type">
		
		<section>
			<table>
				<tr>
					<td>성함</td>
					<td>${rdto.user_name}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>${rdto.user_jumin }</td>
				</tr>
				<tr>
					<td>예약번호</td>
					<td><input type="text" name="res_code" id="res_code" value="${rdto.res_code}" readonly></td>
				</tr>
				<tr>
					<td>증상</td>
					<td>
						<textarea name="medi_content"></textarea>
					</td>
				</tr>
				<tr>
					<td>처방</td>
					<td>
						<div style="display: flex; justify-content: space-between;">
							<select ondblclick="chk(this.options[this.selectedIndex])" size="10">
								<option value="타이레놀">타이레놀</option>
								<option value="아스피린">아스피린</option>
								<option value="부루펜">부루펜</option>
								<option value="후시딘">후시딘</option>
								<option value="게보린">게보린</option>
								<option value="판콜에이">판콜에이</option>
								<option value="베나치오">베나치오</option>
								<option value="록스펜">록스펜</option>
								<option value="아목사펜">아목사펜</option>
								<option value="글리벡">글리벡</option>
								<option value="네오마이신">네오마이신</option>
								<option value="카베진">카베진</option>
								<option value="시메티딘">시메티딘</option>
								<option value="플루톨">플루톨</option>
								<option value="디아제팜">디아제팜</option>
								<option value="메가스">메가스</option>
								<option value="로벨리토">로벨리토</option>
								<option value="아타칸">아타칸</option>
								<option value="레바미피드">레바미피드</option>
								<option value="페니라민">페니라민</option>
							</select>
							<select id="medi_type" size="10" ondblclick="del(this.options[this.selectedIndex])">
							</select>
						</div>
					</td>
				</tr>
			</table>
		</section>
		<div style="text-align: center; margin-top: 20px;">
			<input type="submit" value="진료">
		</div>
	</form>
</body>
</html>
