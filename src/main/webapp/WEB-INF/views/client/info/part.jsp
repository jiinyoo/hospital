<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width: 800px;
		margin: 20px auto;
		background-color: #f9f9f9;
		padding: 20px;
		border-radius: 10px;
		
	}
	
	.info-header {
		margin-top: 30px;
		display: flex;
		justify-content: space-around;
		font-size: 20px;
		background-color: #eef2f5;
		padding: 10px 0;
		border-radius: 8px;
	}
	
	.info-header a {
		text-decoration: none;
		color: #333;
		font-weight: bold;
		transition: color 0.3s ease;
	}
	
	.info-header a:hover {
		color: #007BFF;
	}
	
	.info-header > div {
		width: 200px;
		height: 50px;
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		transition: transform 0.3s ease, background-color 0.3s ease;
	}

	

	table {
		width: 500px;
		margin-top: 30px;
		border-collapse: collapse;
		margin:auto;
		
	}

	.info-img {
		text-align: center;
		width: 30%;
	}

	.info-img img {
		width: 180px;
		border-radius: 10px;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}
	
	td {
		vertical-align: top;
		padding: 15px;
	}

	.res_btn {
		text-align: center;
		padding-top: 20px;
	}

	.res_btn input {
		margin-top: 10px;
		border: none;
		width: 120px;
		height: 45px;
		background-color: #007BFF;
		color: white;
		font-size: 16px;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		transition: background-color 0.3s ease, transform 0.3s ease;
	}

	.res_btn input:hover {
		background-color: #0056b3;
		transform: scale(1.05);
	}
	
	.doc-li {
		list-style-type: none;
		padding: 5px;
		font-size: 15px;
		color: #555;
	}
	
	hr {
		border: 0;
		border-top: 1px solid #eee;
		margin: 30px 0;
	}
</style>
</head>
<body>
	<section>
		<div class="info-header">
			<div><a href="part?part=정신과" ${param.part=='정신과'?"style='color:#9263de'":'' }>정신과</a></div>
			<div><a href="part?part=내분비과" ${param.part=='내분비과'?"style='color:#9263de'":'' }>내분비과</a></div>
			<div><a href="part?part=치과" ${param.part=='치과'?"style='color:#9263de'":'' }>치과</a></div>
			<div><a href="part?part=이비인후과" ${param.part=='이비인후과'?"style='color:#9263de'":'' }>이비인후과</a></div>
		</div>
		<hr>
		<c:forEach var="doc" items="${dlist}">
		<table>
			<tr>
				<td rowspan="2" class="info-img">
					<img src="/static/admin/doctor/${doc.doc_img }">
				</td>
				<td>
					<div style="font-size: 25px; font-weight: bold; padding-top: 10px;">
						${doc.doc_name} <span style="font-size: 15px;"> / ${doc.doc_part}</span>
					</div>
					<ul style="margin-top: 10px;">
						<c:forEach var="his" items="${doc.historys}">
							<li class="doc-li">${his}</li>
						</c:forEach>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="res_btn">
					<input type="button" onclick="location='../reserve?doc_id=${doc.doc_id}'" value="예약">
				</td>
			</tr>
		</table>
		<hr>
		</c:forEach>
	</section>
</body>
</html>
