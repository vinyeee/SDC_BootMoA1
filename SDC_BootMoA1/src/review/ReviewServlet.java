package review;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bootcamp.BootcampDAO;
import bootcamp.BootcampVO;
import member.MemberDAO;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ReviewServlet() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		BootcampDAO dao = new BootcampDAO();
		// bnum 이라는 이름으로 부트캠프 번호가 넘어옴 -> bnum에 맞는 부트캠프를 검색해서 그 객체의 변수들을 반환 
		System.out.println(bnum);
		request.setAttribute("bvo", dao.listOne(bnum));
		RequestDispatcher rd = request.getRequestDispatcher("BootReviewApp.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();//세션 객체 생성
		MemberDAO mDao = new MemberDAO();
		ReviewDAO dao = new ReviewDAO();

		//bootReviewApp.jsp에서 post 방식으로 넘어온 값들을 get하여 저장
		String action = request.getParameter("action");
		String goodMemo = request.getParameter("goodmemo");// 장점
		String badMemo = request.getParameter("badmemo"); // 단점 
		int bNum = Integer.parseInt(request.getParameter("bnum")); //부트캠프넘버
		int score = Integer.parseInt(request.getParameter("totalScore")); // 총점
		int tScore = Integer.parseInt(request.getParameter("teachScore")); // 강사진만족도
		int eScore = Integer.parseInt(request.getParameter("learnScore")); // 학습환경 만족도
		int sScore = Integer.parseInt(request.getParameter("eduScore")); // 교육지원 수준
		int mNum = mDao.getMember((String)session.getAttribute("login.id")).getmnum(); //멤버넘버
		int rNum = 0; //rnum 받는 부분이 없어서 아직 값을 못넣음

		String pattern = "yyyy.MM.dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String writeDate = simpleDateFormat.format(new Date());
		
		
		// 후기작성
		if(action.equals("insert")) {
			ReviewVO vo = new ReviewVO();
			vo.setGood(goodMemo);
			vo.setBad(badMemo);
			vo.setScore(score);
			vo.setT_score(tScore);
			vo.setE_score(eScore);
			vo.setS_score(sScore);
			vo.setB_id(bNum);
			vo.setM_id(mNum);
			vo.setWriteDate(writeDate);
			

			
			boolean result = dao.insert(vo);
			if (result)
				request.setAttribute("msg", "후기 작성이 완료되었습니다.");
			else 
				request.setAttribute("msg", "후기 작성에 실패하였습니다.");
			List<ReviewVO> list = dao.listAll();
			if (list.size() > 0)
				request.setAttribute("list", list);
		}else if(action.equals("updateReview")){ //회원정보 수정
			ReviewVO vo = new ReviewVO();
			vo.setId(rNum);
			vo.setGood(goodMemo);
			vo.setBad(badMemo);
			vo.setScore(score);
			vo.setT_score(tScore);
			vo.setE_score(eScore);
			vo.setS_score(sScore);
			vo.setB_id(bNum);
			vo.setM_id(mNum);
			boolean result = dao.updateReview(vo);
			if (result) {
				request.setAttribute("msg", "님의 글이 성공적으로 수정했어요^^");
				
			}else {
				request.setAttribute("msg", "님의 글 수정 작업을 실패했어요ㅜㅜ");
			} 
				
			List<ReviewVO> list = dao.listAll();
			if (list.size() > 0)
				request.setAttribute("list", list);
		}else if(action.equals("delete")) {//회원정보 삭제
			dao.delete(rNum);
		}
		
		request.setAttribute("bnum", bNum);
		RequestDispatcher rd = request.getRequestDispatcher("ReviewSucess.jsp");
		rd.forward(request, response);

	}


		
		
	

}
