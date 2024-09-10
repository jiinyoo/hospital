<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
$(function(){
	$("#pro_inwon").spinner({
		min:10,
		max:50
		
	});
});
</script>
</head>
<body>
<section>
<form method="post" action="programwriteOk" enctype="multipart/form-data">
<input type="hidden" name="pro_ju" value="${pro_ju}">
<table align="center" width="500px" height="500px";>
	<tr>
		<td width="200px";>프로그램 명  </td>
		<td><input type="text" name="pro_name"></td>
	</tr>
	<tr>
		<td>프로그램 소개</td>
		<td><textarea name="pro_info"></textarea></td>
	</tr>
	<tr>
		<td>강사명</td>
		<td><input type="text" name="teach_name"></td>
	</tr>
	<tr>
		<td>시간</td>
		<td><input type="text" name="pro_time"></td>
	</tr>
	<tr>
		<td>총 인원 </td>
		<td><input type="text" id="pro_inwon" name="pro_inwon"></td>
	</tr>
	<tr>
		<td>관련과 </td>
		<td><select name="pro_part">
			<option value="정신과">정신과</option>
			<option value="내분비과">내분비과</option>
			<option value="치과">치과</option>
			<option value="이비인후과">이비인후과</option>
        </select></td>
	</tr>
	<tr>
		<td>대표 이미지</td>
		<td><input type="file" name="file"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="업데이트하기"></td>
	</tr>

</table>

</form>

</section>


</body>
</html>