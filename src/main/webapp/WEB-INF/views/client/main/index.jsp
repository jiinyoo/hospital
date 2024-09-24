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

* {margin:0; padding:0; box-sizing: border-box;}

	body
	{
		background: url('/static/client/main/패턴.avif') no-repeat center center; /* 이미지 경로 설정 */
    background-size: cover;
	}
 section {
      font-family: 'goorm-sans-bold';
      width:70%;
      height:180px;
      margin:auto;
      margin-bottom: 10px;
      
      /*box-shadow: 0 0 40px rgba(0, 0, 0, 0.2);*/
   }

#slideouter{
 	width:100%;
 	magin:auto;
 	/*background:pink;*/
 	overflow:hidden;
}


#inner{	
	width:300%;
}
/* #inner:after {display:block; content:''; clear:both} */
#inner .slide_item {
	float: left;
	width:calc(100% / 3);
}
.slideimgs{
	width:100%;
}

section #community {
        width: 1330px;
        margin: auto;
        text-align: center;
        margin-top: 230px;
        margin-bottom: 20px;
        display: flex; /* 칸을 가로로 배치하기 위해 flexbox 사용 */
        justify-content: space-between; /* 각 칸 사이에 공간을 고르게 배치 */
    }

    section #community .comm {
    width: 32%; /* 3개의 칸이 고르게 배치되도록 설정 */
    height:200px;
    padding: 20px;
    background-color:#FDFFFF;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 테두리 없이 그림자만 추가 */
    text-align: left;
}

section #community .comm .title {
    font-size: 20px;
    font-weight: bold;
    color: black;
    margin-bottom: 20px;
}

section #community .comm .notice-list {
    list-style-type: none;
    padding: 0;
    
}

section #community .comm .notice-list li {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    border-bottom: 1px solid #eaeaea;
    font-size: 14px;
    
}

section #community .comm .notice-list li a {
    text-decoration: none;
    color: #0073e6;
    font-weight: normal;

}

section #community .comm .notice-list li a:hover {
    text-decoration: underline;
}

section #community .comm .notice-date {
    color: #999;
    font-size: 14px;
}

section #community .comm .more-btn {
    text-align: right;
    margin-top: -18px;
    font-size: 16px;
}

section #community .comm .more-btn a {
    text-decoration: none;
    color: #0073e6;
    font-weight: bold;
}

section #community .comm .more-btn a:hover {
    text-decoration: underline;
}

.icon-section {
    display: flex;
    justify-content: space-around;
    margin: auto;
    margin-top:270px;
    width: 75%;
    background-color: #ffffff; /* 배경을 깔끔한 흰색으로 설정 */
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 부드러운 그림자로 더 깔끔한 느낌 */
    
}

.icon-box {
    text-align: center;
    width: 13%; /* 아이콘 상자의 너비를 줄여서 간격을 더 촘촘하게 */
    padding: 20px; /* 상자 내부의 여백을 추가해서 간격을 확보 */
    cursor:pointer;
    transition: all 0.3s ease;
}

.icon-box:hover {
	transform: scale(1.1);
}

.icon-box img {
    width: 100%; /* 아이콘 크기를 통일 */
    height: 100px;
    margin-bottom: 12px; /* 아이콘과 텍스트 사이의 간격 */
}

.icon-box p {
    margin: 0;
    font-size: 16px;
    color: #333;
    background-color: transparent; /* 텍스트 배경을 투명하게 설정 */
}

/* 배너를 화면 오른쪽에 고정 */
#floating-banner {
    position: absolute;
    top: 223px; /* 화면 상단에서의 위치 */
    right: 50px; /* 화면 오른쪽에서의 위치 */
    width: 200px; /* 배너 너비 */
    z-index: 10; /* 다른 요소 위에 표시 */
    transition: top 0.6s ease-in-out; /* 부드러운 스크롤 애니메이션 */
}

#floating-banner img {
    width: 100%; /* 이미지 크기 조정 */
    border-radius: 17px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* 배너에 그림자 추가 */
}

.card {
    width: 285px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 5px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    margin: 20px;
  }

  .card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
  }

  .card-body {
    padding: 15px;
  }

  .card-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
  }

  .card-text {
    font-size: 14px;
    color: #555;
  }
  
  #pro-container {
  	background: url('/static/client/main/pattern4.jpg') no-repeat center center; /* 이미지 경로 설정 */
    background-size: cover; /* 섹션 크기에 맞춰 이미지가 자동 조정됨 */
  	width:100%;
  	padding-bottom:20px;
  	margin:60px 0;
  	box-shadow: 0 0px 20px rgba(0, 0, 0.1, 0.2);
  }

#protitle {
	margin:auto;
	padding:30px;
}
  


#programs .card {
	transition: all 0.3s ease;
	display:inline-block;
	margin-bottom:20px;
	background: white;

}

#programs .card:hover {
	transform: scale(1.04);
	display:inline-block;

}

#programs .card a {
	
	text-decoration: none;
	color:black;

}

#hosnotice {
	text-decoration: none;
	color: #333;
}
  
