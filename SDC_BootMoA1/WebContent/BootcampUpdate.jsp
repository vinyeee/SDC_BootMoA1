<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.ReviewVO,bootcamp.BootcampVO,java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootCamp Review App</title>

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
   
   #section2 {
   
      border-color:#B9B5B5;
      border-width:3px;
      border-style:solid;
      margin:75px auto;
      width:830px; 
      border-radius:10px;
   }
   
   
   article{
      margin : 20px;
   }
   
   textarea{
      border-color:#B9B5B5;
      border-width:3px;
      border-style:solid;
      border-radius:10px;
   }
   
   
   
   div{
      display:inline-block;
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
      padding:4px 18px;
      text-decoration:none;
      text-shadow:0px 0px 0px #365dd1;
      
   }
   .BtnReview:hover {
      background:linear-gradient(to bottom, #058fff 5%, #95cff0 100%);
      background-color:#058fff;
   }
   .BtnReview:active {
      position:relative;
      top:1px;
   }
   
   .reviews{
      text-align:center;
      margin:28px;
      
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

</style>
</head>

<body>
<div id="wrap">
   <header>
      <nav> 
         <img id="dotbogi" src=".\images\돋보기.png" width=30px; height=30px;>
         <input type="text" name="keyword" size="15">
         <button class="login">로그인</button>
      </nav>
   </header>
   

   <section id="section1">
   <%-- 멤버 id 받아올 곳 --%>
         
   </section>
<%
	BootcampVO vo = (BootcampVO)request.getAttribute("BootcampUpdate"); 
%>
   <section id="section2">
   <form method="post" action="/camp/update" >
   		 <input type="hidden" name="bnum" value= <%= vo.getId() %>> 
   		 <input type="hidden" name="mnum" value=<%= vo.getM_id() %>>    
         <article>
         <p>부트캠프이름</p>
            <textarea  name= "bprogram" rows=7 cols=100% >
            <%=vo.getB_name()%></textarea><br>
         <p>학원이름</p>
            <textarea  name= "bacademy" rows=7 cols=100% >
            <%=vo.getA_name() %></textarea><br>
         <p>학원 사이트</p>
            <textarea  name= "site" rows=7 cols=100% >
            <%=vo.getSite() %></textarea><br>
         <p>학원주소</p>
            <textarea  name= "address" rows=7 cols=100% >
            <%=vo.getAddress() %></textarea><br>
            <div>
               <br>
               <input class="BtnReview" type="submit" value="부트캠프 수정하기">
               <input class="BtnReview" type="reset" value="재작성">
               <input class="BtnReview" onclick="location.href=/camp/bootcamp2"value="취소">
            </div>   
         </article>
         </form>
      </section>

</div>   
</body>

</html>