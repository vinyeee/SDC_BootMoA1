package bootcamp;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import member.MemberDAO;


@WebServlet("/bootcamp")
public class BootcampServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BootcampServlet() {super();}
    BootcampDAO bDao;
    MemberDAO mDao;
    
    public void init() {
    	bDao = new BootcampDAO();
    	mDao = new MemberDAO();
	}
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	request.setAttribute("list", bDao.listAll());
		String keyword = request.getParameter("keyword");
		String id = request.getParameter("bnum");
		String action = request.getParameter("action");
		BootcampDAO dao = new BootcampDAO();
		if(keyword == null) {
			if(action != null && action.equals("delete")) {
				System.out.println(id); //null
				boolean result = dao.delete(Integer.parseInt(id));
				if (result) {
					request.setAttribute("msg", "성공적으로 삭제되었습니다.");
				} else {
					request.setAttribute("msg", "삭제되지 않았습니다.");
				}
				RequestDispatcher rd = request.getRequestDispatcher("BootcampSucess.jsp");
				rd.forward(request, response);
			}
		}
		
		else {
			List<BootcampVO> list = dao.search(keyword);
			if (list.size() == 0) {
				request.setAttribute("msg", keyword + "정보가 없습니다.");
			} else {
				request.setAttribute("list", dao.search(keyword));
			}
		}
		//Main 화면에선 항상 list라는 이름으로 모든 부트캠프 리스트를 반환
		
		RequestDispatcher rd = request.getRequestDispatcher("bootMain.jsp");
		rd.forward(request, response);
				
	
		
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String b_name = request.getParameter("bprogram");
		String a_name = request.getParameter("bacademy");
		String rogo = request.getParameter("rogo");
		String realimg = request.getParameter("realimg");
		String site = request.getParameter("site");
		String m_id = request.getParameter("mnum");
		String address = request.getParameter("address");
		BootcampDAO dao = new BootcampDAO();
		if(action.equals("insert")) {
			BootcampVO vo = new BootcampVO();
			vo.setB_name(b_name);
			vo.setA_name(a_name);
			vo.setRogo(rogo);
			vo.setRealimg(realimg);
			vo.setSite(site);
			vo.setM_id(Integer.parseInt("1"));
			vo.setAddress(address);
			
			boolean result = dao.insert(vo);
			if (result) {			
				request.setAttribute("msg", "성공적으로 등록되었습니다.");			
			} else {
				request.setAttribute("msg", "등록되지 않았습니다.");
			}
		}
		request.setAttribute("list", dao.listAll());
		request.getRequestDispatcher("BootcampSucess.jsp").forward(request, response);
	}

		
}
