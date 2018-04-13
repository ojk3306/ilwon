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
@WebServlet("/uppro")
public class ProposalFind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposalFind() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("prono"));
		
	Proposal pro=new ProposalService().findProposal(Integer.parseInt(request.getParameter("prono")));
			RequestDispatcher view=null;
	if(pro != null) {
	view=request.getRequestDispatcher("/04.OJK/proposalupdate.jsp");
	request.setAttribute("list",pro);
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
