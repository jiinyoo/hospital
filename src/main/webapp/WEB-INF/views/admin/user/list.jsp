<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
		body, h2, table, input, button, select {
            font-family: 'Noto Sans', sans-serif; /* Google Fonts에서 가져온 폰트 적용 */
        }

        h2 {
        	width:100%;
            text-align: center;
            color: #004fa8;
            margin-top: 40px;
            font-size: 28px;
        }

        .contain {
            width: 100%;
            margin: 0 auto;
            background-color: #ffffff;
            border-collapse: collapse;
        }

        table {
        width: 80%;
		border-collapse: collapse;
        margin: 0 auto;
        
    }
    
    #name {
    	width:80px;
    }
    
    #email {
    	width:220px;
    }
    
	#status {
		width: 70px;
	}
	
	td {
		border-bottom: 1px solid #ccc;

	}

    th, td {
        padding: 6px;
        text-align: center;
    }

    th {
    	background: #f9f9f9 url(/static/client/notice/divide_line.png) no-repeat 0 center;
    	width:150px;
    	border-top:1px solid black;
    	border-bottom: 1px solid #ccc;
    }

        .status-select {
        	font-family: 'GongGothicMedium';
            width: 100%;
            padding: 5px;
            font-size: 14px;
        }

        .button {
        	width:30%;
        	font-family: 'GongGothicMedium';
            padding: 7px ;
            background-color: #004fa8;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 15px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #033D7F;
        }
        
        #search {
        	font-family: 'GongGothicMedium';
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
        	font-family: 'GongGothicMedium';
            padding: 10px 20px;
            background-color: #004fa8;
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
            background-color: #004fa8;
            color: white;
            margin: 0 2px;
            border-radius: 4px;
            text-decoration: none;
        }

        .page a:hover {
            background-color: #033D7F;
        }

        .page .current-page {
            background-color: #033D7F;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        
    </style>
</head>
<body>

<div class="contain">

    <h2>회원 관리</h2>
	<br>
    <table align="center">
        <thead>
            <tr>
                <th>아이디</th>
                <th id="name">이름</th>
                <th id="email">이메일</th>
                <th id="status">상태</th>
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
                            <input type="hidden" name="user_id" value="${mdto.user_id}">
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
    <br><br>
   <div class="search-form">
    <form method="get" action="list">
        <input id="search" type="text" name="search" value="${search}" placeholder="아이디, 이름 검색">
        <button type="submit">검색</button>
    </form>
   </div> 
   <br>
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
