package action.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TradingDAO;
import vo.TradingVO;

@WebServlet("/member_history_input.do")
public class Member_Histoy_Input_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** -------------- 내 거래내역보기 --------------*/
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		
		String membertype = (String) session.getAttribute("membertype");
		
		if ( membertype.equals("일반") ) {
			String g_id = (String) session.getAttribute("memberID");
			System.out.println("현재 접속한 회원의 아이디 : " + g_id);
			
			List<TradingVO> list = TradingDAO.getInstance().G_getMyDealHistory( g_id );
			
			request.setAttribute("list", list);
			
			RequestDispatcher disp = request.getRequestDispatcher("member/member_dealhistory_G.jsp");
			disp.forward(request, response);
		}
		
		else if ( membertype.equals("사업자") ) {
			String b_id = (String) session.getAttribute("memberID");
			System.out.println("현재 접속한 회원의 아이디 : " + b_id);

			List<TradingVO> list = TradingDAO.getInstance().B_getMyDealHistory( b_id );
			
			request.setAttribute("list", list);
			
			RequestDispatcher disp = request.getRequestDispatcher("member/member_dealhistory_B.jsp");
			disp.forward(request, response);
		}

	}

}
