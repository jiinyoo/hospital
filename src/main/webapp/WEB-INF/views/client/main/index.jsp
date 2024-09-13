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

 section {
      font-family: 'goorm-sans-bold';
      width:70%;
      height:360px;
      margin:auto;
      
      margin-bottom: 70px;
      border-radius: 30px;
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
        margin-top: 20px;
        margin-bottom: 20px;
        display: flex; /* 칸을 가로로 배치하기 위해 flexbox 사용 */
        justify-content: space-between; /* 각 칸 사이에 공간을 고르게 배치 */
    }

    section #community .comm {
    width: 32%; /* 3개의 칸이 고르게 배치되도록 설정 */
    height:200px;
    padding: 20px;
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
    margin-top: 30px;
    margin:auto;
    width:100%;
    background-color: #f9f9f9;
}

.icon-box {
	height:150px;
    text-align: center;
    width: 15%;
}

.icon-box img {
    width: 100%; /* 아이콘 크기 설정 */
    height: 150px;
    margin-bottom: 10px;
}

.icon-box p {
    margin: 0;
    font-size: 14px;
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
	
	function closereserve() {
		document.getElementById("reserve-container").style.display="none";
	}

	
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

<section>
<!-- 공지사항 및 학술행사 -->
	<div id="community">
        <!-- 공지사항 섹션 -->
		<div class="comm">
		
			<div class="title">
				공지사항
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
				학술행사
				<div class="more-btn" ><a href="#">더보기</a></div>
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
<div class="icon-section">
    <div class="icon-box">
        <img src="/static/client/main/진료조회.jpg" alt="진료조회">
        <p>진료조회</p>
    </div>
    <div class="icon-box">
        <img src="/static/client/main/조회.jpg" alt="검사이력 및 결과조회">
        <p>검사이력 및 결과조회</p>
    </div>
    <div class="icon-box">
        <img src="/static/client/main/오셔.jpg" alt="오시는 길">
        <p>오시는 길</p>
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
        <img src="/static/client/main/생활.jpg" alt="병원생활안내">
        <p>병원생활안내</p>
    </div>
    <div class="icon-box">
        <img src="/static/client/main/등록.jpg" alt="외부영상 CD등록">
        <p>외부영상 CD등록</p>
    </div>
</div>



지웬장~
<hr>
dd
<hr>
dd

</section>

</body>
</html>