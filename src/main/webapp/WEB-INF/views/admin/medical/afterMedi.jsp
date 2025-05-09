<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        background-color: #f4f4f4;
    }
    section {
        width: 80%;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: center;
    }
    th {
        background-color: #00cccc;
        font-weight: bold;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    a {
        color: #3498db;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
	<section>
	<h2>환자진료 기록 조회 - ${user_id }</h2>
		<table>
			<tr>
				<th> 번호 </th>
				<th> 성함 </th>
				<th> 생년월일 </th>
				<th> 담당의사 </th>
				<th> 분야 </th>
				<th> 방문일 </th>
			</tr>
			<c:forEach var="mdto" items="${mdto}">
			<tr>
				<td> ${mdto.medi_id } </td>
				<td><a href="afterMediView?res_code=${mdto.res_code}"> ${mdto.user_name } </a></td>
				<td> ${mdto.user_jumin }</td>
				<td> ${mdto.doc_name } </td>
				<td> ${mdto.medi_part} </td>
				<td> ${mdto.medi_visit} </td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="center">
				<c:if test="${pstart!=1}">
				<a href="afterMedi?page=1">첫페이지</a>
				<a href="afterMedi?page=${pstart-1}">이전</a>
				</c:if>
				<c:forEach var="i" begin="${pstart}" end="${pend}">
				<a href="afterMedi?page=${i}">${i}</a>
				</c:forEach>
				<c:if test="${pend!=chong}">
				<a href="afterMedi?page=${pend+1}">다음</a>
				<a href="afterMedi?page=${chong}">마지막</a>
				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<form method="get" action="afterMedi">
						<select name="stype">
							<option value="user_name">성함</option>
							<option value="doc_name">담당의사</option>
							<option value="medi_part">분야</option>
						</select>
						<input type="text" name="sword">
						<input type="submit" value="검색">
					</form>
				</td>
			</tr>
		</table>
	</section>
</body>
</html>