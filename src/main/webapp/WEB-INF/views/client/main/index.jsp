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

 section {
      font-family: 'GmarketSansMedium';
      width:100%;
      height:360px;
      margin:auto;
      
      margin-bottom: 150px;
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

지인쓰 바보
<hr>
dd
<hr>
dd
</body>
</html>