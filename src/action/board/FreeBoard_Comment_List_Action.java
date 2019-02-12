package action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import vo.CommentVO;


/**
 * Servlet implementation class FreeBoard_Comment_Action
 */
@WebServlet("/free_board_commentlist.do")
public class FreeBoard_Comment_List_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String Strfb_idx = request.getParameter("fb_idx");
		int fb_idx = Integer.parseInt(Strfb_idx);
		
		// 해당 게시물 댓글 목록 구하기
		List<CommentVO> comment = CommentDAO.getInstance().select_AllComment(fb_idx);
		
		request.setAttribute("Total", comment.size());	// 해당 게시물 갯수
		request.setAttribute("comment", comment); 	 	// 해당 게시물 댓글 내용
		
		RequestDispatcher disp = request.getRequestDispatcher("board/free_board_viewcontentAjaxfile.jsp");
		disp.forward(request, response);
		
		// 상세보기 페이지로 이동
	}

}
