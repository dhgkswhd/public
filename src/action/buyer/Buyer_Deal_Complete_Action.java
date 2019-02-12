package action.buyer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BuyerDAO;
import dao.ProductDAO;
import dao.SellerDAO;
import dao.TradingDAO;
import vo.BuyerVO;

@WebServlet("/deal_complete.do")
public class Buyer_Deal_Complete_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int 		  p_idx = Integer.parseInt( request.getParameter("p_idx") ); 		  // 상품 고유번호
		String    seller_id = request.getParameter("seller_id"); 						  // 판매자 아이디
		String 	   buyer_id = request.getParameter("buyer_id");							  // 구매자 아이디
		int buyer_hopeprice = Integer.parseInt( request.getParameter("buyer_hopeprice") );// 거래체결될 가격
		
		Map<String, Object> map = new HashMap<>();
		map.put("p_idx", p_idx);
		map.put("seller_id", seller_id);
		map.put("buyer_id", buyer_id);
		map.put("money", buyer_hopeprice);
		
		/*System.out.println("상품번호 : " + p_idx);
		System.out.println("판매자 아이디 : " + seller_id);
		System.out.println("구매자 아이디 : " + buyer_id);
		System.out.println("거래체결가 : " + buyer_hopeprice); */
		
		// TRADING 테이블에서 해당 거래의 상태를 '완료' 로 변경
		TradingDAO.getInstance().transactionComplete( p_idx );
		
		// PRODUCT 테이블에서 해당 거래의 상태를 '완료' 로 변경
		ProductDAO.getInstance().transactionComplete( p_idx );
		
		// SELLER 지갑에 돈 넣어줌
		SellerDAO.getInstance().getMoney( map );
		
		// BUYER 지갑에서 돈 빼감
		BuyerDAO.getInstance().dropMoney( map );
		
		Map<String, String> buyerMoney = new HashMap<>();
		buyerMoney.put("id", buyer_id);									   // 구매자 아이디
		buyerMoney.put("pwd", (String)session.getAttribute("memberPwd"));  // 구매자 비밀번호
		
		// 세션에서 다시 현재 보유머니 가져옴 (화면에서 보여줄 때 새로고침 하기 위함)
		// 기존에 있던 로그인 쿼리문 재활용하여 회원정보 다시 가져옴
		BuyerVO vo = BuyerDAO.getInstance().getUserData( buyerMoney );
	
		// 지갑 새로고침을 위해 현재 세션에 저장된 값 제거하고 다시 저장
		session.removeAttribute("memberWallet");
		session.setAttribute("memberWallet", vo.getBuyer_wallet());
		
		response.sendRedirect("product_list_input.do");
		
	}

}
