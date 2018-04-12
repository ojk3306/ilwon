package proposal.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proposal.model.service.ProposalService;

/**
 * Servlet implementation class ProposalDelete
 */
@WebServlet("/delpro")
public class ProposalDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposalDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("prono"));
	//건의사항 삭제 컨트롤러.
		
		int result= new ProposalService().deleteProposal(request.getParameter("prono"));
		
		RequestDispatcher view=null;
		
		if(result>0) {
			//삭제가 성공했을시
			view=request.getRequestDispatcher("/plist");
			request.setAttribute("message1","삭제에 성공했습니다.");
			view.forward(request, response);
		}else {
			//삭제가 실패했을시.
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
