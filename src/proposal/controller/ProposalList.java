package proposal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semina.model.service.SeminaService;
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
		Proposal pro=new Proposal();
		
		String search="";
		int currentPage = 1;
		//전달된 페이지값 추출
		
		if(request.getParameter("search")!=null) {
		search=request.getParameter("search");
		System.out.println("search="+search);
		}
		
		
		if(request.getParameter("page") != null) {
		currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//한 페이지당 출력할 목록 갯수 지정
		int limit = 10;
		//전체 목록 갯수 조회 
		
		int listCount=new SeminaService().getlistcount();
		
	
		if(search.equals("null")) {
		System.out.println("이건대?");
		al= new SeminaService().getseminalist(limit,currentPage);//최신 등록순으로
		}else {
		al= new SeminaService().getseminalistbysearch(limit,currentPage,search);
		}
		int[] numbers = new int[3];
		  
		Random gen = new Random();
		for(int i =0 ; i<3 ; i++ ){
		numbers[i] = gen.nextInt(listCount)+0; //난수생성
		for(int j = 0; j < i; j++){               //중복체크를 위해 for문 한번 더 돕니다. 대신 j 는 i 보다 작을동안..
			   if(numbers[i] == numbers[j]){   //numbers[i] 번째에 생성된 난수와 그전에 생성된 numbers[j] 난수와 같은게 있나 비교합니다.
			    i = i-1;                                  //같은게 있다면 i-1 해주어 현재 자리에 새로 난수를 발생 시키도록 합니다.
			    break;                                  //같은수가 발견되었다면 현재 for 문을 나가고 위에 for 부터 다시 돕니다.
			   }
			  }
			}
		 for(int a = 0 ; a <3; a++){
		 al1.add(getall.get(numbers[a]));
		}
			
		 
		if(request.getParameter("search")!=null)
		listCount = new SeminaService().getlistcountBySearch(search);
		
		
		
		System.out.println( "listCount="+listCount+"개");
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
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
