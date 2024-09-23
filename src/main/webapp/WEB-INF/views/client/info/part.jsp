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
		font-family: 'goorm-sans-bold';
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
	
	.part-intro {
		margin: 20px 0;
		font-size: 16px;
		color: #555;
		padding: 20px;
		border-left: 7px solid #007BFF;
		background-color: #eef2f5;
		border-radius: 8px;
	}

</style>
</head>
<body>
	<section>
		<div class="info-header">
			<div><a href="part?part=" ${empty param.part?"style='color:#007BFF'":''}>전체</a></div>
			<div><a href="part?part=정신과" ${param.part=='정신과'?"style='color:#007BFF'":'' }>정신과</a></div>
			<div><a href="part?part=내분비과" ${param.part=='내분비과'?"style='color:#007BFF'":'' }>내분비과</a></div>
			<div><a href="part?part=치과" ${param.part=='치과'?"style='color:#007BFF'":'' }>치과</a></div>
			<div><a href="part?part=이비인후과" ${param.part=='이비인후과'?"style='color:#007BFF'":'' }>이비인후과</a></div>
		</div>
		<hr>
		
		<div class="part-intro">
			<c:choose>
				<c:when test="${param.part == '정신과'}">
					정신과에서는 정신 건강 문제를 다루며, 우울증, 불안 장애, 스트레스 관리 등을 치료합니다. 환자 맞춤형 심리 치료와 약물 치료를 제공합니다.
				</c:when>
				<c:when test="${param.part == '내분비과'}">
					내분비과는 호르몬 문제와 관련된 질환을 치료합니다. 당뇨병, 갑상선 질환, 호르몬 불균형 등의 문제를 진단하고 관리합니다.
				</c:when>
				<c:when test="${param.part == '치과'}">
					치과는 구강 건강을 위한 진료를 제공하며, 치아 치료 및 치아 교정, 임플란트 시술 등을 담당합니다. 건강한 구강 관리에 도움을 줍니다.
				</c:when>
				<c:when test="${param.part == '이비인후과'}">
					이비인후과는 귀, 코, 목에 관련된 질환을 치료하며, 감염, 알레르기, 청력 문제 등 다양한 질환을 다룹니다.
				</c:when>
				<c:otherwise>
					환자분의 건강을 최우선으로 생각하며 최상의 의료 서비스를 제공합니다.
				</c:otherwise>
			</c:choose>
		</div>
		
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
