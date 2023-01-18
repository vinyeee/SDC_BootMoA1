<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
    
    }
	
	* {
	font-family:'SUIT-Regular';
	
	}
	
	section{
	
		border-color:#B9B5B5;
		border-width:3px;
		border-style:solid;
		margin:200px auto;
		width:500px; 
		border-radius:10px;
		height:500px;
		
	}
	
	
	.BtngoReviews {
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
		margin:45px;
		
	}
	.BtngoReviews:hover {
		background:linear-gradient(to bottom, #058fff 5%, #95cff0 100%);
		background-color:#058fff;
	}
	.BtngoReviews:active {
		position:relative;
		top:1px;
	}
	
	div{
		width:250px;
		height:250px;
		position:relative;
		left:125px;
		top:200px;
	}
	
	h3{
		color:#ABA2A2;
		margin-left:15px;
	}
</style>

</head>
<body>
	<% int bnum = (int)request.getAttribute("bnum"); %>
	<section>
		<div>
			<h3>${ msg }</h3>
			<hr>
			<button class="BtngoReviews" onclick="location.href='/camp/goReviews?bnum=<%=bnum%>'">리뷰 확인하러가기</button>
		</div>
	</section>
</body>
</html>