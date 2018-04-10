package proposal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semina.model.service.SeminaService;
import proposal.model.service.ProposalService;
import proposal.model.vo.*;

/**
 * Servlet implementation class ProposalList
 */
@WebServlet("/plist")
public class ProposalList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposalList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<Proposal> pro=null;
		String message1=null;
		String search=null;
		int currentPage = 1;
		int seachOption = 1;
		//전달된 페이지값 추출
		
		if(request.getAttribute("message1") != null) {
			message1="정상적으로 건의가 입력되었습니다 감사합니다";
		}
		
		
		if(request.getParameter("search")!=null) {
		search=request.getParameter("search");
		System.out.println("search="+search);
		}
		
		if(request.getParameter("page") != null) {
		currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("serchoption") != null) {
		seachOption=Integer.parseInt(request.getParameter("serchoption"));
		}
		//한 페이지당 출력할 목록 갯수 지정
		int limit = 9;
		//전체 목록 갯수 조회 
		int  listCount=0;
		
		if(request.getParameter("search")!=null)  //만일, 검색일경우, 
			listCount=new ProposalService().getlistcountBySearch(search,seachOption);
		else
			listCount=new ProposalService().getlistcount(seachOption);
		
		
		
	    if(search == null) {
		System.out.println("검색이 없음.");
		pro= new ProposalService().getprolist(limit,currentPage);//최신 등록순으로
		}else {
			System.out.println("검색을 실행함.");
		pro= new ProposalService().getprolistBysearch(limit,currentPage,search,seachOption);
		}
	
		 
	
		
		
		System.out.println("listCount="+listCount+"개");
		//현재 페이지에 출력할 목록 조회
		
		
		//총 페이지수 계산 : 목록이 1개일 때 1페이지로 처리
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재 페이지 그룹(10개페이지를 한그룹처리)에 보여줄 시작 페이지수
		//현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게함
		int startPage = (((int)((double)currentPage / limit + 0.9))
				- 1) * limit + 1;
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage)
			endPage = maxPage;
		
		RequestDispatcher view=null;
		if(pro.size()>0) {
			view=request.getRequestDispatcher("/04.OJK/proposal.jsp");
		    request.setAttribute("list", pro);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			request.setAttribute("search", search);
			request.setAttribute("seachoption",seachOption);
			request.setAttribute("message1",message1);
			view.forward(request, response);
		}else {
			view=request.getRequestDispatcher("/04.OJK/proposal.jsp");
			request.setAttribute("list", pro);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			request.setAttribute("search", search);
			request.setAttribute("seachoption",seachOption);
			request.setAttribute("message","검색 결과값이 존재하지않습니다.");
			view.forward(request, response);
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
