package action.master;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDAO;
import util.Paging;
import vo.QnABoardVO;
import vo.ProductVO;

@WebServlet("/board_list_action.do")
public class Master_List_Board_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String page = request.getParameter("page");
		System.out.println(page);
		
		int currentPage = 1; // 
		if( page != null && page.equals("") == false ){
			// page 파라미터로 값이 들어왔다면, 정수로 변환
			currentPage = Integer.parseInt(page);
		}
		
		int pageSize = 10; 
		
		int totalSize = MasterDAO.getInstance().selectCount_fb();
		Paging paging = new Paging( pageSize, totalSize, currentPage );
		HashMap<String, String> map = new HashMap<>();
		map.put("startNo", paging.getStartNo()+"");
		map.put("endNo", paging.getEndNo()+"");
		
		List<QnABoardVO> list = MasterDAO.getInstance().board_list_select(map);
		
		
		request.setAttribute("fb_list", list);
		request.setAttribute("paging", paging);
		
		RequestDispatcher disp = request.getRequestDispatcher("master/master_freeboard_list.jsp");
		disp.forward(request, response);
	}

}
