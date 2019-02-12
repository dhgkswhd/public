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
import vo.BuyerVO;
import vo.SellerVO;


@WebServlet("/member_list_action.do")
public class Master_List_Member_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String masterStr = request.getParameter("master");
		int master = 0;
		if( masterStr != null && masterStr.equals("") == false ) {
			master = Integer.parseInt(masterStr);
		}
		
		String page = request.getParameter("page");
		System.out.println(page);
		
		int currentPage = 1; // 
		int totalSize = 0;
		if( page != null && page.equals("") == false ){
			// page 파라미터로 값이 들어왔다면, 정수로 변환
			currentPage = Integer.parseInt(page);
		}
		
		int pageSize = 10; 
		if( master == 1 ) {
			totalSize = MasterDAO.getInstance().selectCount_g();
		}
		else if( master == 2) {
			totalSize = MasterDAO.getInstance().selectCount_b();
		}
		Paging paging = new Paging( pageSize, totalSize, currentPage );
		HashMap<String, String> map = new HashMap<>();
		map.put("startNo", paging.getStartNo()+"");
		map.put("endNo", paging.getEndNo()+"");
		
		if( master == 1 ) {
			List<SellerVO> list = MasterDAO.getInstance().general_select(map);
			request.setAttribute("gm_list", list);
			RequestDispatcher disp = request.getRequestDispatcher("master/master_general_member_list.jsp");
			disp.forward(request, response);
		}
		else if( master == 2 ) {
			List<BuyerVO> list = MasterDAO.getInstance().business_select(map);
			request.setAttribute("bm_list", list);
			RequestDispatcher disp = request.getRequestDispatcher("master/master_business_member_list.jsp");
			disp.forward(request, response);
		}
		request.setAttribute("paging", paging);
	}

}
