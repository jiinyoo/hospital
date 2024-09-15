<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Program List</title>
<style>
input[type=button]
{
    width:100px;
    height:50px;
}

table td{
    border-spacing:0px;
    border:1px solid black;
}
</style>
</head>
<body>
<section>
<a href="/admin/program/programwrite"><input type="button" value="프로그램 등록"></a>

<!-- Ended Programs -->


<!-- Ongoing and Upcoming Programs -->
<h2>진행 중 및 진행 예정 프로그램</h2>
<table>
    <tr>
        <td width="100px">프로그램 이름</td>
        <td width="100px">강사</td>
        <td width="100px">파트</td>
        <td width="100px">프로그램 이미지</td>
        <td width="150px">시작일</td>
        <td width="150px">종료일</td>
        <td width="100px">해당요일</td>
        <td width="100px">일일 수용 인원</td>
        <td width="100px">삭제 및 수정</td>
        <td width="100px">진행/종료 여부</td>
        
    </tr>
    <c:forEach items="${plist}" var="pdto">
        <c:set var="end_date" value="${pdto.end_date}"/>
        <c:set var="start_date" value="${pdto.start_date}"/>
        <fmt:parseDate value="${end_date}" var="end_date" pattern="yyyy-MM-dd"/>
        <fmt:parseDate value="${start_date}" var="start_date" pattern="yyyy-MM-dd"/>
        <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" var="today"/>
        <fmt:parseDate value="${today}" var="today_date" pattern="yyyy-MM-dd"/>

        <c:choose>
            <c:when test="${start_date.before(today_date) && end_date.after(today_date)}">
                <tr>
                    <td>${pdto.pro_name}</td>
                    <td>${pdto.teach_name}</td>
                    <td>${pdto.pro_part}</td>
                    <td>
                        <img src="../../static/admin/programfile/${pdto.pro_img}" width="300px">
                    </td>
                    <td>${pdto.start_date}</td>
                    <td>${pdto.end_date}</td>
                    <td>${pdto.days_of_week}</td>
                    <td>${pdto.pro_inwon}</td>
                    
                    <td><a href="/admin/program/programdelete?pro_id=${pdto.pro_id}"><input type="button" value="삭제"></a>
                        <a href="/admin/program/programupdate?pro_id=${pdto.pro_id}"><input type="button" value="수정"></a>
                    </td>
                    <td>진행 중</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:if test="${start_date.after(today_date)}">
                    <tr>
                        <td>${pdto.pro_name}</td>
                        <td>${pdto.teach_name}</td>
                        <td>${pdto.pro_part}</td>
                        <td>
                            <img src="../../static/admin/programfile/${pdto.pro_img}" width="300px">
                        </td>
                        <td>${pdto.start_date}</td>
                        <td>${pdto.end_date}</td>
                        <td>${pdto.days_of_week}</td>
                        <td>${pdto.pro_inwon}</td>
                        <td><a href="/admin/program/programdelete?pro_id=${pdto.pro_id}"><input type="button" value="삭제"></a>
                            <a href="/admin/program/programupdate?pro_id=${pdto.pro_id}"><input type="button" value="수정"></a>
                        </td>
                        <td>진행 예정</td>
                    </tr>
                </c:if>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</table>

<h2>종료된 프로그램</h2>
<table>
    <tr>
        <td width="100px">프로그램 이름</td>
        <td width="100px">강사</td>
        <td width="100px">파트</td>
        <td width="100px">프로그램 이미지</td>
        <td width="150px">시작일</td>
        <td width="150px">종료일</td>
        <td width="100px">해당요일</td>
        <td width="100px">일일 수용 인원</td>
        <td width="100px">삭제 및 수정</td>
        <td width="100px">진행/종료 여부</td>
    </tr>
    <c:forEach items="${plist}" var="pdto">
        <c:set var="end_date" value="${pdto.end_date}"/>
        <c:set var="start_date" value="${pdto.start_date}"/>
        <fmt:parseDate value="${end_date}" var="end_date" pattern="yyyy-MM-dd"/>
        <fmt:parseDate value="${start_date}" var="start_date" pattern="yyyy-MM-dd"/>
        <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" var="today"/>
        <fmt:parseDate value="${today}" var="today_date" pattern="yyyy-MM-dd"/>

        <c:choose>
            <c:when test="${end_date.before(today_date)}">
                <tr>
                    <td>${pdto.pro_name}</td>
                    <td>${pdto.teach_name}</td>
                    <td>${pdto.pro_part}</td>
                    <td>
                        <img src="../../static/admin/programfile/${pdto.pro_img}" width="300px">
                    </td>
                    <td>${pdto.start_date}</td>
                    <td>${pdto.end_date}</td>
                    <td>${pdto.days_of_week}</td>
                    <td>${pdto.pro_inwon}</td>
                    <td><a href="/admin/program/programdelete?pro_id=${pdto.pro_id}"><input type="button" value="삭제"></a>
                        <a href="/admin/program/programupdate?pro_id=${pdto.pro_id}"><input type="button" value="수정"></a>
                    </td>
                    <td>종료</td>
                </tr>
            </c:when>
        </c:choose>
    </c:forEach>
</table>



</section>
</body>
</html>
