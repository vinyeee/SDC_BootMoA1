<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.util.ArrayList, member.MemberVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
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
	
	.infobutton{
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
	
	.q, input[type=text]{
	height:100%;
	width:100%;
	border-radius: 10px;
	border-color:  #DCD6D0;
	border-width: .1px;
	}
	
	.q:focus, input[type=text]:focus{
	outline:none;
	color: #111;
    background: #ffff;
    box-shadow: 0 0 5px #04BEBD;
	}

</style>
</head>
<body>
<div class="wrap">
<%
	String findId = (String)request.getAttribute("findId");
%>
<form name="userInfo" action="member" method="post">
	<input type="hidden" name="action" value="updatePwd">
	<input type="hidden" name="findId" value=<%= findId %>>
	<table class="userinfo">
		<tr>
			<td>새 비밀번호 입력</td>
			<td><input type="password" placeholder="새 비밀번호를 입력하세요." name="newPwd" required style="width:85%;">
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
			<td><input type="password" placeholder="새 비밀번호 확인" name="checkNewPwd" required style="width:85%;"><br>
		</tr>
	</table>
	<input type="submit" class="infobutton" value="수정 완료">
	<button type="button" class="infobutton" onclick="location.href='login'">취소</button>
</form> 
<%	
	if (request.getAttribute("msg") != null) { 
%>
<script>
	alert('${ msg }');
</script> 
<% 
	} 
%>
</div>

	<!-- 새 비밀번호 설정창 -->
	<%-- <form method="post" action="login">
		<input type="hidden" name="action" value="updatePwd">
		<input type="hidden" name="findId" value=<%= findId %>><!-- 나중에 값 숨겨줘야됨 -->
		<input type="password" placeholder="새 비밀번호를 입력하세요." name="newPwd" required><br>
		<input type="password" placeholder="새 비밀번호 확인" name="checkNewPwd" required><br>
		<input type="submit" class="button" value="전송">
	</form> --%>
 	
</body>
</html>
