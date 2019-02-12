package action.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import dao.QnABoardDAO;

/**
 * Servlet implementation class FreeBoard_Comment_Delete_Action
 */
@WebServlet("/free_board_comment_delete.do")
public class FreeBoard_Comment_Delete_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String Strcom_idx = request.getParameter("com_idx");
		int com_idx = Integer.parseInt(Strcom_idx);

		String Strfb_idx = request.getParameter("fb_idx");
		
		System.out.println("삭제할 댓글번호 : " + Strcom_idx + ", 게시물 번호 : " + Strfb_idx);
		
		CommentDAO.getInstance().delete_Comment(com_idx);
		
		
		response.setContentType("text/plain; charset=utf-8");
		String resultStr = String.format("[{'fb_idx': '%s'}]" ,Strfb_idx);
		response.getWriter().println( resultStr );// 응답 페이지에 내용 쓰기
		
//		response.sendRedirect("board/free_board_viewcontentAjaxfile.jsp");
		
	}

}
