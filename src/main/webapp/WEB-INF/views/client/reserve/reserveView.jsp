<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:800px;
		margin: 30px auto;
	}
	
	section table {
		width: 100%;
	}
	
	th {
		text-align: left;
		background: #ccc;
		
	}
	
	th,td {padding: 7px 16px;}
	
	#chkUser {
		width: 350px;
		background: white;
		position: fixed;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		display: none; /* 처음에는 보이지 않게 설정 */
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 약간의 그림자 추가 */
		padding: 20px;
		border-radius: 10px; /* 모서리 둥글게 */
	}
	
	#chkUser input {
		height: 30px;
		width:20%;
	}
</style>
<script>
	function chkUser(resid,userid) {
		document.getElementById("res_id").value = resid;
		document.getElementById("user_id").value=userid;
		document.getElementById("chkUser").style.display = "block";
	}
	
	function onlyNum(my,next,maxlength) {
		my.value=my.value.replace(/[^0-9]/g,"");
		
		if(my.value.length==maxlength) {
			document.getElementById(next).focus();
		}
	}
	
	function chk() {
		var phone1=document.getElementById("phone1").value;
		var phone2=document.getElementById("phone2").value;
		var phone3=document.getElementById("phone3").value;
		
		if (phone1.length!==3 || phone2.length!==4 || phone3.length!==4) {
	        alert("유효한 연락처를 입력해주세요.");
	        return false;
	    }			
		
		if(true) {
	    	document.getElementsByName("user_phone")[0].value=phone1+"-"+phone2+"-"+phone3;
	    	document.getElementsByName("user_jumin")[0].value=jumin1+"-"+jumin2;
	    	
	    	return true;
	    }
	}
</script>
</head>
<body>
	<section>
		<h2>진료 예정</h2>
		<table>
			<tr>
				<th>예약번호</th>
				<th>진찰과</th>
				<th>의사명</th>
				<th>예약일</th>
				<th>비고</th>
			</tr>
			<c:if test="${empty rdto }">
			<tr>
				<td colspan="5" align="center"> 예약정보가 없습니다. </td>
			</tr>
			</c:if>
			<c:forEach var="res" items="${rdto }" varStatus="sts">
			<tr>
				<td>${res.res_code}</td>
				<td>${res.doc_part }</td>
				<td>${doc[sts.index]}</td>
				<td>${res.res_date } ${res.res_time } </td>
				<td>
					진료 예정
					<c:if test="${!empty sessionScope.user_id}">
					<input type="button" value="예약 취소" onclick="location='cancelRes?res_id=${res.res_id}'">
					</c:if>
					<c:if test="${empty sessionScope.user_id}">
					
					<input type="button" value="예약 취소" onclick="chkUser('${res.res_id}','${res.user_id}')">
					</c:if>
				</td>
			</tr>
			</c:forEach>		
		</table>
		
		<c:if test="${!empty sessionScope.user_id}">
		<h2>지난 예약</h2>
		<table>
			<tr>
				<th>예약번호</th>
				<th>진찰과</th>
				<th>의사명</th>
				<th>예약일</th>
				<th>비고</th>
			</tr>
			<c:if test="${empty past }">
			<tr>
				<td colspan="5" align="center"> 예약정보가 없습니다. </td>
			</tr>
			</c:if>
			<c:forEach var="past" items="${past }" varStatus="sts">
			<tr>
				<td>${past.res_code}</td>
				<td>${past.doc_part }</td>
				<td>${pastDoc[sts.index]}</td>
				<td>${past.res_date } ${past.res_time } </td>
				<td> 
				<c:if test="${past.state==1}">
				진료 완료
				</c:if>
				<c:if test="${past.state!=1}">
				예약 취소
				</c:if>
				</td>
			</tr>
			</c:forEach>		
		</table>
		</c:if>
	</section>
	<div id="chkUser">
		<form method="post" action="cancelRes" onsubmit="return chk()">
		<div>예약 취소에 필요한 </div>
		<div>휴대폰 번호를 입력해주세요</div>
		<input type="hidden" name="res_id" id="res_id">
		<input type="hidden" name="user_phone">
		<input type="hidden" name="user_id" id="user_id">
		<div id="phone-container">
			<input type="text" id="phone1" placeholder="연락처" maxlength="3" oninput="onlyNum(this,'phone2',3)">
			<span>-</span>
			<input type="text" id="phone2" maxlength="4" oninput="onlyNum(this,'phone3',4)">
			<span>-</span>
			<input type="text" id="phone3" maxlength="4" oninput="onlyNum(this,null,null)">
			<input type="submit" value="예약 취소">
		</div>
		</form>
	</div>
</body>
</html>