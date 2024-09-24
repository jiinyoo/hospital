<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장인호 청소년병원 관리자 페이지</title>
<style>
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	* {margin:0; padding:0; box-sizing: border-box;}
    body {
        font-family: 'GongGothicMedium';
        margin: 0;
        padding: 0;
    }
    .header {
    	font-family: 'GongGothicMedium';
        background-color: #5d62a5;
        color: white;
        text-align: center;
        padding: 15px 0;
        font-size: 44px;
    }
    .sub-header {
    	font-family: 'GongGothicMedium';
        background-color: #f1f1f1;
        padding: 20px 0;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    .sub-header a {
        margin: 0 24px;
        text-decoration: none;
        color: #333;
        font-size: 20px;
        transition: all 0.5s ease;
    }
    .sub-header a:hover {
    	color: #5a58e0;
        text-decoration: underline;
    }
    .container {
        display: flex;
    }
    .sidebar {
    	font-family: 'GongGothicMedium';
        width: 250px;
        background-color: #f8f8f8;
        padding: 10px;
        border-right: 1px solid #ddd;
        font-size:17px;
    }
    .sidebar ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    .sidebar ul ul {
    	line-height: 1.4;
        margin-left: 20px;
        margin-top: 8px;
    }
    .sidebar li {
    
        margin-bottom: 8px;
        margin-top: 4px;
    }
    .sidebar a {
        text-decoration: none;
        color: #333;
        transition: all 0.3s ease;
    }
    .sidebar a:hover {
        text-decoration: none;
        color: #5a58e0;
    }
    .sidebar li ul li {
        margin-bottom: 4px;
        margin-top: 4px;
    }
    .maincate {
    	cursor:pointer;
        display: block;
        background-color: #5d62a5; /* 배경색 */
        color: white; /* 글자색 */
        padding: 8px;
        border-radius: 6px;
        width: 100%; /* 사이드바 너비와 일치 */
        box-sizing: border-box; /* 패딩 포함하여 너비 계산 */
        text-decoration: none;
    }
    .maincate:hover {
        background-color: #7a7ebc; /* 호버 시 색상 변화 */
    }
    .content {
    	font-family: 'GongGothicMedium';
        flex: 1;
        padding: 20px;
        background-color: #ffffff;
    }
    .content h2 {
        margin-top: 0;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
 <sitemesh:write property="head"/>

</head>
<body>

<div class="header">
    장인호 병원 관리자 페이지
</div>

<div class="sub-header">
    <a href="/admin/main/index">관리자 페이지 메인</a>
    <a href="/main/index">운영 홈페이지 가기</a>
    <a href="/main/logout">로그아웃</a>
</div>

<div class="container">
    <div class="sidebar">
        <ul>
            <li><span class="maincate">병원 소개</span>
                <ul>
                    <li><a href="/admin/main/hospital">조직도</a></li>
                </ul>
            </li>
            <li><span class="maincate">의사 전용탭</span>
                <ul>
                    <li><a href="/admin/doctor/addDoctor">의사 정보 등록 / 수정</a></li>
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
            <li><span class="maincate">프로그램 관리</span>
                <ul>
                    <li><a href="/admin/program/program">프로그램 등록</a></li>
                    <li><a href="/admin/program/programreservemanage">프로그램 예약 관리</a></li>
                </ul>
            </li>
            <li><span class="maincate">커뮤니티 관리</span>
                <ul>
                    <li><a href="/admin/admin_notice/admin_notice_list">공지사항 관리</a></li>
                    <li><a href="/admin/inquiry/list">진료과별 게시판 관리</a></li>
                    <li><a href="/admin/board/list">진료 후기 게시판 관리</a></li>
                    <li><a href="#">고객의 소리 관리</a></li>
                </ul>
            </li>
            <li>
            	<a href="/admin/user/list"><span class="maincate">회원관리</span></a>
                <ul>
                    <li><a href="/admin/user/list"> 회원 관리 </a></li>
                </ul>
            </li>
        </ul>
    </div>
    
    
<sitemesh:write property="body"/>

    
</div>

</body>
</html>