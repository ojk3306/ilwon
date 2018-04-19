package report.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semina.model.service.SeminaService;
import report.model.Service.ReportService;
import report.model.vo.*;
/**
 * Servlet implementation class ReportInsert
 */
@WebServlet("/inreport")
public class ReportInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// �뾽濡쒕뱶�븷 �뙆�씪�쓽 �슜�웾 �젣�븳 : 10Mbyte濡� �젣�븳�븳�떎硫�
				int maxSize = 1024 * 1024 * 10;

				RequestDispatcher view = null;
				// enctype="multipart/form-data" 濡� �쟾�넚�릺�뿀�뒗吏� �솗�씤
				if (!ServletFileUpload.isMultipartContent(request)) {
					view = request.getRequestDispatcher("04.OJK/insertSemina.jsp");
					request.setAttribute("message", "form enctype �냽�꽦 �궗�슜 �븞 �맖!");
					view.forward(request, response);
				}
				// �빐�떦 而⑦뀒�씠�꼫�쓽 援щ룞以묒씤 �쎒 �븷�뵆由ъ��씠�뀡�쓽 猷⑦듃 寃쎈줈 �븣�븘�깂
				String root = request.getSession().getServletContext().getRealPath("/");
				// �뾽濡쒕뱶�릺�뒗 �뙆�씪�씠 ���옣�맆 �뤃�뜑紐낃낵 寃쎈줈 �뿰寃� 泥섎━
				String savePath = root + "reportimg";
				// web/seminaTitleimg�쓣 �꽭誘몃굹 媛뺤쓽�뿉�꽌 諛쏆쓣 ���씠�� �씠誘몄�濡� 吏��젙�븿
			System.out.println("root="+root);
			System.out.println("savePath="+savePath);
				// request 瑜� MultipartRequest 媛앹껜濡� 蹂��솚�븿
				MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
				
			    Report repo=new Report();
			    repo.setReportTitle(mrequest.getParameter("title"));
				repo.setReportContent(mrequest.getParameter("contents"));
				try {
				
					repo.setUserNo(Integer.parseInt(mrequest.getParameter("userno")));
					
				
				String originFileName = mrequest.getFilesystemName("titleimg");
				
				if (originFileName != null) {
					// �뾽濡쒕룄�맂 �뙆�씪紐낆쓣 "�뀈�썡�씪�떆遺꾩큹.�솗�옣�옄" 濡� 蹂�寃쏀븿
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

					// �뙆�씪紐� 諛붽씀湲고븯�젮硫� File 媛앹껜�쓽 renameTo() �궗�슜�븿
					File originFile = new File(savePath + "\\" + originFileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					// �뙆�씪�씠由� 諛붽씀湲� �떎�뻾 >> �떎�뙣�븷 寃쎌슦 吏곸젒 諛붽씀湲고븿
					// �깉 �뙆�씪留뚮뱾怨� �썝�옒 �뙆�씪�궡�슜 �씫�뼱�꽌 蹂듭궗 湲곕줉�븯怨�
					// �썝 �뙆�씪 �궘�젣�븿
					if (!originFile.renameTo(renameFile)) {
						int read = -1;
						byte[] buf = new byte[1024];
						// �븳踰덉뿉 �씫�쓣 諛곗뿴 �겕湲� 吏��젙
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						while ((read = fin.read(buf, 0, buf.length)) != -1) {
							fout.write(buf, 0, read);
						}

						fin.close();
						fout.close();
						originFile.delete(); // �썝蹂� �뙆�씪 �궘�젣�븿
					}
			    repo.setReportOriginalFileName(originFileName);
			    repo.setReportRenameFileName(renameFileName);
			    
			
				
				} 
				System.out.println(repo.toString());
				
				response.setContentType("text/html; charset=utf-8");
				
				int result=new ReportService().insertReport(repo);
				
				if(result>0) {
				view=request.getRequestDispatcher("/01.CJS/reportForm.jsp");
				request.setAttribute("message","신고완료!!");
				view.forward(request, response);
					}else {
				view=request.getRequestDispatcher("/01.CJS/reportForm.jsp");
				request.setAttribute("message","오류입니다!!");
				view.forward(request, response);
				}
				
				
				
				/*
				if (new SeminaService().insertSemina(semi) > 0) {
					
					response.sendRedirect("/prototype/semilist");
					
				} else {
					view = request.getRequestDispatcher("views/board/boardError.jsp");
					request.setAttribute("message", "寃뚯떆 �썝湲� �벑濡� �꽌鍮꾩뒪 �떎�뙣!");
					view.forward(request, response);
				}
				*/
				} catch (NumberFormatException e) {
					// TODO: handle exception
					response.setContentType("text/html; cherset=utf-8");
					view=request.getRequestDispatcher("/01.CJS/login.jsp");
					request.setAttribute("message","�떊怨좊�� �븯湲곗쐞�빐�꽑 濡쒓렇�씤�쓣 �븯�뀛�빞�빀�땲�떎.");
					view.forward(request, response);
					
				}
				
			}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
