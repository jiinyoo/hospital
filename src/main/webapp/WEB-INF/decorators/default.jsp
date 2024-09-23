<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
@font-face 
{
    font-family: 'goorm-sans-bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/goorm-sans-bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}


body 
{
	display: flex;
    flex-direction: column;
    min-height: 100vh; /* Viewport의 전체 높이 설정 */
	font-family: 'goorm-sans-bold';
    background-color: #f2f4f9;
    margin: 0;
    padding: 0;
}

main {
    flex-grow: 1; /* 메인 콘텐츠가 푸터를 하단으로 밀어내도록 */
}

* {margin:0; padding:0; box-sizing: border-box;}

#ads
{
	position:relative;
	width:100%;
	height:50px;
	background:#8BBCFF;
	margin:auto;
}

#ad{
	margin:auto;
	width:100%;

}

#container
{
	position:relative;
	width:1300px;
	margin:auto;

}

#event
{
	position:absolute;
    text-align:center;
    right:580px;
    top: 15px;
    color: black;
}

#xx 
{
    position:absolute;
    right:0;
    text-align:right;
    top: 15px;
    color: black;
    cursor:pointer;

}

#loginbar
{	
	margin:auto;
	
	width:1300px;
	height:40px;
	text-align:right;
	align-content:center;
	color: black;
	cursor: pointer;
}

#loginbar > a 
{
	text-decoration: none;
	height:30px;
	color: black;
	
}
	
nav
{
 	position :relative;
 	width:1300px;
 	height:130px;
 	margin:auto;
 	font-size:20px;
}

nav #mainmenu
{
	width:1300px;
	height:130px;
	
}


#mainmenu #maincate > li 
{
	display:inline-block;
	list-style-type:none;
	width:210px;
	color:#626262;
	text-align:center;
	height:130px;
	line-height:100px;
	margin: 0; /* 기본 마진 제거 */
	padding: 0; /* 기본 패딩 제거 */
	position:relative;
	cursor: pointer;
	align-content: center;

}

#mainmenu #maincate > li >a
{
	width: 100%;
	text-decoration: none;
	color:#626262;
	display: block;
}

#mainmenu #maincate > li:hover
{
	color:#0073e6;
}

#mainmenu #maincate > li > a:hover
{
	color:#0073e6;
}

#maincate .logo img 
{
	padding-right:30px;
	width:240px;
	transition: all 0.3s ease;
}

#maincate .logo img:hover 
{
	transform: scale(1.1);
	background-color: none;
}

#maincate .hov 
{
    transition: all 0.5s ease;
       
}

#maincate .hov:hover 
{
	transform: scale(1.1);
    // background-color: #B5B2FF;
}


#submenus 
{
	display:flex;
	flex-wrap:wrap;
	text-align:center;
	
}

#submenus .submenu
{
	display:none;
	padding-left:0px;
	width:215px;
	left:0px;
	top:90px;
	background:white;
	border-left:0.5px solid #DAD9FF;
	border-right:0.5px solid #DAD9FF;
	border-bottom:5px solid #C8C7ED;
	opacity: 0;  
	
}

#submenus .submenu:nth-child(n) 
{
    animation: slideDown 0.3s ease forwards;
    animation-delay: 0s;
}



#submenus .submenu:first-child
{
	border-top:5px solid #C8C7ED;
	
}

#submenus .submenu:last-child
{
	width:200px;

}

#submenus .submenu > li
{
	list-style-type:none;
	justify-content: center;
	display:flex;
	width:215px;
	height:30px;
	line-height: 30px; /* 중앙 정렬 */
    margin: 0; /* 기본 마진 제거 */
    padding: 0; /* 기본 패딩 제거 */
	font-size: 15px;
	cursor: pointer;
    transition: all 0.3s ease;

}

#submenus .submenu > li > a {
  
    text-decoration: none;
    width: 100%;
    text-align: center;
    display: block;
    color: black;

}



#submenus .submenu > li:hover 
{
	background-color: #B5B2FF;
	
}

#submenus .submenu > li:first-child
{
	border-top:5px solid #C8C7ED;
	
}

#submenus .submenu:last-child > li
{
	width:200px;
	
}

#submenus .submenu > li > a 
{

    text-decoration: none;
    width: 100%;
    text-align: center;
    display: block;
    color:black;

}

/* 하위 메뉴 */
.dropdown {
    display: inline-block;
    position: relative;
}

.dropdown a {
    text-decoration: none;
    color: black;
}

