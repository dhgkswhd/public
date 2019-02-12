package action.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnABoardDAO;
import vo.QnABoardVO;

@WebServlet("/free_board_modify_result.do")
public class FreeBoard_Update_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int fb_idx = 0;
		if(request.getParameter("fb_idx") != null){
			fb_idx = Integer.parseInt(request.getParameter("fb_idx"));}
		
		
		String fb_title = request.getParameter("fb_title");
		String fb_content = request.getParameter("fb_content");
		
		QnABoardVO board = new QnABoardVO();
		board.setFb_idx( fb_idx );
		board.setFb_title( fb_title );
		board.setFb_content( fb_content );
		
		QnABoardDAO dao = QnABoardDAO.getInstance();
		dao.update_Board( board );
		
		response.sendRedirect("free_board_main.do");
	}

}
