package member;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberVO;
import member.MemberLoginDAO;

@WebServlet("/login")//이거 중요함 action 값에 이 값을 넣어줘야 알아서 처리됨
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//로그인정보를 get로 받아 처리하는 부분
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RequestDispatcher rd = request.getRequestDispatcher("/MemberLogin.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("/MemberDesign.jsp");
		rd.forward(request, response);
	}
	
	//로그인정보를 post로 받아 처리하는 부분
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//초기변수 선언
		MemberLoginDAO dao = new MemberLoginDAO();//멤버로그인 dao 가져옴
		MemberVO vo =new MemberVO(); // 멤버 객체정보 가져옴
		MemberDAO mDao = new MemberDAO();
		HttpSession session; //세션객체생성
		
		//vo에 넣을 객체값 선언
		String action = request.getParameter("action"); 
		String id = request.getParameter("id"); 
		String pwd = request.getParameter("pwd");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		//vo값 넣어주는부분
		vo.setid(id);
		vo.setpwd(pwd);
		vo.setquestion(question);
		vo.setanswer(answer);
		
		//action 값으로 기능 구분하도록 만듬
		if(action.equals("login")) {
			boolean result = dao.selectLogin(vo); //dao에서 true, false값으로 받아오게 만들었음.
			int mnum = dao.selectMnum(vo); //mnum만 따로 조회해서 가져옴
			//로그인기능
			if(result) {
				session = request.getSession(); //세션정보 생성
				session.setAttribute("isLogOn", true);	//세션에 isLogOn이라는 이름으로 true를 저장
				session.setAttribute("login.id", id);	//id를 세션에 저장
				session.setAttribute("login.pwd", pwd); //pwd를 세션에 저장
				session.setAttribute("login.mnum", mnum); //mnum을 세션에 저장
				session.setAttribute("loginVO", mDao.getMember((String)session.getAttribute("login.id"))); //객체정보를 세션에 담아줌
				
				response.sendRedirect("bootcamp"); //해당 링크(여기선 서블릿의 @WebServlet 값)로 요청함
			} else {
				request.setAttribute("msgin", " 아이디 또는 비밀번호를 잘못 입력했습니다. <br> 입력하신 내용을 다시 확인해주세요.");//msg 부분에 이 값을 띄워줌
//				RequestDispatcher rd = request.getRequestDispatcher("/MemberLogin.jsp"); //로그인 실패시 이 페이지로 이동
				RequestDispatcher rd = request.getRequestDispatcher("/MemberDesign.jsp"); //로그인 실패시 이 페이지로 이동
				rd.forward(request, response);
			}
			
		}else if(action.equals("findpwd")) { //비밀번호찾기
			System.out.print("비밀번호 찾기 실행됨");
			boolean result = dao.selectPwd(vo);
			//아이디, 질문, 답변 체크
			if(result) {
				request.setAttribute("findId", id);//입력한 아이디를 담아줌
				RequestDispatcher rd = request.getRequestDispatcher("/MemberFindPwd.jsp");
				rd.forward(request, response);
			}else {
				System.out.println("정보 잘못됐다고 알려줘야됨");
			}
			
		}else if(action.equals("updatePwd")){ //비밀번호 확인
			String findId = request.getParameter("findId"); // 가져온 아이디
			String newPwd = request.getParameter("newPwd"); // 새 비밀번호
			String checkNewPwd = request.getParameter("checkNewPwd"); //새 비밀번호 확인

			//새 비밀번호 입력시 번호 같나 체크 맞으면 비밀번호 변경
			if(newPwd.equals(checkNewPwd)) {
				//새 비밀번호 정보 등록
				boolean result = dao.updatePwd(findId, newPwd);
				if(result) {
					System.out.println("비밀번호 수정 됐다고 보내줘야됨");
					request.getRequestDispatcher("/MemberLogin.jsp").forward(request, response);
				}else {
					System.out.println("비밀번호 변경에 실패했다고 알려줘야됨");
					request.getRequestDispatcher("/MemberFindPwd.jsp").forward(request, response);
				}
			}else{
				System.out.println("비밀번호가 다릅니다 알려줘야됨");
				request.getRequestDispatcher("/MemberFindPwd.jsp").forward(request, response);
			}
			
		}else if(action.equals("logout")) { //로그아웃
			session = request.getSession(); //세션 가져오기
			session.invalidate(); //세션 파기하기
			response.sendRedirect("bootcamp");

			
		}
	}
	
//	//핸들러로 알아서 구분. 위에 get post 안에는 doHandle메서드를 넣어주면됨.
//	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		
//		
//	}
}
