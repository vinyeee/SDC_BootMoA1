package bootcamp;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.ReviewDAO;

@WebServlet("/goReviews")
public class GoReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GoReviewServlet() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bnum = request.getParameter("bnum");
		BootcampDAO bDao = new BootcampDAO();
		ReviewDAO rDao = new ReviewDAO();
		// BootMainYebin.jsp에서 bnum 이라는 이름으로 부트캠프 번호가 넘어옴 -> bnum에 맞는 부트캠프를 검색해서 그 객체의 변수들을 반환 
		
		if(bnum != null) {
			//요청에서 받아들인 bnum을 정수로 변환 
			int bNum = Integer.parseInt(bnum);
			
			// 요청받은 부트캠프 번호(bnum)에 해당하는 부트캠포 정보를 반환해서 넘겨줌
			request.setAttribute("bvo", bDao.listOne(bNum));
			
			// 요청받은 부트캠프 번호(bnum)에 해당하는 부트캠프에 대한 리뷰 리스트들을 넘겨줌
			request.setAttribute("reviewList", rDao.TheBootcampList(bNum) );
			
			// 요청받은 부트캠프 번호(bnum)을 다시 넘겨줌 
			request.setAttribute("bnum", bNum);
			RequestDispatcher rd = request.getRequestDispatcher("bootReviews.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("list", bDao.listAll());
			RequestDispatcher rd = request.getRequestDispatcher("bootMainYebin2.jsp");
			rd.forward(request, response);
			
		}
		
	}
/*
 *  private String b_name;	// 부트캠프 이름
	private String a_name;	// 학원이름
	private String rogo;	// 학원로고
	private String realimg;	// 실제 학원이미지
	private String site; // 사이트 링크
	private int m_id; // 회원 id
	
 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String b_name = request.getParameter("b_name");
		String a_name = request.getParameter("a_name");
		String rogo = request.getParameter("rogo");
		String realimg = request.getParameter("realimg");
		String site = request.getParameter("site");
		String m_id = request.getParameter("m_id");
		BootcampDAO dao = new BootcampDAO();
		BootcampVO vo = new BootcampVO();
		vo.setB_name(b_name);
		vo.setA_name(a_name);
		vo.setRogo(rogo);
		vo.setRealimg(realimg);
		vo.setSite(site);
		vo.setM_id(Integer.parseInt(m_id));
		if(action == "insert") {
			boolean result = dao.insert(vo);
			if (result) {			
				request.setAttribute("msg", "성공적으로 등록되었습니다.");			
			} else {
				request.setAttribute("msg", "등록되지 않았습니다.");
			}
		} else if (action == "search"){
			boolean result = dao.update(vo);
			if (result) {			
				request.setAttribute("msg", "성공적으로 수정되었습니다.");			
			} else {
				request.setAttribute("msg", "수정되지 않았습니다.");
			}
		}
		request.setAttribute("list", dao.listAll());
		request.getRequestDispatcher("/bootcamp/bootcamps.jsp").forward(request, response);
	}

}

