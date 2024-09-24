<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
       margin:10px auto;
       width: 1300px;
   }
   
 table {
 	margin:10px auto;
 	align:center;
 
 }
</style>
<script>

function check() {
	return confirm("정말로 취소하시겠습니까?")	
}



function validCalendar() {
	
	if(document.getElementById("start").value!="") {
		var startdate=new Date(document.getElementById("start").value);
		startdate.setDate(startdate.getDate()+1) //반환값이랑 실체 객체에 반영되는 것은 상이할 수 있다.
		var endstartYear=startdate.getFullYear();
		var endstartMonth=("0"+(startdate.getMonth()+1)).slice(-2);
		var endstartDate=("0"+startdate.getDate()).slice(-2);
		var formatdate=endstartYear+"-"+endstartMonth+"-"+endstartDate
		document.getElementById("end").setAttribute("min", formatdate);
	}
}

</script>
</head>
<body>
<section>
	<table width="900">
	<caption style="height:40px"><h2>예정 프로그램</h2></caption>
	<tr>
		<td>예약 번호</td>
		<td>프로그램 명</td>
		<td>강사명</td>
		<td>예약일</td>
		<td>프로그램 시행일</td>
		<td>취소 버튼</td>
	</tr>
	<c:forEach items="${prlist}" var="prdto">
	<tr>
		<td>${prdto.pres_number}</td>	
		<td>${prdto.pro_name}</td>
		<td>${prdto.teach_name}</td>
		<td>${prdto.writeday}</td>
		<td>${prdto.pres_date}</td>
		<c:if test="${prdto.state==0}">
		<td><a href="/main/memberpreserve?pres_id=${prdto.pres_id}&pres_date=${prdto.pres_date}&p_inwon=${prdto.p_inwon}&pro_id=${prdto.pro_id}" onclick="return check()"><input type="button" value="예약 취소"></a></td>
		</c:if>
		<c:if test="${prdto.state==1||prdto.state==3}">
			<td>예약 취소 완료</td>
		</c:if>
	</tr>
	</c:forEach>
	</table>
	
	
	
	
	<table width="900">
	<caption style="height:40px"><h2>지난 프로그램 예약</h2></caption>
	<form method="post" action="/main/memberpreserve">
	<input type="hidden" name="month" value="0">
	<tr>
		<td colspan="3" height="100px">
			<a href="/main/memberpreserve?month=1">1달이내</a>
			<a href="/main/memberpreserve?month=3">3달이내</a>
			<a href="/main/memberpreserve?month=6">6달이내</a>
			<a href="/main/memberpreserve?month=12">전체보기</a>
		</td>
		<td colspan="3">
			<input type="date" name="start" id="start">
			<input type="date" name="end" id="end" onclick=validCalendar()>
			<input type="submit" value="기간 검색">
		</td>
	<tr>	
	</form>

	<tr>
		<td>예약 번호</td>
		<td>프로그램 명</td>
		<td>강사명</td>
		<td>예약일</td>
		<td>프로그램 시행일</td>
		<td>비고</td>
	</tr>
	<c:forEach items="${prlist2}" var="prdto2">
	<tr>
		<td>${prdto2.pres_number}</td>	
		<td>${prdto2.pro_name}</td>
		<td>${prdto2.teach_name}</td>
		<td>${prdto2.writeday}</td>
		<td>${prdto2.pres_date}</td>
		<td>지난 프로그램</td>
		
	</tr>
	</c:forEach>
	</table>
	
	
	





</section>
</body>
</html>