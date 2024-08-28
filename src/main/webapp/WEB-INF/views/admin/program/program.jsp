<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=button]
{
	width:100px;
	height:50px;

}

table td{
	border-spacing:0px;
	border:1px solid black;

}
</style>
<script>
function content(num)
{
	location.href="/admin/program/programwrite?pro_ju="+num;
}
</script>
</head>
<body>
<section>


<button onclick="content(0)" type="button" name="firstp" value="0">토요일 첫째주 프로그램 업데이트</button>
<button onclick="content(1)" type="button" name="secondp" value="0">토요일 둘째주 프로그램 업데이트</button>
<button onclick="content(2)" type="button" name="thirdp" value="0">토요일 셋째주 프로그램 업데이트</button>
<button onclick="content(3)" type="button" name="fourthp" value="0">토요일 넷째주 프로그램 업데이트</button>

<c:forEach items="${plist}" var="pdto">
	<table>
		<tr>
			<td width="140px">주차</td>
			<td width="140px">프로그램 이름</td>
			<td width="140px">강사</td>
			<td width="140px">파트</td>
			<td width="140px">프로그램 이미지</td>
		</tr>
	
		<tr>
			<td>${pdto.pro_ju+1}주차 </td>
			<td>${pdto.pro_name}</td>
			<td>${pdto.teach_name}</td>
			<td>${pdto.pro_part}</td>
		<td>
			<img src="../../static/admin/programfile/${pdto.pro_img}" width="300px">
		</td>
		</tr>
	</table>
</c:forEach>

</section>
</body>
</html>