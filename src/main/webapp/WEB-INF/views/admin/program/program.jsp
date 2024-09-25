<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Program List</title>
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
    color:white;
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
</style>
<script>
window.onload=function() {
	
	var sword = "${param.sword}";
	var stype = "${param.stype}";
	if (sword) {
		document.getElementById("sword").value = sword;
	}
	if (stype) {
		document.getElementsByName("stype")[0].value = stype;
	}
	
}
</script>
</head>
<body>
<section>
<a href="/admin/program/programwrite"><input type="button" value="프로그램 등록"></a>
<div id="space"></div>
<h2>프로그램 목록</h2>
<table>
    <tr>
        <td width="200px">프로그램 이름</td>
        <td width="100px">강사</td>
        <td width="100px">파트</td>
        <td width="200px">프로그램 이미지</td>
        <td width="170px">시작일</td>
        <td width="170px">종료일</td>
        <td width="100px">해당요일</td>
        <td width="110px">일일 수용 인원</td>
        <td width="100px">삭제 및 수정</td>
        <td width="180px">진행/종료 여부</td>
    </tr>
    <c:forEach items="${plist}" var="pdto">
        <c:set var="end_date" value="${pdto.end_date}"/>
        <c:set var="start_date" value="${pdto.start_date}"/>
        <fmt:parseDate value="${end_date}" var="end_date" pattern="yyyy-MM-dd"/>
        <fmt:parseDate value="${start_date}" var="start_date" pattern="yyyy-MM-dd"/>
        <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" var="today"/>
        <fmt:parseDate value="${today}" var="today_date" pattern="yyyy-MM-dd"/>

        <tr>
            <td>${pdto.pro_name}</td>
            <td>${pdto.teach_name}</td>
            <td>${pdto.pro_part}</td>
            <td >
                <img src="../../static/admin/programfile/${pdto.pro_img}" width="300px">
            </td>
            <td>${pdto.start_date}</td>
            <td>${pdto.end_date}</td>
            <td>${pdto.days_of_week}</td>
            <td>${pdto.pro_inwon}</td>
            <td>
                <a href="/admin/program/programdelete?pro_id=${pdto.pro_id}"><input type="button" value="삭제"></a>
                <a href="/admin/program/programupdate?pro_id=${pdto.pro_id}"><input type="button" value="수정"></a>
            </td>
            <td>
               <c:choose>
			    <c:when test="${start_date.after(today_date)}">
			        진행 예정
			    </c:when>
			    <c:when test="${end_date.after(today_date) && (start_date.equals(today_date) || start_date.before(today_date))}">
			        진행 중
			    </c:when>
			    <c:otherwise>
			        종료
			    </c:otherwise>
			</c:choose>
            </td>
        </tr>
        </c:forEach>
        
		<div align="center" class="page">		
        <tr align="center">
		<td colspan="10">
		
		<c:if test="${pstart!=1}">		
			<a href="/admin/program/program?page=${pstart-1}&sword=${sword}&stype=${stype}"><span class="arrow">◀◀</span></a>
		</c:if>
		<c:if test="${pstart==1}">		
			<span class="arrow"> ◀◀</span>
		</c:if>
		
		<c:if test="${page!=1}">
			<a href="/admin/program/program?page=${page-1}&sword=${sword}&stype=${stype}"><span class="arrow">◁</span></a>
		</c:if>
		<c:if test="${page==1}">
			<span class="arrow">◁</span>
		</c:if>
		
		
		<c:forEach begin="${pstart}" end="${pend}" var="i">
			<c:if test="${page==i}">
				<a href="/admin/program/program?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow"  style="background-color:#033D7F;">${i}</span></a>
			</c:if>
			<c:if test="${page!=i}">
				<a href="/admin/program/program?page=${i}&sword=${sword}&stype=${stype}"><span class="arrow" >${i}</span></a>
			</c:if>
		</c:forEach>	
		
		<c:if test="${page!=chong }">
			<a href="/admin/program/program?page=${page+1}&sword=${sword}&stype=${stype}"><span class="arrow" >▷</span></a>
		</c:if>
		<c:if test="${page==chong }">
			<span class="arrow" >▷</span>
		</c:if>
		
		<c:if test="${pend!=chong }">
			<a href="/admin/program/program?page=${pend+1}&sword=${sword}&stype=${stype}"><span class="arrow"> ▶▶</span></a>
		</c:if>
		<c:if test="${pend==chong}">
			<span class="arrow" >▶▶</span>
		</c:if>
		</td>
	</tr>
	</div>
	<tr align="center">
		<td colspan="10">
		<form name="pkc"  id="sform"  action="/admin/program/program" method="post">
			<select name="stype">
				<option value="p.pro_name">프로그램 제목</option>			
				<option value="p.pro_part">파트</option>
				<option value="p.teach_name">강사</option>
				<input type="text" name="sword" id="sword">
				<input type="submit" value="검색">
			</select>
		</form>
		</td>
	</tr>
        
        
        
        
</table>
</section>
</body>
</html>
