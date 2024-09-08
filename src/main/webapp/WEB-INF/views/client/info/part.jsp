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
		margin: auto;
	}
	
	.info-header {
		margin-top: 30px;
		display: flex;
		justify-content: space-around;
		font-size: 20px;
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
		height: 100px;
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		transition: transform 0.3s ease, background-color 0.3s ease;
	}

	.info-header > div:hover {
		transform: scale(1.05);
	}

	table {
		
		width :100%;
		margin-top: 30px;
	}
	.info-img {
		text-align: center;
		width: 30%;
	}
	
	.info-img img {
		width: 180px;
		height: 280px;
	}
	
	.res_btn {
		vertical-align: bottom;
		text-align: right;
		border: none; /* 테두리 제거 */
		width: 100px;
		height: 50px;
		padding-right: 10px;
	}

	.res_btn > input {
		margin: 30px;
		margin-top: 0px;
		border: none;
		width: 90px;
		height: 40px;
		background-color: #007BFF; /* 배경색 */
		color: white; /* 글자색 */
		font-size: 16px;
		font-weight: bold;
		border-radius: 5px; /* 둥근 모서리 */
		cursor: pointer; /* 커서 변경 */
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
		transition: background-color 0.3s ease, transform 0.3s ease; /* 전환 효과 */
	}
	
	.res_btn > input:hover {
		background-color: #0056b3; /* 호버 시 배경색 변경 */
		transform: scale(1.05); /* 호버 시 크기 증가 */
	}
</style>
</head>
<body>
	<section>
		<div class="info-header">
			<div><a href="part?part=정신과" ${param.part=='정신과'?"style='color:#9263de'":'' }>정신과</a></div>
			<div><a href="part?part=내분비과" ${param.part=='내분비과'?"style='color:#9263de'":'' }>내분비과</a></div>
			<div><a href="part?part=치과" ${param.part=='치과'?"style='color:#9263de'":'' }>치과</a></div>
			<div><a href="part?part=이비인후과"${param.part=='이비인후과'?"style='color:#9263de'":'' }>이비인후과</a></div>
		</div>
		<hr>
		<c:forEach var="doc" items="${dlist}">
		<table>
			<tr>
				<td rowspan="2" class="info-img">
					<img src="/static/admin/programfile/${doc.doc_img }">
					<div><h2>${doc.doc_name }</h2>/${doc.doc_part }</div>
				</td>
				<td>
					<ul>
					<c:forEach var="his" items="${doc.historys}">
						<li>${his}</li>
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
		</c:forEach>
	</section>
</body>
</html>