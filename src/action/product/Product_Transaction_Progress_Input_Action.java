package action.product;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/product_transaction_progress_input.do")
public class Product_Transaction_Progress_Input_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** -------------- 내 거래진행상황 --------------*/
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String membertype = (String) session.getAttribute("memberType"); // 현재 회원타입
		
		if ( membertype.equals("일반") ) {
			String seller_id = (String) session.getAttribute("memberId");
			System.out.println("현재 접속한 회원의 아이디(일반) : " + seller_id);
			
			List<TradingVO> list = TradingDAO.getInstance().seller_transactionProgress( seller_id );
			
			request.setAttribute("list", list);
			
			RequestDispatcher disp = request.getRequestDispatcher("shop/product_seller_tp.jsp");
			disp.forward(request, response);
		}
		
		else if ( membertype.equals("사업자") ) {
			String buyer_id = (String) session.getAttribute("memberId");
			System.out.println("현재 접속한 회원의 아이디(사업자) : " + buyer_id);
			
			List<TradingVO> list = TradingDAO.getInstance().buyer_transactionProgress( buyer_id );
						
			request.setAttribute("list", list);
			
			RequestDispatcher disp = request.getRequestDispatcher("shop/product_buyer_tp.jsp");
			disp.forward(request, response);
		}
		
	}

}
