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
        padding: 20px;
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
	<table>
		<h2>의료진</h2>
		<tr>
			<th> 번호 </th>
			<th> 이름 </th>
			<th> 진료과 </th>
			<th> 전화번호 </th>
			<th> 근무시작일 </th>
		</tr>
		<c:forEach var="doctor" items="${doctorList}">
		<tr>
			<td> ${doctor.doc_id } </td>
			<td> <a href="view?doc_id=${doctor.doc_id}">${doctor.doc_name }</a> </td>
			<td> ${doctor.doc_part } </td>
			<td> ${doctor.doc_phone } </td>
			<td> ${doctor.writeday } </td>
		</tr>	
		</c:forEach>
	</table>
</section>
</body>
</html>