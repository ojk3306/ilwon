package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class InsertNoticeServlet
 */
@WebServlet("/ninsert")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("InsertNoticeServlet doGet Run");
		
		RequestDispatcher view = null;
		
		Notice notice = new Notice();
		notice.setNoticeTitle(request.getParameter("ntitle"));
		notice.setUserName(request.getParameter("nwriter"));
		notice.setUserNo(Integer.parseInt(request.getParameter("nwritern")));
		notice.setNoticeContent(request.getParameter("ncontent"));						
				
		//3. 서비스 클래스 메소드로 값 전달하고, 결과 받기
		int result = new NoticeService().insertNotice(notice);		
		
		//4. 받은 결과를 가지고 성공/실패에 대한 뷰를 선택해서 내보냄
		response.setContentType("text/html; charset=UTF-8");
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/03.OHW/views/noticeList.jsp");
		} else {
			view = request.getRequestDispatcher("/03.OHW/views/noticeError.jsp");
			request.setAttribute("message", "게시글 등록 실패");
			view.forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
