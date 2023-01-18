<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, member.MemberVO"%>
<%@ page import ="member.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
<style>

	
	body{
	height:100vh;
	background: #f5f5f5;
	}
	
	.wrap{
	overflow:auto;
	margin-left: auto;
	margin-right:auto;
	position: relative;
    z-index: 0;
    float: none;
    padding-top: 40px;
    width: 60%;
    height:100%;
    background: #252934;
	}
	
	h2{
	margin-left:20px;
	color:#ffff;
	padding: 10px;
	text-align: center;
	position: relative;
	display: inline-block;
	}
	
	h2:after{
	content:'';
	background:#04BEBD;
	width:100%;
	height:2px;
	display:block;
	}
	
	button{
	float: right;
	border:0;
	font-size:14px;
	margin-right: 30px;
	background:#04BEBD;
	color:#ffff;
	height: 30px;
	}
	
	table{
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 30px;
	padding:10px;
	width:90%;
	background-color:#FFFFFF;
	}

	td{
		border-bottom : 1px solid #ddd;;
		padding : 8px;
		text-align:left;
		font-size:14px;
	}
	
	td:first-child{
	font-weight: bold;
	}
	


</style>

<%	
			
			boolean loginCheck = (boolean)session.getAttribute("isLogOn");
			MemberVO mvo = (MemberVO)session.getAttribute("loginVO");
			if(loginCheck ==false){
			%>
			<script>
				alert("로그인 후 회원정보 조회가 가능합니다");
			</script><%
			response.sendRedirect("/MemberLogin.jsp");
				}
			%>
				
</head>
<body>
<div class="wrap">
<%
    MemberDAO mdao = new MemberDAO();
	ArrayList<MemberVO> info = (ArrayList<MemberVO>)mdao.getMemberlist(mvo.getid()); //test
	if(info != null){
%>
	<h2><%=mvo.getnname() %>님의 회원정보 조회</h2>

	<table class="userinfo">
<%
		for(MemberVO vo : info){
%>
			<tr>
			<td>아이디</td>
			<td><%=vo.getid() %></td>
			</tr>
			
			<tr>
			<td>비밀번호</td>
			<td><%=vo.getpwd() %></td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td><%=vo.getname() %></td>
			</tr>
			
			<tr>
			<td>이메일</td>
			<td><%=vo.getemail() %></td>
			</tr>
			
			<tr>
			<td>전화번호</td>
			<td><%=vo.getpnum() %></td>
			</tr>
			
			<tr>
			<td>닉네임</td>
			<td><%=vo.getnname() %></td>
			</tr>
			
			<tr>
			<td>보안 질문</td>
			<td><%=vo.getquestion() %></td>
			</tr>
			
			<tr>
			<td>답변</td>
			<td><%=vo.getanswer() %></td>
			</tr>
<%
		}
	}
%>
	</table>
	<button type="button" onclick="location.href='bootMainYebin2.jsp'">메인페이지로 돌아가기</button>
	<button type="button" onclick="location.href='MemberInfoRevise.jsp'">회원정보 수정</button>

</div>
</body>
</html>