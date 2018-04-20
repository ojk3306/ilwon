package notice.controller;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.*;
import notice.model.vo.*;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nlist")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				System.out.println("NoticeListServlet Run");
				//페이지 별로 출력되는 게시글 전체 조회 처리용 컨트롤러
				//페이지 기본값 지정
				int currentPage = 1;
				
				//전달된 페이지값 추출
				if(request.getParameter("page") != null) {
					currentPage = Integer.parseInt(request.getParameter("page"));
				}
				
				//한 페이지당 출력할 목록 갯수 지정
				int limit = 10;
				
				NoticeService noticeService = new NoticeService();
				//전체 목록 갯수 조회
				int listCount = noticeService.getListCount();
				System.out.println("총 게시글 수 : " + listCount + " / (To.NoticeListServlet)");
				
				//현재 페이지에 출력할 목록 조회		
				ArrayList<Notice> list = noticeService.selectList(currentPage, limit);
				System.out.println("list : " + list + " / (To.NoticeListServlet)");
				
				//총 페이지수 계산 : 목록이 1개일 떄 1페이지로 처리
				int maxPage = (int)((double)listCount / limit + 0.9);
				//현재 페이지 그룹(10개 페이지를 한그룹)에 보여줄 시작 페이지 수
				//현재 페이지가 13페이지이면 그룹은 11~20페이지가 보여지게 한다.
				int startPage = (((int)((double)currentPage / limit + 0.9))-1) * limit + 1;
				
				int endPage = startPage + limit - 1;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				} else {
					
				}	
				
				System.out.println("list : "+ list);
				System.out.println("currentPage : "+ currentPage);
				System.out.println("maxPage : "+ maxPage);
				System.out.println("startPage : "+ startPage);
				System.out.println("endPage : "+ endPage);
				System.out.println("listCount : "+ listCount);
				
				response.setContentType("text/html; charset=UTF-8");
				RequestDispatcher view = null;
				if(list.size() > 0) {
					view = request.getRequestDispatcher("03.OHW/views/noticeList.jsp");
					request.setAttribute("list", list);
					request.setAttribute("currentPage", currentPage);
					request.setAttribute("maxPage", maxPage);
					request.setAttribute("startPage", startPage);
					request.setAttribute("endPage", endPage);
					request.setAttribute("listCount", listCount);			
					view.forward(request, response);
				} else {
				response.sendRedirect("/prototype/01.CJS/ErrorPage2.jsp");
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
