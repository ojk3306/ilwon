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
import users.model.service.UsersService;
import users.model.vo.Users;

/**
 * Servlet implementation class ProposalDetail
 */
@WebServlet("/prodetail")
public class ProposalDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposalDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int pno=0;
	
	if(request.getParameter("pno")!=null)
	pno=Integer.parseInt(request.getParameter("pno"));
	
	
	if(request.getAttribute("pno")!=null)
	pno= (int) request.getAttribute("pno") ;
	
	int result=new ProposalService().updatehitProposal(pno);
	
	Proposal pro=new ProposalService().getproposaldetail(pno);
	
	
		
	Users user=new UsersService().getUserinfoFromproposal(pro.getUserNo());
	
	RequestDispatcher view=null;
	if(pro!=null) {
	view=request.getRequestDispatcher("/01.CJS/proposalDetail2.jsp");
		request.setAttribute("pro",pro);
		request.setAttribute("user",user);
		view.forward(request, response);
	}else {
		//실패시 

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
