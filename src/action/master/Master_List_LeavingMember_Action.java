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
import vo.LeavingVO;


@WebServlet("/leaving_list_action.do")
public class Master_List_LeavingMember_Action extends HttpServlet {
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
		
		int totalSize = MasterDAO.getInstance().selectCount_l();
		Paging paging = new Paging( pageSize, totalSize, currentPage );
		HashMap<String, String> map = new HashMap<>();
		map.put("startNo", paging.getStartNo()+"");
		map.put("endNo", paging.getEndNo()+"");
		List<LeavingVO> list = MasterDAO.getInstance().leaving_select(map);
		request.setAttribute("l_list", list);
		request.setAttribute("paging", paging);
		
		
		
		RequestDispatcher disp = request.getRequestDispatcher("master/master_leavingmember_list.jsp");
		disp.forward(request, response);
	}

}
