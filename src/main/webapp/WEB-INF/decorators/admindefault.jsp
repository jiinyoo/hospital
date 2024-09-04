<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장인호 청소년병원 관리자 페이지</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .header {
        background-color: #5d62a5;
        color: white;
        text-align: center;
        padding: 15px 0;
        font-size: 24px;
    }
    .sub-header {
        background-color: #f1f1f1;
        padding: 10px 0;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    .sub-header a {
        margin: 0 15px;
        text-decoration: none;
        color: #333;
        font-size: 18px;
    }
    .sub-header a:hover {
        text-decoration: underline;
    }
    .container {
        display: flex;
    }
    .sidebar {
        width: 250px;
        background-color: #f8f8f8;
        padding: 10px;
        border-right: 1px solid #ddd;
    }
    .sidebar ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    .sidebar ul ul {
        margin-left: 20px;
    }
    .sidebar li {
        margin-bottom: 8px;
    }
    .sidebar a {
        text-decoration: none;
        color: #333;
    }
    .sidebar li ul li {
        margin-bottom: 4px;
    }
    .maincate {
        display: block;
        background-color: #5d62a5; /* 배경색 */
        color: white; /* 글자색 */
        padding: 8px;
        border-radius: 4px;
        width: 100%; /* 사이드바 너비와 일치 */
        box-sizing: border-box; /* 패딩 포함하여 너비 계산 */
    }
    .maincate:hover {
        background-color: #7a7ebc; /* 호버 시 색상 변화 */
    }
    .content {
        flex: 1;
        padding: 20px;
        background-color: #ffffff;
    }
    .content h2 {
        margin-top: 0;
    }
</style>

 <sitemesh:write property="head"/>

</head>
<body>

<div class="header">
    장인호 병원 관리자 페이지
</div>

<div class="sub-header">
    <a href="#">관리자 페이지 메인</a>
    <a href="/main/index">운영 홈페이지 가기</a>
    <a href="/login/logout">관리자 로그아웃</a>
</div>

<div class="container">
    <div class="sidebar">
        <ul>
            <li><span class="maincate">병원 소개</span>
                <ul>
                    <li><a href="#">조직도</a></li>
                </ul>
            </li>
            <li><span class="maincate">의사 전용탭</span>
                <ul>
                    <li><a href="/admin/doctor/addDoctor">의사 정보 등록</a></li>
                    <li><a href="/admin/medical/patient">환자진료</a></li>
                    <li><a href="/admin/medical/afterMedi">진료 기록 조회</a></li>
                </ul>
            </li>
            <li><span class="maincate"><a href="/admin/doctor/doctor?doc_part=">진료과 소개</a></span>
                <ul>
                    <li><a href="/admin/doctor/doctor?doc_part=정신과">정신과</a></li>
                    <li><a href="/admin/doctor/doctor?doc_part=내분비과">내분비과</a></li>
                    <li><a href="/admin/doctor/doctor?doc_part=치과">치과</a></li>
                    <li><a href="/admin/doctor/doctor?doc_part=이비인후과">이비인후과</a></li>
                </ul>
            </li>
            <li><span class="maincate">상담/예약/진료</span>
                <ul>
                    <li><a href="#">1:1 문의 관리</a></li>
                    <li><a href="#">진료 예약 관리</a></li>
                 
                </ul>
            </li>
            <li><span class="maincate">프로그램 관리</span>
                <ul>
                    <li><a href="/admin/program/program">프로그램 등록</a></li>
                    <li><a href="#">프로그램 예약 관리</a></li>
                </ul>
            </li>
            <li><span class="maincate">커뮤니티 관리</span>
                <ul>
                    <li><a href="#">공지사항 관리</a></li>
                    <li><a href="#">진료과별 게시판 관리</a></li>
                    <li><a href="#">진료 후기 게시판 관리</a></li>
                    <li><a href="#">고객의 소리 관리</a></li>
                </ul>
            </li>
            <li><a href="#"><span class="maincate">
            
            
            			회원관리
            
            
            
            </span></a></li>
        </ul>
    </div>
    
    
<sitemesh:write property="body"/>

    
</div>

</body>
</html>