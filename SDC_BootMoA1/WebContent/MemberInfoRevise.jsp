<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, member.MemberVO"%>
<%@ page import ="member.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원정보 수정</title>
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

<script>
function openIdCheck(){
	window.name = "parentForm";
	window.open("IdCheckForm.jsp","idchkForm","width=500,height=300");
}	

function opennickCheck(){
	window.name = "parentForm";
	window.open("NickCheckForm.jsp","nickchkForm","width=500,height=300");
}
</script>
</head>
<body>
<div class="wrap">
<%
    MemberDAO mdao = new MemberDAO();
	ArrayList<MemberVO> info = (ArrayList<MemberVO>)mdao.getMemberlist(mvo.getid()); //test
	if(info != null){
%>
	<h2><%=mvo.getnname()%>님의 회원정보 수정</h2>
	<form name="userInfo" action="member" method="post">
		<input type="hidden" name="input" value="infoRevise"> 
		<table class="userinfo">
		
<%
		for(MemberVO vo : info){
%>
			
			<tr>
			<td>아이디</td>
			<td><input type="text" name="mid" id ="id" value="<%=vo.getid() %>" style="width:85%;">
			<input type="button" value="중복확인" onclick="openIdCheck()">
			<input type="hidden" name="idDuplication" value="idUncheck"></td>
			</tr>
			
			<tr>
			<td>비밀번호</td>
			<td><input type="text" name="mpwd" value="<%=vo.getpwd() %>"></td>
			</tr>
			
			<tr>
			<td>이름</td>
			<td><input type="text" name="mname" value="<%=vo.getname() %>"></td>
			</tr>
			
			<tr>
			<td>이메일</td>
			<td><input type="text" name="memail" value="<%=vo.getemail() %>"></td>
			</tr>
			
			<tr>
			<td>전화번호</td>
			<td><input type="text" name="mpnum" value="<%=vo.getpnum() %>"></td>
			</tr>
			
			<tr>
			<td>닉네임</td>
			<td><input type="text" name="mnname" id ="nick" value="<%=vo.getnname() %>" style="width:85%;">
			<input type="button" value="중복확인" onclick="opennickCheck()">
			<input type="hidden" name="nickDuplication" value="nickUncheck"></td>
			</tr>
			
			<tr>
			<td>보안 질문</td>
			<td>
			<select name="mquestion" class="q">
								<option value="<%=vo.getquestion() %>">"<%=vo.getquestion() %>"</option>
								<option value="1">어머니의 성함은?</option>
								<option value="2">아버지의 성함은?</option>
								<option value="3">나의 보물1호는?</option>
								<option value="4">기억에 남는 추억의 장소는?</option>
								<option value="5">기억에 남는 추억의 선물은?</option>
								<option value="6">인상 깊게 읽은 책 이름은?</option>
								<option value="7">다시 태어나면 되고 싶은 것은?</option>
								<option value="8">내가 좋아하는 책 이름은?</option>
								</select>
								</td>	
			</tr>
			<tr><td>
			<input type="hidden" name="mnum" value="<%=vo.getmnum() %>">
			</td></tr>
			<tr>
			<td>답변</td>
			<td><input type="text" name="manswer" value=<%=vo.getanswer() %>></td>
			</tr>
<%
		}
	}
%>
	</table>
	
	<input type="submit" class="infobutton" value="수정 완료">
	<button type="button" class="infobutton" onclick="location.href='MemberInfo.jsp'">뒤로가기</button>
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
</body>
</html>