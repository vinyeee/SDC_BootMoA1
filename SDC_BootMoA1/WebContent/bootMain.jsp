<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.ReviewVO,member.MemberVO,bootcamp.BootcampVO,java.util.ArrayList"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>부트모아</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Raleway:400,700&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  
  <style type="text/css">
  	#websiteLogo{
		position:relative;
		width:300px;
		margin:50px;
	}
	
	.topBtn{
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
	
	.topBtn:hover {
		background:linear-gradient(to bottom, #058fff 5%, #95cff0 100%);
		background-color:#058fff;
	}
	.topBtn:active {
		position:relative;
		top:1px;
	}
	
  </style>
</head>


<body>
  <div class="hero_area">
    <!-- header 로고, 로그인버튼 -->
    <header class="header_section">
		<a href ='/camp/goReviews'><img id="websiteLogo" src=".\images\부트모아로고eng.png" ></a>
	</header>
    <!-- end header section -->
    
    
    <!-- slider section -->
    <section class="slider_section ">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-4 offset-md-1">
            <div class="detail-box">
              <h1>
                <span>부트캠프<br>리뷰</span> <br>
                	한방에 <br>
                	찾아보자
              </h1>
              <%	
				
				if(session.getAttribute("isLogOn") != null ){
				%>
              		<div class="btn-box">
                		<form  method="post" action="login">
							<input type="hidden" name="action" value="logout">
							<button type="submit" class="topBtn" value="전송">로그아웃</button>
							<button type="button" onclick="location.href='MemberInfo.jsp'"class="topBtn">회원정보 조회/수정</button>
						</form>
              		</div>
              <%
					}else{
				%>	
					<div class="btn-box">
						<form method="post" action="login">
							<input type="hidden" name="action" value="login">
							<button type="submit" class="topBtn" value="전송">로그인</button>
						</form>
					</div>
					<div class="btn-box">
						<button class="topBtn" onclick="location.href='/camp/goBootcamps' ">부트캠프등록하기</button>
					</div>
				<%
					}
				%>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end slider section -->
  </div>

  <!-- find section -->
  <section class="find_section ">
    <div class="container">
      <form method = "get" action="/camp/bootcamp">
        <div class=" form-row">
          <div class="col-md-5">
            <input type="search" class="form-control" name="keyword" size="15" placeholder="부트캠프 후기가 궁금할 떈 부트모아 ">
          </div>
          <div class="col-md-2">
            <button type="submit" class="form-control">
              search
            </button>
          </div>
        </div>

      </form>
    </div>
  </section>

  <!-- end find section -->


 
  <!-- sale section -->

  <section class="sale_section layout_padding-bottom">
    <div class="container-fluid">
      <div class="heading_container">
      	<%
			if(session.getAttribute("isLogOn") != null){ //로그인 해서 세션이 생성되면 환영 문구 띄움
				MemberVO mvo = (MemberVO)session.getAttribute("loginVO");
				
		%>
				<p><%= mvo.getnname() %>님 반갑습니다</p>
				
		<%
			}
		%>
		
		
        
      </div>
     </div>
      <div class="sale_container">
     
<%
		ArrayList<BootcampVO> list = (ArrayList<BootcampVO>)request.getAttribute("list");
		if(list != null){
%> 

			<% for(BootcampVO bvo : list){%>
				        <div class="box" onclick="location.href='/camp/goReviews?bnum=<%=bvo.getId()%>'">
				          <div class="img-box">
				            <img src=".\images\<%=bvo.getRogo() %>" class="imgs">
				          </div>
				          <div class="detail-box">
				            <h6>
				              <%=bvo.getA_name() %>
				            </h6>
				            <p>
				              <%=bvo.getB_name() %>
				            </p>
				         </div>
				        </div> 		        
<%
		} 
%>
<%
	}
%>
	</div>
      <div class="btn-box">
        <a href="">
          Find More
        </a>
      </div>
    </div>
  </section>

  <!-- end sale section -->


  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <script type="text/javascript" src="js/custom.js"></script>


</body>

</html>