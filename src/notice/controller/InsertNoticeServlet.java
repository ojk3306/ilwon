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
		String content = request.getParameter("ncontent");
		content.replace("\r\n", "<br>");
		Notice notice = new Notice();
		notice.setNoticeTitle(request.getParameter("ntitle"));
		notice.setUserName(request.getParameter("nwriter"));
		notice.setUserNo(Integer.parseInt(request.getParameter("nwritern")));
		notice.setNoticeContent(content);						
				
		//3. �꽌鍮꾩뒪 �겢�옒�뒪 硫붿냼�뱶濡� 媛� �쟾�떖�븯怨�, 寃곌낵 諛쏄린
		int result = new NoticeService().insertNotice(notice);		
		
		//4. 諛쏆� 寃곌낵瑜� 媛�吏�怨� �꽦怨�/�떎�뙣�뿉 ���븳 酉곕�� �꽑�깮�빐�꽌 �궡蹂대깂
		response.setContentType("text/html; charset=UTF-8");
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/nlist");
		} else {
			view = request.getRequestDispatcher("/03.OHW/views/noticeError.jsp");
			request.setAttribute("message", "寃뚯떆湲� �벑濡� �떎�뙣");
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
