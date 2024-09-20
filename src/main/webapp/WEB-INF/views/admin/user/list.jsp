<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <style>
        body {
            font-family: 'goorm-sans-bold';
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
        }

        h2 {
        	width:100%;
            text-align: center;
            color: #007bff;
            margin-top: 40px;
            font-size: 28px;
        }

        .contain {
            width: 100%;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            margin:20px;
            border-collapse: collapse;
            margin-top:30px;
            margin-bottom: 50px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .status-select {
            width: 100%;
            padding: 5px;
            font-size: 14px;
        }

        .button {
            padding: 6px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 14px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #0056b3;
        }
        
        .search-form {
        	text-align:center;
        }
        
        .search-form input[type="text"] {
            padding: 10px;
            width: 300px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .search-form button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
        }

        /* 페이지 네비게이션 중앙 정렬 */
        .page {
            text-align: center;
            margin: 20px 0;
        }

        .page a {
            display: inline-block;
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            margin: 0 2px;
            border-radius: 4px;
            text-decoration: none;
        }

        .page a:hover {
            background-color: #0056b3;
        }

        .page .current-page {
            background-color: #0056b3;
            color: white;
            font-weight: bold;
        }
        
    </style>
</head>
<body>

<div class="contain">

    <h2>회원 관리</h2>
		
    <table align="center">
        <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
                <th>상태</th>
                <th>변경</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="mdto" items="${mdto}">
                <tr>
             
                    <td>
                    	${mdto.user_id}
                    </td>
                    
                    <td>
                    	${mdto.user_name}
                    </td>
                    
                    <td>
                    	${mdto.user_email}
                    </td>
                    
                    <td>
                        <form method="post" action="updateState">
                            <input type="hidden" name="id" value="${mdto.id}">
                            <select name="state" class="status-select">
                                <option value="0" ${mdto.state==0 ? 'selected' : ''}>일반회원</option>
                                <option value="1" ${mdto.state==1 ? 'selected' : ''}>의사</option>  
                                <option value="2" ${mdto.state==2 ? 'selected' : ''}>관리자</option>
                                <option value="3" ${mdto.state==3 ? 'selected' : ''}>휴면계정</option>
                                <option value="4" ${mdto.state==4 ? 'selected' : ''}>정지계정</option>
                            </select>
                    </td>
                    
                    <td>
                            <button type="submit" class="button">변경</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
   <div class="search-form">
    <form method="get" action="list">
        <input type="text" name="search" value="${search}" placeholder="아이디, 이름 검색">
        <button type="submit">검색</button>
    </form>
   </div> 
    <div class="page">
        <c:if test="${page>1}">
            <a href="list?page=${page-1}&search=${search}">이전</a>
        </c:if>

        <c:forEach var="i" begin="1" end="${totalPage}">
            <c:if test="${i==page}">
                <a class="current-page">${i}</a>
            </c:if>
            <c:if test="${i!=page}">
                <a href="list?page=${i}&search=${search}">${i}</a>
            </c:if>
        </c:forEach>

        <c:if test="${page<totalPage}">
            <a href="list?page=${page+1}&search=${search}">다음</a>
        </c:if>
    </div>
    
</div>

</body>
</html>
