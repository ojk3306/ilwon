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
				
				/*//2. �쟾�넚�삩 媛� 爰쇰궡�꽌 蹂��닔 �삉�뒗 媛앹껜�뿉 ���옣�븯湲� */
				String content = request.getParameter("ucontent");
				content.replace("\r\n", "<br>");				
				Notice notice = new Notice();
				notice.setNoticeNo(Integer.parseInt(request.getParameter("no")));
				notice.setUserNo(Integer.parseInt(request.getParameter("uwritern")));
				notice.setUserName(request.getParameter("uwriter"));
				notice.setNoticeTitle(request.getParameter("utitle"));
				notice.setNoticeContent(content);									
				notice.setNoticeDate(Date.valueOf(request.getParameter("udate")));								
				
				//3. �꽌鍮꾩뒪 �겢�옒�뒪 硫붿냼�뱶濡� 媛� �쟾�떖�븯怨�, 寃곌낵 諛쏄린
				int result = new NoticeService().updateNotice(notice);
				
				//4. 諛쏆� 寃곌낵瑜� 媛�吏�怨� �꽦怨�/�떎�뙣�뿉 ���븳 酉곕�� �꽑�깮�빐�꽌 �궡蹂대깂
				response.setContentType("text/html; charset=UTF-8");
				if(result > 0) {
					//�꽦怨듭떆 �긽�꽭蹂닿린 �럹�씠吏�濡� �꽆源�
					response.sendRedirect( request.getContextPath() + "/ndetail?no=" + notice.getNoticeNo());
				} else {
					view = request.getRequestDispatcher("03.OHW/views/noticeError.jsp");
					request.setAttribute("message", notice.getNoticeNo() + "踰� 寃뚯떆湲� �닔�젙 �떎�뙣");
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