#userMenu {
	right:0;
    display: none;
    top:20px;
    position: absolute;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    width: 150px;
    z-index: 11;
}

#userMenu a {
    display: block;
    padding: 15px;
    text-decoration: none;
    color: black;
    font-size: 16px;
    text-align:center;
    border-bottom: 1px solid #ddd;
}

#userMenu a:last-child {
    border-bottom: none;
}

#userMenu a:hover {
	text-decoration: none;
    background-color: white;
    color: #007bff;
}

/* 마우스를 올렸을 때 하위 메뉴 표시 */
.dropdown:hover #userMenu {
	text-decoration: none;
    display: block;
}

hr 
{
	border: 0;
	border-top: 2px solid #eee;
	margin-top: 20px 0;
}

/* 계단형으로 서서히 내려오는 애니메이션 정의 */
@keyframes slideDown 
{
    from 
    {
        opacity: 0;
        transform: translateY(-15px); /* 메뉴가 위에서부터 내려오는 느낌 */
    }
    to 
    {
        opacity: 1;
        transform: translateY(0); /* 제자리로 이동 */
    }
}


}


#user {
	position:relative;
	
}

#userdetail {
	position:absolute;
	left : 1388px;
	top:98px;
	background:white;
	border:1px solid #8BBCFF;
	display:none;
}

#userdetail > li {
	list-style-type:none;
	text-align:left;
}



</style>
<script>
	
	function viewSub()
	{
		var submenus=document.getElementsByClassName("submenu");
		for(submenu of submenus)
			{
				submenu.style.display="block";
			}
		
	}

	function hideSub()
	{
		//div영역을 생성하고 해야하나?
		var submenus=document.getElementsByClassName("submenu");
		for(submenu of submenus)
			{
				submenu.style.display="none";
			}
		
	}

	function adx(){
		
		var h=0;
		function move(){
			if(h<=50) {
				document.getElementById("ads").style.marginTop=-h+"px";
			
		}
		h++;
		
		if(h <= 50){
			setTimeout(move,15);
		} else
		{
			 document.getElementById("ads").style.display = "none";
			
		}
		
		}
		move();
	}
	
	
	function viewuser() {
		document.getElementById("userdetail").style.display="block";
	}
	
	
	function hideuser() {
		document.getElementById("userdetail").style.display="none";
	}
	
</script>

 <sitemesh:write property="head"/>

</head>



<body>
<div id="ads">
	<div id="ad">
		<div id="container"> 
			<div id="event"> 한번 입원하면 3박이 무료! </div>
		<div id="xx" onclick="adx()">닫기</div>
		</div>
	</div>
</div>


<header>
		<div id="loginbar"> 
		 <c:if test="${sessionScope.user_id == null }">
		  <a href="/main/login"> 로그인 </a>| 
		  <a href="/main/user"> 회원 가입 </a>
		 </c:if>
		 <c:if test="${sessionScope.user_id != null }">
		   <c:if test="${sessionScope.state==1 || sessionScope.state==2}">
		 	 <a href="/admin/main/index">관리자 페이지</a> |
		   </c:if>
		    <div class="dropdown">
                <a href="/main/userInfo">${sessionScope.user_id}님</a>
                <!-- 하위 메뉴 -->
                <div id="userMenu">
                    <a href="/main/userInfo">회원 정보</a>
                    <a href="/main/reserveView">예약 정보</a>
                    <a href="#">나의 문의</a>
                    <a href="#">진료 내역</a>
                </div>
            </div> | 
           <a href="/main/logout"> 로그아웃 </a> | 문의하기
         </c:if>
		</div>
