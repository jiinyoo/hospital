<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>작성자</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<c:forEach items="${bmapAll}" var="bdto">
	<tr>
		<td>${bdto.user_id}</td>
		<td>${bdto.board_title}</td>
		<td>${bdto.writeday}</td>
		<td>${bdto.board_readnum}</td>
	</tr>
	</c:forEach>
<tr>
	<td colspan="4"><a href="../../boardwrite"><input type="button" value="글쓰기"></a></td>
</tr>
</table>
</body>
</html>