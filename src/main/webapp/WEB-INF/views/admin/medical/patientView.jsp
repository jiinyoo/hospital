<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function chk(n) {
		var medi=document.getElementById("medi_type");
		var options = medi.options;
		
		// 이미 추가된 항목인지 확인
		for (var i = 0; i < options.length; i++) {
			if (options[i].value === n.value) {
				return; // 중복 추가 방지
			}
		}
		
		var addOp=document.createElement("option");
		addOp.value=n.value;
		addOp.innerText=n.innerHTML;
		medi.appendChild(addOp);
		
	}
	
	function del(delindex) {
		var medi=document.getElementById("medi_type");
		
		medi.remove(delindex);
	}
	
	function sub() {
		var medi=document.getElementById("medi_type");
		var type="";
		for(i=0;i<medi.options.length;i++) {
			type+=medi.options[i].value+"/";
		}
		
		document.getElementById("type").value=type;
		return true;
	}
</script>
<style>
	select {width:100px; height: 300px;}
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
		<div>성함</div><div>${rdto.user_name}</div>
		<div>생년월일</div><div>${rdto.user_jumin }</div>
		<div>예약번호</div><div><input type="text" name="res_code" value="${rdto.res_code}" readonly></div>
		<div>증상</div>
		<div>
			<textarea name="medi_content"></textarea>
		</div>
		<div>처방</div>
		<div>
			<select ondblclick="chk(this.options[this.selectedIndex])" size="10">
			    <option value="tylenol">타이레놀</option>
			    <option value="aspirin">아스피린</option>
			    <option value="brufen">부루펜</option>
			    <option value="fucidin">후시딘</option>
			    <option value="gevorin">게보린</option>
			    <option value="pancol-a">판콜에이</option>
			    <option value="benachio">베나치오</option>
			    <option value="loxfen">록스펜</option>
			    <option value="amoxapen">아목사펜</option>
			    <option value="gleevec">글리벡</option>
			    <option value="neomycin">네오마이신</option>
			    <option value="kabezin">카베진</option>
			    <option value="cimetidine">시메티딘</option>
			    <option value="plutol">플루톨</option>
			    <option value="diazepam">디아제팜</option>
			    <option value="megace">메가스</option>
			    <option value="lovelito">로벨리토</option>
			    <option value="atacand">아타칸</option>
			    <option value="rebamipide">레바미피드</option>
			    <option value="pheniramine">페니라민</option>
			</select>
			<select id="medi_type" size="10" ondblclick="del(this.options[this.selectedIndex])">
			    
			</select>
		</div>
	</section>
	<input type="submit" value="진료"> 
	</form>
</body>
</html>