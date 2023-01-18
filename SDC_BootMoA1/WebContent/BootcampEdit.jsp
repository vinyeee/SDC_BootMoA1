<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.ReviewVO,bootcamp.BootcampVO,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootCamp Review App</title>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDy81EbO46BRSnX1DOgg_F84bhsdbku2z4"></script>
<style type="text/css">
	@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
    
}
	
	* {
	font-family:'SUIT-Regular';
	
	}
	
	header {
		width : 850px;
		height : 100px;
		margin:auto;
	}
	
	nav{
		margin-right:0px;
		position:relative;
		left:600px;
	}
	
	#section1 {
		margin:auto;
		width:880px;
	}
	
	#section2,#section3 {
	
		border-color:#B9B5B5;
		border-width:3px;
		border-style:solid;
		margin:20px auto;
		width:830px; 
		border-radius:10px;
		
	}
	

	
	article{
		margin : 20px;
	}

	.login{
		box-shadow:inset 0px -3px 7px -36px #29bbff;
		background:linear-gradient(to bottom, #95cff0 5%, #058fff 100%);
		background-color:#95cff0;
		border-radius:3px;
		border:1px solid #0b0e07;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		padding:4px 18px;
		text-decoration:none;
		text-shadow:0px 0px 0px #365dd1;
	
	}
	
	.login:hover {
		background:linear-gradient(to bottom, #058fff 5%, #95cff0 100%);
		background-color:#058fff;
	}
	.login:active {
		position:relative;
		top:1px;
	}
	
	.BtnReview {
		box-shadow:inset 0px -3px 7px -36px #29bbff;
		background:linear-gradient(to bottom, #95cff0 5%, #058fff 100%);
		background-color:#95cff0;
		border-radius:3px;
		border:1px solid #0b0e07;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		padding:10px 30px;
		text-decoration:none;
		text-shadow:0px 0px 0px #365dd1;
		margin-left:298px;
	}
	.BtnCampEdit {
		box-shadow:inset 0px -3px 7px -36px #29bbff;
		background:linear-gradient(to bottom, #95cff0 5%, #058fff 100%);
		background-color:#95cff0;
		border-radius:3px;
		border:1px solid #0b0e07;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		padding:10px 30px;
		text-decoration:none;
		text-shadow:0px 0px 0px #365dd1;
		margin-left:298px;
	}
	.BtnCampDelete {
		box-shadow:inset 0px -3px 7px -36px #29bbff;
		background:linear-gradient(to bottom, #95cff0 5%, #058fff 100%);
		background-color:#95cff0;
		border-radius:3px;
		border:1px solid #0b0e07;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		padding:10px 30px;
		text-decoration:none;
		text-shadow:0px 0px 0px #365dd1;
		margin-left:298px;
	}
	.BtnInsertReview:hover {
		background:linear-gradient(to bottom, #058fff 5%, #95cff0 100%);
		background-color:#058fff;
	}
	.BtnInsertReview:active {
		position:relative;
		top:1px;
	}
	
	#academyLogo{
		border:3px solid #B9B5B5;
		position:absolute;
		z-index:2;
		bottom:0px;
		left:20px;
		border-radius:10px;
	}
	
	#bootLogo{
		position:absolute;
		z-index:1;
		border-radius:10px;
	}
	
	#aname{
		position:absolute;
		z-index:2;
		left:150px;
		bottom:0px;
		background-color:#AFB8BB;
		border-radius:5px;
		padding:5px;
		margin:0px;
		
	}
	
	#logoBox{
	position:relative;
	width: 100%;
	height: 350px;	
	top:20px;
	}

	#wrap{
		width:100%;
		margin:0,auto;
	}
	
	#BtnMenu{
		position:relative;
		left:400px;
	
	}
	
	.mapAndScore{
		display:inline-block;
	}
	.star{
		background: url(https://jpassets.jobplanet.co.kr/production/uploads/material/media/8572/icon_star_full.png) no-repeat left top/auto 100%;
		overflow: hidden;
    	display: inline-block;
	}
	
	.reviewBox{
		border-color:#B9B5B5;
		border-width:3px;
		border-style:solid;
		height:80px;
		padding:10px;
		border-radius:10px;
		position:relative;
	}
	
	#reviewBox{
		border-color:#B9B5B5;
		border-width:3px;
		border-style:solid;
		border-radius:10px;
		height:280px;
		width:750px;
		margin:30px auto;
		
		
	}
	
	#reviewBox2{
	 	width:400px;
	 	position:relative;
	 	left:300px;
	 	top:5px;
	}
