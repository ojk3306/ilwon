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
 * Servlet implementation class ProposalInsert
 */
@WebServlet("/inpro")
public class ProposalInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposalInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Proposal pro=new Proposal();
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("content"));
		if(request.getParameter("userno")!=null)
		pro.setUserNo(Integer.parseInt(request.getParameter("userno")));
		

		
		pro.setProposalContent(request.getParameter("content"));
		pro.setProposalTitle(request.getParameter("title"));
		int result=new ProposalService().insertproposal(pro);
		RequestDispatcher view=null;
		
		if(result>0) {
		response.sendRedirect("/prototype/plist");
		}else {
		view=request.getRequestDispatcher("/04.OJK/proposalForm.jsp");
		request.setAttribute("message","등록에 실패했습니다. 관리자에게 연락부탁드립니다.");
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
