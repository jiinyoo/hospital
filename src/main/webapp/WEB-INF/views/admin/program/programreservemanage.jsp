<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
    margin: 50px auto;
    width: 90%; /* 전체 폭을 90%로 설정하여 중앙에 배치 */
    max-width: 1300px; /* 최대 너비를 설정 */
}

input[type=button] {
    width: 100px;
    height: 40px;
    margin-bottom:10px;
    background-color: #8BBCFF;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

input[type=button]:hover {
    background-color: #007BC9; /* 마우스 오버 시 색상 변경 */
}

#space {
    height: 30px;
}

table {
    width: 100%; /* 테이블의 너비를 100%로 설정 */
    border-collapse: collapse; /* 셀 간의 경계를 없앰 */
    text-align: center;
    margin-bottom: 20px;
    background-color: white; /* 테이블 배경을 흰색으로 설정 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    border-radius: 10px; /* 모서리를 둥글게 처리 */
    overflow: hidden;
}

table tr:first-child {
    background-color: #007BC9; /* 첫 번째 행에 배경색 적용 */
    color:white;
}

table td, table th {
    padding: 15px; /* 셀 내부 여백 */
    border: 1px solid #dddddd; /* 셀 경계선 */
    font-size: 16px;
}

table th {
    background-color: #f2f2f2; /* 테이블 헤더 배경색 */
    font-weight: bold;
}


table img {
    max-width: 100%;
    height: auto;
}

table tr:nth-child(even) {
    background-color: #f9f9f9; /* 짝수 행에 회색 배경 적용 */
}



.page {
        text-align: center;
        margin-top: 20px;
        border:none;
 }
 
 
.arrow {
 		display: inline-block;
        padding: 8px 16px;
        background-color: #004fa8;
        color: white;
        margin: 0 2px;
        border-radius: 5px;
        text-decoration: none;
}

 .arrow:hover {
      background-color: #033D7F;
  }
  
  
  #sform input,#sform select {
		font-family: 'goorm-sans-bold';
		margin-left:8px;
		height:30px;
	}
	
	#sform {
		margin-top: 20px;
		text-align: center;
	}
	
	
	#sform input[type="submit"] {
		font-family: 'goorm-sans-bold';
        display: inline-block;
        width: 70px;
        height:30px;
        background-color: #004fa8;
        color: white;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        line-height: 18px;
        border:none;
	}





input[type=button]
{
	width:60%;
    height:30px;
    padding:5px;
    margin:10px;
    background-color:#8BBCFF;;
    color:white;
    border:1px solid white;
    border-radius:5px;
}

#space {
	height:30px;
	

}

table {
	border-spacing:0px;
	align:center;
	text-align:center;
}


table td{
    border-spacing:0px;
    border:1px solid black;
}
#sform input,#sform select {
		font-family: 'goorm-sans-bold';
		margin-left:8px;
		height:30px;
	}
	
	#sform {
		margin-top: 20px;
		text-align: center;
	}
	
	
	#sform input[type="submit"] {
		font-family: 'goorm-sans-bold';
        display: inline-block;
        width: 70px;
        height:30px;
        background-color: #004fa8;
        color: white;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        line-height: 18px;
        border:none;
	}

.page {
        text-align: center;
        margin-top: 20px;
        border:none;
 }
 
 
.arrow {
 		display: inline-block;
        padding: 8px 16px;
        background-color: #004fa8;
        color: white;
        margin: 0 2px;
        border-radius: 5px;
        text-decoration: none;
}

 .arrow:hover {
      background-color: #033D7F;
  }


</style>
<script>

function suyong(chgstate, pres_id, pro_id, pres_date, p_inwon) {
    var chk = new XMLHttpRequest();
    chk.onload = function() {
        var response = JSON.parse(chk.responseText);
        response=JSON.stringify(response, null, 2);
        if(response=="100") {
        	alert("수용인원을 초과하였습니다.재승인할 수 없습니다.");
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
			<td width="100">예약 번호</td>
			<td width="200">프로그램 명</td>
			<td width="180">프로그램 시행일</td>
			<td width="100">이름</td>	
			<td width="220">전화번호</td>		
			<td width="200">신청일</td>
			<td width="300">상태</td>
			<td width="150">신청인원</td>
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
				<input type="button" value="예약 재승인" onclick="suyong('0','${prdto.pres_id}','${prdto.pro_id}','${prdto.pres_date}','${prdto.p_inwon}')">	
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
		<div class="page">
		<tr>
			<td colspan="8">
				<c:if test="${pstart!=1}">
					<a href="/admin/program/programreservemanage?page=${pstart-1}&sword=${sword}&stype=${stype}"><span class="arrow">◀◀</span></a>
				</c:if>
				<c:if test="${pstart==1}">
					<span class="arrow">◀◀</span>
				</c:if>
				<c:if test="${page!=1}">
					<a href="/admin/program/programreservemanage?page=${page-1}&sword=${sword}&stype=${stype}"><span class="arrow">◁</span></a>
				</c:if>
				<c:if test="${page==1}">
					<span class="arrow">◁</span>
				</c:if>
				
				<c:forEach	begin="${pstart}" end="${pend}" var="i">
					<c:set var="style" value=""/>
					
					<c:if test="${page==i}">
							<a href="/admin/program/programreservemanage?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow"  style="background-color:#033D7F;">${i}</span></a>
					</c:if>
					<c:if test="${page!=i}">
							<a href="/admin/program/programreservemanage?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow" >${i}</span></a>
					</c:if>
				</c:forEach>
				<c:if test="${page!=chong}">
					<a href="/admin/program/programreservemanage?page=${page+1}&sword=${sword}&stype=${stype}"><span class="arrow">▷</span></a>
				</c:if>
				<c:if test="${page==chong}">
					<span class="arrow">▷</span>
				</c:if>
				<c:if test="${pend==chong}">
					<span class="arrow">▶▶</span>
				</c:if>
				<c:if test="${pend!=chong}">
					<a href="/admin/program/programreservemanage?page=${pend+1}&sword=${sword}&stype=${stype}"><span class="arrow">▶▶</span></a>
				</c:if>
			</td>
		</tr>
		</div>
		<tr>
			<td colspan="8">
			<form action="/admin/program/programreservemanage" id="sform" method="post">
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