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
	<h2>환자 진료 - ${user_id }</h2>
		<table width="700">
			<tr>
				<th> 번호 </th>
				<th> 성함 </th>
				<c:if test="${state==2}">
				<th> 담당의사 </th>
				</c:if>
				<th> 생년월일 </th>
				<th> 분야 </th>
				<th> 진료시간 </th>
				<th> 비고 </th>
			</tr>
			<c:forEach var="pdto" items="${pdto}">
			<tr>
				<td> ${pdto.res_id } </td>
				<td> 
					<c:if test="${pdto.state==0}">
					<a href="patientView?res_id=${pdto.res_id}">${pdto.user_name }</a> 
					</c:if>
					<c:if test="${pdto.state==1}">
					<a href="afterMediView?res_code=${pdto.res_code}"> ${pdto.user_name }</a>
					</c:if>	
				</td>
				<c:if test="${state==2}">
				<td> ${pdto.doc_name } </td>
				</c:if>
				<td> ${pdto.user_jumin }</td>
				<td> ${pdto.doc_part } </td>
				<td> ${pdto.res_date } ${pdto.res_time } </td>
				<td>${pdto.state==0?'':'진료완료' }</td>
			</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>