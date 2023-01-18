package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import member.MemberDAO;
import member.MemberVO;

@WebServlet("/member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String input = request.getParameter("input");
		
		if(input.equals("memberRegister")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pnum = request.getParameter("phone");
			String nname = request.getParameter("nick");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			MemberVO vo =new MemberVO();
			
			String q = null;
			if (question.equals("1")) {
	            q="어머니의 성함은?";
	        } else if (question.equals("2")){
	            q="아버지의 성함은?";
	        } else if (question.equals("3")){
	        	q="나의 보물1호는?";
	        } else if (question.equals("4")){
	        	q="기억에 남는 추억의 장소는?";
	        } else if (question.equals("5")){
	        	q="기억에 남는 추억의 선물은?";
	        }else if (question.equals("6")){
	        	q="인상 깊게 읽은 책 이름은?";
	        }else if (question.equals("7")){
	        	q="다시 태어나면 되고 싶은 것은?";
	        }else if(question.equals("8")) {
	        	q="내가 좋아하는 책 이름은?";
	        }
			
			vo.setid(id);
			vo.setpwd(pwd);
			vo.setname(name);
			vo.setemail(email);
			vo.setpnum(pnum);
			vo.setnname(nname);
			vo.setquestion(q);
			vo.setanswer(answer);
		
			MemberDAO mdao = new MemberDAO();
			boolean result = mdao.insertM(vo);
			
			if (result) {
				System.out.println("1");
				request.setAttribute("msg", "회원가입이 완료되었습니다.");
			}else {
				System.out.println("2");
				request.setAttribute("msg", "회원가입에 오류가 발생했습니다.");		
			}
			System.out.println(result);
			request.setAttribute("member",vo);
			request.getRequestDispatcher("/MemberDesign.jsp").forward(request,response);
			
		}else if(input.equals("infoRevise")) {			
			String mid = request.getParameter("mid");
			String mpwd = request.getParameter("mpwd");
			String mname = request.getParameter("mname");
			String memail = request.getParameter("memail");
			String mpnum = request.getParameter("mpnum");
			String mnname = request.getParameter("mnname");
			String mquestion = request.getParameter("mquestion");
			String manswer = request.getParameter("manswer");
			String mnum = request.getParameter("mnum");
	
			String mq = null;
			if (mquestion.equals("1")) {
				mq="어머니의 성함은?";
	        } else if (mquestion.equals("2")){
	        	mq="아버지의 성함은?";
	        } else if (mquestion.equals("3")){
	        	mq="나의 보물1호는?";
	        } else if (mquestion.equals("4")){
	        	mq="기억에 남는 추억의 장소는?";
	        } else if (mquestion.equals("5")){
	        	mq="기억에 남는 추억의 선물은?";
	        }else if (mquestion.equals("6")){
	        	mq="인상 깊게 읽은 책 이름은?";
	        }else if (mquestion.equals("7")){
	        	mq="다시 태어나면 되고 싶은 것은?";
	        }else if(mquestion.equals("8")) {
	        	mq="내가 좋아하는 책 이름은?";
	        }else {
	        	mq = mquestion;
	        }
			
			MemberDAO dao = new MemberDAO();
			int result = dao.infoUpdate(mid,mpwd,mname,memail,mpnum,mnname,mq,manswer,mnum);
			
			if (result==0) {
				System.out.println("1");
				request.setAttribute("msg", "회원정보 수정이 완료되었습니다.");
				request.getRequestDispatcher("/MemberInfoRevise.jsp").forward(request, response);
			}else {
				System.out.println("2");
				request.setAttribute("msg", "회원정보 수정에 오류가 발생했습니다.");					
				request.getRequestDispatcher("/MemberInfoRevise.jsp").forward(request, response);
			}
			
		}       
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		String input = request.getParameter("input");
		String idv = request.getParameter("idval");
		String nv = request.getParameter("nickval");
		
		if(input.equals("idform")) {
			MemberDAO dao = new MemberDAO();
			boolean resultid = dao.duplicateIdCheck(idv);	    
			if (resultid) {
				request.setAttribute("confirmid", "이미 존재하는 아이디입니다");
			}else {
				request.setAttribute("confirmid", "사용가능한 아이디입니다");						
			}
			request.getRequestDispatcher("/IdCheckForm.jsp").forward(request, response);;
		} else if(input.equals("nickform")) {
			MemberDAO dao = new MemberDAO();
			boolean resultn = dao.duplicateNicknameCheck(nv);
			if (resultn) {
				request.setAttribute("confirmnick", "이미 존재하는 닉네임입니다");
			}else {
				request.setAttribute("confirmnick", "사용가능한 닉네임입니다");						
			}
			request.getRequestDispatcher("/NickCheckForm.jsp").forward(request, response);;
		
		}
	}
}



