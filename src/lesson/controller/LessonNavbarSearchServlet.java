package lesson.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import lesson.model.vo.LessonSearch;

/**
 * Servlet implementation class LessonNavbarSearchServlet
 */
@WebServlet("/lnsearch")
public class LessonNavbarSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonNavbarSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("LessonNavbarSearchServlet Run and getParameter : "+request.getParameter("ohw-keyword"));
		RequestDispatcher view = null;				
		
		/*//2. 전송온 값 꺼내서 변수 또는 객체에 저장하기 */
						
		LessonSearch ls = new LessonSearch();
		ls.setLesson_keyword(request.getParameter("ohw-keyword"));							
		
		//3. 서비스 클래스 메소드로 값 전달하고, 결과 받기
		ArrayList<LessonSearch> result = new LessonService().selectSearchKeyword(ls);
		
		System.out.println("Result : " + result + " / (To.LessonNavbarSearchServlet)");
		//4. 받은 결과를 가지고 성공/실패에 대한 뷰를 선택해서 내보냄
		response.setContentType("text/html; charset=UTF-8");
		if(result != null) {
			//성공시 상세보기 페이지로 넘김
			System.out.println("Result(0) : " + result.get(0).getLesson_keyword() + " / (To.LessonNavbarSearchServlet)");
			view = request.getRequestDispatcher("03.OHW/views/find_teacher.jsp");
			request.setAttribute("ohw-keyword", result.get(0).getLesson_keyword());
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("03.OHW/views/noticeError.jsp");
			request.setAttribute("message", "키워드 검색 실패");
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
