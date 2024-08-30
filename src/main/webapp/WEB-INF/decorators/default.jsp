<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>


* {margin:0; padding:0; box-sizing: border-box;}

#ads{
	position:relative;
	width:100%;
	height:150px;
	background:blue;
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

#xx {
    position:absolute;
    right:0;
    width: 1300px;
    text-align:right;
    top: 130px;
    color: white;
    cursor:pointer;
}


#loginbar{
	
	margin:auto;
	width:1300px;
	height:50px;
	text-align:right;
	align-items:center;

}

nav{
 position :relative;
 width:1300px;
 height:80px;
 background:pink;
 margin:auto;
}

nav #mainmenu{
	width:1300px;
}



nav #mainmenu #maincate
{
	padding-left:0px;
	
}

#mainmenu #maincate > li {
	display:inline-block;
	list-style-type:none;
	width:180px;
	text-align:center;
	height:80px;
	line-height:80px;
	margin: 0; /* 기본 마진 제거 */
	padding: 0; /* 기본 패딩 제거 */
	position:relative;
}


#submenus {
	display:flex;
	flex-wrap:wrap;

}



#submenus .submenu
{
	display:flex;
	flex-direction:column;
	padding-left:0px;
	width:180px;
	left:0px;
	top:90px;
	background:white;
	border:1px solid green;

}

#submenus .submenu > li
{
	list-style-type:none;
	display:flex;
	width:180px;
	height:30px;
	line-height: 30px; /* 중앙 정렬 */
    margin: 0; /* 기본 마진 제거 */
    padding: 0; /* 기본 패딩 제거 */
	font-size: 14px;
}


</style>
<script>
	
	
	function viewSub()
	{
		var submenus=document.getElementsByClassName("submenu");
		for(submenu of submenus)
			{
				submenu.style.visibility="visible";
			}
	}
	
	
	function hideSub()
	{
		//div영역을 생성하고 해야하나?
		
	}
	

	function adx(){
		
		var h=0;
		function move(){
			if(h<=150)
				document.getElementById("ad").style.marginTop=-h+"px";
			h++;
			setTimeout(move,5);
		}
		move();
	}
	
</script>

 <sitemesh:write property="head"/>

</head>
<body>
<div id="ads">
	<div id="ad">
		<div id="container">
		<div id="xx" onclick="adx()">닫기</div>
		</div>
	</div>
</div>
<header>
		<div id="loginbar"> 
		  <a href="/main/login"> 로그인 </a>| 
		  <a href="/main/user"> 회원 가입 </a>
		</div>
</header>
<hr>
<nav>
<div id="mainmenu">
	<ul id="maincate">
		<li><img src="../static/client/main/병원 로고.jpg" width="30"></li>
		<li>병원 소개</li>
		<li>의료진 안내</li>
		<li>상담/예약</li>
		<li>프로그램 예약</li>
		<li>커뮤니티</li>
		<li>건강 용품 샵</li>
	</ul>
</div>

<div id="submenus">
	<ul class="submenu">
	</ul>
	
	<ul class="submenu">
		<li>병원 인삿말</li>
		<li>미션과 비전</li>
		<li>조직도</li>
		<li>오시는 길</li>
	</ul>
	
	<ul class="submenu">
		<li>정신과</li>
		<li>내분비과</li>
	    <li>치과</li>
	    <li>이비인후과</li>
	</ul>
	
	<ul class="submenu">
		<li>1:1문의</li>
		<li>온라인 진료 예약</li>
		<li>예약 조회</li>
	</ul>
	
	<ul class="submenu">
	
		<li>프로그램 예약</li>
	
	</ul>
	
	
	<ul class="submenu">
			<li>공지사항</li>
			<li>진료과별 질문</li>
			<li>진료 후기</li>
			<li>고객의 소리</li>
	</ul>
	
	
	<ul class="submenu">
	
	</ul>
	

</div>


</nav>
<hr>

<sitemesh:write property="body"/>


<footer>

</footer>


</body>
</html>