</style>


</head>

<body>
<div id="wrap">
	<header>
		<nav> 
			<img id="dotbogi" src=".\images\돋보기.png" width=30px; height=30px;>
			<input type="text" name="keyword" size="15" style="margin:10px;">
			<button class="login">로그인</button>
		</nav>
	</header>
	
	<section id="section1">
	<%
	BootcampVO bvo = (BootcampVO)request.getAttribute("bvo");
	
	if(bvo != null){
	%>
		<article id="logoBox">
			<img id="bootLogo" src=".\images\<%=bvo.getRealimg() %>" width=830px; height=300px;>
			<a href=<%=bvo.getSite() %>><img id="academyLogo" src=".\images\<%=bvo.getRogo() %>" width=100px; height=100px;></a>
			<h3 id="aname"><%= bvo.getA_name() %> - <%= bvo.getB_name()%></h3>
		</article>		
	<%
	}
	%>		
		
		
		<article>
			<div id="BtnMenu">
				<button class="BtnReview" onclick="location.href='/camp/review?bnum=<%=bvo.getId()%>'">리뷰 등록하기</button>
			</div>
		</article>
		<article>
			<div id="BtnMenu">
				<button class="BtnCampEdit" onclick="location.href='/camp/update?bnum=<%=bvo.getId()%>'">부트캠프 수정하기</button>
			</div>
		</article>
		<article>
			<div id="BtnMenu">
				<button class="BtnCampDelete" onclick="location.href='/camp/bootcamp2?action=delete&bnum=<%= bvo.getId()%>'">부트캠프 삭제하기</button>
			</div>
		</article>
	</section>
	<section id="section2">
		<article class="mapAndScore">
		<div id="map" style="width:300px; height:200px;"></div>
		</article>
		<article class="mapAndScore">
			<p>강사진 만족도</p> <span class="star" style="width:100%;">star</span>
			<p>학습환경 만족도</p><span class="star" style="width:100%;">star</span>
			<p>교육지원 수준</p> <span class="star" style="width:100%;">star</span>
		</article>
	</section>
	<section id="section3"">
	<%
	ArrayList<ReviewVO> list = (ArrayList<ReviewVO>)request.getAttribute("reviewList");
	if (list != null){
		
	%>
<% 	
		for(ReviewVO rvo : list){
%>
			<article>
				<div id="reviewBox"> 
					<div id="reviewBox2">
					<span style="color:red;">장점</span>
					<div class="reviewBox"><%=rvo.getGood() %></div>
					<span class="text" style="color:blue">단점</span>
					<div class="reviewBox"><%=rvo.getBad() %></div>
					</div>
				</div>
			</article>
<%
		}
%>
	<%
	}
		
	%>		
				
	</section>
	<script type="text/javascript">
    	const dom = document.getElementById("map");
    	url= 'https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyDy81EbO46BRSnX1DOgg_F84bhsdbku2z4&address='+'<%=bvo.getAddress()%>'
		
    	var request = new XMLHttpRequest();
		request.onload = function(event) {
			if (request.status == 200) {
				var obj = JSON.parse(request.responseText);
				lat = obj.results[0].geometry.location.lat;
				lng = obj.results[0].geometry.location.lng;
				dom.innerHTML = '';
				googleMap(lat, lng);
			}
		};
		
		request.open('GET', url, true);
		request.send();
	
		// 위도와 경도를 매개변수로 받아 지도를 생성
		function googleMap(latp,lngp){
			var latlng = {lat:latp,lng:lngp}
			var map = new google.maps.Map(dom,{
				center:latlng,
				zoom: 18
			})
			
			// 마커 생성
			new google.maps.Marker({position: latlng, map:map})
		};
							
</script>
	
</div>	
</body>

</html>