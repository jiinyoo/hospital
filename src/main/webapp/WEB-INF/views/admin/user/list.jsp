<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
        }

        h2 {
        	width:10%;
            text-align: center;
            color: #007bff;
            margin-top: 40px;
            font-size: 24px;
        }

        .container {
            width: 100%;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative; /* 알림 메시지의 위치를 지정할 수 있도록 설정 */
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top:30px;
            margin-bottom: 30px;
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
    </style>
</head>
<body>

<div class="container">
    <h2>회원 관리</h2>

    <table>
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
                    <td>${mdto.user_id}</td>
                    <td>${mdto.user_name}</td>
                    <td>${mdto.user_email}</td>
                    <td>
                        <form method="post" action="updateState">
                            <input type="hidden" name="id" value="${mdto.id}">
                            <select name="state" class="status-select">
                                <option value="0" ${mdto.state==0 ? 'selected' : ''}>일반회원</option>
                                <option value="1" ${mdto.state==1 ? 'selected' : ''}>의사</option>  
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
</div>

</body>
</html>
