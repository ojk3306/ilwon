package proposal.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import proposal.model.service.ProposalService;
import proposal.model.vo.Proposal;

/**
 * Servlet implementation class ProposalUpdate
 */
@WebServlet("/pupdate")
public class ProposalUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposalUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int result=new ProposalService().updateProposal(Integer.parseInt(request.getParameter("prono")),request.getParameter("title"),request.getParameter("content"));   
	
		RequestDispatcher view=null;
		
		if(result>0) {
		view=request.getRequestDispatcher("/prodetail");
		request.setAttribute("pno",Integer.parseInt(request.getParameter("prono")));	
			view.forward(request, response);
		}else {
			
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