</header>
<hr>

	<nav>
	<span id="total" onmouseout="hideSub()">
	<span id="mainsub">
	<div id="mainmenu" onmouseover="viewSub()">
		<ul id="maincate">
			<li class="logo">
			 <a href="/main/index">

			  <img src="/static/client/main/병원 로고7.png" valign="middle">

			 </a>
			</li>
			<li class="hov"><a href="/main/hospital">병원 소개</a></li>
			<li class="hov"><a href="/main/info/part?part=">의료진 안내</a></li>
			<li class="hov">상담/예약</li>
			<li class="hov"><a href="/main/programreserve">프로그램 예약</a></li>
			<li class="hov">커뮤니티</li>
			
		</ul>
	</div>
	
	<div id="submenus"  onmouseover="viewSub()">
		<ul class="submenu">
			
		</ul>
		
		<ul class="submenu">
			<li><a href="/main/hospital#menu1">병원 인삿말</a></li>
			<li><a href="/main/hospital#menu2">미션과 비전</a></li>
			<li><a href="/main/hospital#menu3">조직도</a></li>
			<li><a href="/main/hospital#menu4">오시는 길</a></li>
		</ul>
		
		<ul class="submenu">
			<li><a href="/main/info/part?part=정신과">정신과</a></li>
			<li><a href="/main/info/part?part=내분비과">내분비과</a></li>
		    <li><a href="/main/info/part?part=치과">치과</a></li>
		    <li><a href="/main/info/part?part=이비인후과">이비인후과</a></li>
		</ul>
		
		<ul class="submenu">
			<li>1:1문의</li>
			<li><a href="/main/reserve">온라인 진료 예약</a></li>
			<li><a href="/main/reserveView">예약 조회</a></li>
		</ul>
		<ul class="submenu">
			<li><a href="/main/programreserve">프로그램 예약</a></li>
			<li><a href="/main/memberpreserve">프로그램 예약 조회</a></li>
		</ul>
		<ul class="submenu">
				<li><a href="/main/notice_list">공지사항</a></li>
				<li><a href="../../main/inquirylist">진료과별 질문</a></li>
				<li><a href="../../main/boardlist">진료 후기</a></li>
				<li><a href="/main/healthInfo">건강정보</a></li>
		</ul>
	</div>
	</span>
	</span>
	</nav>
	<hr>

	</div>

<main>
	<div class="haha">
		<!-- 여기에 페이지의 메인 콘텐츠가 들어갑니다. -->
	</div>
</main>

<sitemesh:write property="body"/>



<footer style="background-color: #368AFF; padding: 50px 0; color: white; margin-top: 40px; font-family: 'goorm-sans-bold';">
    <div class="footer-container" style="width: 80%; margin: auto; display: flex; justify-content: space-between; align-items: flex-start; flex-wrap: wrap;">
        
        <div style="width: 30%;">
            <h4 style="margin-bottom: 20px; font-size: 24px;">병원 소개</h4>
            <p style="line-height: 1.8; font-size: 15px;">저희 병원은 최상의 의료 서비스를 제공하며 환자분들의 건강을 최우선으로 생각합니다. 믿을 수 있는 의료진과 함께 건강한 삶을 위한 최선을 다하고 있습니다.</p>
        </div>
        
        <div style="width: 30%;">
            <h4 style="margin-bottom: 20px; font-size: 24px; margin-left:40px;">빠른 링크</h4>
            <ul style="list-style-type: none; padding: 0; line-height: 2; margin-left:40px;">
                <li><a href="#" style="color: white; text-decoration: none; font-size: 15px;">병원 소개</a></li>
                <li><a href="/main/beforeReserve" style="color: white; text-decoration: none; font-size: 15px;">진료 예약</a></li>
                <li><a href="#" style="color: white; text-decoration: none; font-size: 15px;">연락처 : 010-1234-5678</a></li>
                <li><a href="#" style="color: white; text-decoration: none; font-size: 15px;">자주 묻는 질문</a></li>
            </ul>
        </div>

        <div style="width: 30%;">
            <h4 style="margin-bottom: 20px; font-size: 24px;">연락처</h4>
            <p style="line-height: 1.8; font-size: 15px;"><strong>전화:</strong> 031-123-4567</p>
            <p style="line-height: 1.8; font-size: 15px;"><strong>이메일:</strong> JangINHO@hospital.com</p>
            <p style="line-height: 1.8; font-size: 15px;"><strong>주소:</strong> 경기 고양시 마두동 병원로 123</p>
        </div>
    </div>

    <div style="width: 80%; margin: 30px auto; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap;">

        <div>
            <a href="#" style="text-decoration: none; color: white; margin-right: 15px;">
                <i class="fab fa-facebook" style="font-size: 24px;"></i>
            </a>
            <a href="#" style="text-decoration: none; color: white; margin-right: 15px;">
                <i class="fab fa-twitter" style="font-size: 24px;"></i>
            </a>
            <a href="#" style="text-decoration: none; color: white; margin-right: 15px;">
                <i class="fab fa-instagram" style="font-size: 24px;"></i>
            </a>
        </div>

        <div style="text-align: center; margin-top: 10px;">
            <p>&copy; 2024 장인호 병원입니다. 최선을 다하겠습니다.</p>
        </div>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>




</body>
</html>