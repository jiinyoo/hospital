<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	section {
    margin: 50px auto;
    width: 900px;
    padding: 40px;
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

h3 {
    text-align: center;
    color: #004fa8;
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 40px;
    letter-spacing: 1px;
}

table {
    width: 100%;
    margin-bottom: 40px;
    border-collapse: separate;
    border-spacing: 0 15px;
}

th, td {
    padding: 10px;
    font-size: 18px;
    line-height: 1.6;
}

th {
    width: 15%;
    text-align: center;
    background: #e9ecef;
    color: #495057;
    border-radius: 5px 0 0 5px;
    border: 1px solid #dee2e6;
    font-weight: bold;
}

td {
    background: #f8f9fa;
    color: #343a40;
    border-radius: 0 5px 5px 0;
    border: 1px solid #dee2e6;
}

#borcont {
    background: #f8f9fa;
    padding: 20px;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    line-height: 1.8;
    color: #495057;
}

.buttons {
    text-align: center;
    margin-top: 30px;
}

.buttons a {
    display: inline-block;
    padding: 12px 30px;
    margin: 10px;
    background-color: #2d6a4f;
    color: #ffffff;
    border-radius: 30px;
    text-decoration: none;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.buttons a:hover {
    background-color: #1b4332;
}

#del {
    background-color: #e63946;
}

#del:hover {
    background-color: #d62828;
}

</style>
<script>
function deletecheck(boardid, userid) {
	if(confirm("정말로 삭제하시겠습니까?")) {
		location="/main/boarddelete?board_id="+boardid+"&user_id="+userid;
	}	
}


</script>
</head>
<body>
<section>
	<h3>진료 후기</h3>
	<table>
		<tr>
			<th>제목</th>
			<td>${bdto.board_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bdto.user_id}</td>
		</tr>
		<tr>
			<th >내용</th>

			<td id="borcont" >${bdto.board_content}</td>
		</tr>
	</table>	
			<div class="buttons" align="center">
				<c:if test="${user_id==bdto.user_id}">
					<a href="/main/boardlist"> 목록 </a>
					<a href="/main/boardupdate?board_id=${bdto.board_id}&user_id=${bdto.user_id}">수정</a>
					<a id="del" href="javascript:deletecheck('${bdto.board_id}','${bdto.user_id }')">삭제</a>
				</c:if>
			</div>


</section>
</body>
</html>