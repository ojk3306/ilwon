package notice.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nupdate")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
				
				RequestDispatcher view = null;				
				
				/*//2. 전송온 값 꺼내서 변수 또는 객체에 저장하기 */
								
				Notice notice = new Notice();
				notice.setNoticeNo(Integer.parseInt(request.getParameter("no")));
				notice.setUserNo(Integer.parseInt(request.getParameter("uwritern")));
				notice.setUserName(request.getParameter("uwriter"));
				notice.setNoticeTitle(request.getParameter("utitle"));
				notice.setNoticeContent(request.getParameter("ucontent"));									
				notice.setNoticeDate(Date.valueOf(request.getParameter("udate")));								
				
				//3. 서비스 클래스 메소드로 값 전달하고, 결과 받기
				int result = new NoticeService().updateNotice(notice);
				
				//4. 받은 결과를 가지고 성공/실패에 대한 뷰를 선택해서 내보냄
				response.setContentType("text/html; charset=UTF-8");
				if(result > 0) {
					//성공시 상세보기 페이지로 넘김
					response.sendRedirect( request.getContextPath() + "/ndetail?no=" + notice.getNoticeNo());
				} else {
					view = request.getRequestDispatcher("03.OHW/views/noticeError.jsp");
					request.setAttribute("message", notice.getNoticeNo() + "번 게시글 수정 실패");
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