</style>
<script>
	$(function(){

		setInterval(function(){
		
			$("#inner").animate({
				marginLeft:"-100%"
			},2000,function(){
				$(".slide_item").eq(0).insertAfter($(".slide_item").eq(2))
				$("#inner").css("margin-left","0px");
			});
		},4000);
		
	});
	
	function closereserve() 
	{
		document.getElementById("reserve-container").style.display="none";
	}

	window.addEventListener('scroll', function() 
	{
	    var banner=document.getElementById('floating-banner');
	    var targetY=window.scrollY+223;  // 스크롤 위치에서 100px 아래로 배너가 이동
	    banner.style.top=targetY+ 'px';   // 배너 위치 설정
	});

	
</script>
</head>
<body>
<!-- section을 기준으로 body에 들어갈 모든 내용을 규정해야함 -->
<section>
	<div id="slideouter">
		<div id="inner">
			<div class="slide_item"><img class="slideimgs" src="/static/client/main/1.jpg"></div>
			<div class="slide_item"><img class="slideimgs" src="/static/client/main/2.jpg"></div>
			<div class="slide_item"><img class="slideimgs" src="/static/client/main/3.jpg"></div>
		</div>
	</div>
</section>

<!-- 치과 배너 추가 -->
<div id="floating-banner">
    <img src="/static/client/main/병원 배너.png" alt="치과 배너">
</div>

<br>
<section>
<!-- 공지사항 및 학술행사 -->
	<div id="community">
        <!-- 공지사항 섹션 -->
		<div class="comm">
		
			<div class="title">
				공지 사항
				<div class="more-btn"><a href="/main/notice_list">더보기</a></div>
			</div>
		
		<c:if test="${empty nmapAll}">
		<p> 공지사항이 없습니다 </p>
		</c:if>
			<ul class="notice-list">
			
				<c:forEach items="${nmapAll}" var="ndto" begin="0" end="2">
					<li>
						<a href="notice_readnum?notice_id=${ndto.notice_id}">${ndto.title}</a>
						<span class="notice-date">${ndto.writeday}</span>
					</li>
				</c:forEach>
				
			</ul>
		
		
		</div>
		
		<!-- 학술행사 칸 -->
		<div class="comm">
			<div class="title">
				학술 행사
			</div>
			
			<ul class="notice-list">
				<li>
					<a href="#">SPC Webinar: BUN/Cr 수치 상승 고려 사항</a>
					<span class="notice-date">2024.08.26</span>
				</li>
				<li>
					<a href="#">의료인을 위한 온라인 강의</a>
					<span class="notice-date">2024.08.20</span>
				</li>
				<li>
					<a href="#">건강한 생각을 하기위한 준비자세</a>
					<span class="notice-date">2024.08.15</span>
				</li>
			</ul>
			
		</div>

		<!-- 추가적인 빈 섹션 -->
		<div class="comm">
			<div class="title">
				병원 이용 시간
			</div>
			<!-- 원하는 내용을 여기에 추가 -->
			<br>
			<div class="section-info">
				<p><strong>평일:</strong> 9:00 AM - 6:00 PM</p>
				<br>
				<p><strong>공휴일/주말:</strong> 9:00 AM - 3:00 PM</p>
			</div>
		</div>
    
</div>


</section>
<br>
<div class="icon-section">
    <div class="icon-box">
      <a id="hosnotice" href="/main/reserveView">
        <img src="/static/client/main/진료조회.jpg" alt="진료조회">
        <p>진료조회</p>
      </a>
    </div>
    <div class="icon-box">
        <img src="/static/client/main/조회.jpg" alt="검사이력 및 결과조회">
        <p>검사이력 및 결과조회</p>
    </div>
    <div class="icon-box">
      <a id="hosnotice" href="/main/hospital#menu4">
        <img src="/static/client/main/오셔.jpg" alt="오시는 길">
        <p>오시는 길</p>
      </a>
    </div>
    <div class="icon-box">
        <img src="/static/client/main/주차.jpg" alt="주차안내">
        <p>주차안내</p>
    </div>
    <div class="icon-box">
        <img src="/static/client/main/위치.jpg" alt="원내위치안내">
        <p>원내위치안내</p>
    </div>
    <div class="icon-box">
      <a id="hosnotice" href="/main/notice_content?notice_id=2">
        <img src="/static/client/main/생활.jpg" alt="병원생활안내">
        <p>병원생활안내</p>
      </a>
    </div>
    <div class="icon-box">
        <img src="/static/client/main/등록.jpg" alt="외부영상 CD등록">
        <p>외부영상 CD등록</p>
    </div>
</div>




<div align="center">

 <div id="pro-container">
 <div id="protitle" style="color:#0073e6; font-size:30px; margin-top:40px;">프로그램 현황</div>
  <div id="programs" style="margin-top:20px;">
	<c:forEach items="${programmap}" var="pdto" begin="0" end="3">
	
	<div class="card">
	<a href="/main/programreserve">
    	<img src="/static/admin/programfile/${pdto.pro_img}" alt="Card Image">
   		 <div class="card-body">
     	 <div class="card-title">${pdto.pro_name}</div>
      	 <div class="card-text">강사 : ${pdto.teach_name}</div>
      	</div>
     </a> 	
    </div>
	
    
	</c:forEach>

  </div>
  
 </div>

</div>
<br>
</body>
</html>