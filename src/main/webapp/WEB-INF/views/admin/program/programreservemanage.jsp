<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function suyong(chgstate, pres_id, pro_id, pres_date, p_inwon) {
    var chk = new XMLHttpRequest();
    chk.onload = function() {
        var response = JSON.parse(chk.responseText);
        response=JSON.stringify(response, null, 2);
        if(response=="100") {
        	alert("수용인원을 추가하였습니다.재승인할 수 없습니다.");
        } 
    };
    chk.open("GET", "/admin/program/chgstate?state=" + chgstate + "&pres_id=" + pres_id + "&pro_id=" + pro_id + "&pres_date=" + pres_date + "&p_inwon=" + p_inwon);
    chk.send();
    location.reload();
}



</script>
</head>
<body>
<section>
	<table>
		<tr>
			<td>예약 번호</td>
			<td>프로그램 명</td>
			<td>프로그램 시행일</td>
			<td>이름</td>	
			<td>전화번호</td>		
			<td>신청일</td>
			<td width="200">상태</td>
			<td>신청인원</td>
		</tr>
	<c:forEach items="${prlist}" var="prdto">
		<tr>
			<td>${prdto.pres_number}</td>
			<td>${prdto.pro_name}</td>
			<td>${prdto.pres_date}</td>
			<td>${prdto.user_name}</td>
			<td>${prdto.user_phone}</td>
			<td>${prdto.writeday}</td>
			<td>
				<c:if test="${prdto.state==0}">
					예약 완료
				<input type="button" value="관리자 예약 취소" onclick="suyong('1','${prdto.pres_id}','${prdto.pro_id}','${prdto.pres_date}','${prdto.p_inwon}')">
				</c:if>
				
				<c:if test="${prdto.state==1}">
					관리자에 의한 예약 취소
				<input type="button" value="예약 재승인" onclick="suyong('0','${prdto.pres_id}','${prdto.pro_id}','${prdto.pres_date}','${prdto.p_inwon}')">
				</c:if>
				
				
				<c:if test="${prdto.state==3}">
					사용자에 의한 예약 취소
				<input type="button" value="예약 재승인" onclick="suyong('0','${prdto.pres_id}','${prdto.pro_id}','${prdto.pres_date}','${prdto.p_inwon}')">>	
				
				</c:if>
				
				
				<c:if test="${prdto.state==2}">
					지난 예약
				<a href="/admin/program/preserveuserdelete?pres_id=${prdto.pres_id}">
				<input type="button" value="기록 삭제">
				</a>
				</c:if>
			
			</td>
			<td>${prdto.p_inwon}</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="8">
				<c:forEach	begin="${pstart}" end="${pend}" var="i">
					<a href="/admin/program/programreservemanage?page=${page}&sword=${sword}&stype=${stype}">${i}</a>
				</c:forEach>
			</td>
		</tr>
		
		<tr>
			<td colspan="8">
			<form action="/admin/program/programreservemanage">
			<select name="stype">
				<option value="p.pro_name" >프로그램 이름</option>
				<option value="u.user_name">신청자 이름</option>
			</select>
			<input type="text" name="sword">
			<input type="submit" value="검색">
			</form>
		</tr>
	
	
	
	
	
	</table>
</section>
</body>
</html>