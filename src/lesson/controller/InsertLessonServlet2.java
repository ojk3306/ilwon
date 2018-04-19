package lesson.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lesson.model.service.LessonService;
import lesson.model.vo.Lesson;

/**
 * Servlet implementation class InsertClassServlet
 */
@WebServlet("/insertlesson2.sm")
public class InsertLessonServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLessonServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10;
		
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			//enctype 占쎄퐬占쎌젟占쎌뵠 占쎈┷筌욑옙 占쎈륫占쎈릭占쎈뼄筌롳옙
			view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", "form 占쎄묶域밸챷肉� enctype 占쎈꺗占쎄쉐占쎌뵠 占쎄퐬占쎌젟占쎈┷筌욑옙 占쎈륫占쎈릭占쎈뮸占쎈빍占쎈뼄.");
			view.forward(request, response);
		}
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "lesson_upload";
		
		MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());		
		
		//개행 처리해주는 부분
		String contop = mrequest.getParameter("contop");
		contop = contop.replace("\r\n", "<br>");
		
		Lesson lesson = new Lesson();
		
		lesson.setLesson_title(mrequest.getParameter("title"));
		lesson.setLevel_no(Integer.parseInt(mrequest.getParameter("level")));
		lesson.setUser_no1(Integer.parseInt(mrequest.getParameter("userno")));
		lesson.setLesson_price(Integer.parseInt(mrequest.getParameter("price")));
		lesson.setLesson_count(Integer.parseInt(mrequest.getParameter("count")));
		lesson.setLesson_contop(contop);
		lesson.setLesson_loc(mrequest.getParameter("loc"));
		lesson.setLesson_rad(Integer.parseInt(mrequest.getParameter("rad")));
		lesson.setCategory_no(Integer.parseInt(mrequest.getParameter("category2")));
		
		int result = new LessonService().insertlesson1(lesson);
		
		response.setContentType("text/html; charset=utf-8");
		
		if(result > 0) {
			response.sendRedirect("/prototype/04.OJK/lessonSuccess.jsp");
		}else {
			response.sendRedirect("index.jsp");
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
