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
import dao.ProductDAO;
import vo.TradingVO;
import vo.ProductVO;

@WebServlet("/product_view.do")
public class Product_View_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx")); // 받아온 상품번호
		
		// 상품번호로 제품 상세내용 가져옴
		ProductVO productVO = ProductDAO.getInstance().selectOne( p_idx );
		
		// 상품번호로 제품 현재 클릭한상품의 매입자 '대기' 상태인 전체 리스트 가져옴 (이 중에서 top3 뽑고, 매도 2번하는지 검사할거임)
		List<TradingVO> list = TradingDAO.getInstance().setectBuyerAll ( p_idx );
		
		// 2번 매입신청 못하게 막는 유효성검사때 필요
		String memberID = (String)session.getAttribute("memberId");	 // 현재 로그인중인아이디
		boolean doNotBuyAgain = false;					 // 구매자목록에 아이디가 있으면 true로 변환
		
		// selectBuyerAll 에서 가져온 매입자 목록 중, 현재 접속중인(나) 회원이 2번 매입하는지 검사
		// 만약 2번 매입하려하면 doNouBuyAgain을 true로 변경해서 request영역에 저장
		// 저장된 값은 product_view.jsp 페이지에서 유효성검사때 쓰임
		for (int i = 0; i < list.size(); i++) {
			// 현재 로그인한 아이디 가 매입자목록에 있는 아이디에 있으면 true 
			if ( memberID.equals(list.get(i).getBuyer_id()) ) {
				doNotBuyAgain = true;
			}
		}
		
		request.setAttribute("vo", productVO);
		request.setAttribute("list", list);
		request.setAttribute("doNotBuyAgain", doNotBuyAgain);
		
		RequestDispatcher disp = request.getRequestDispatcher("shop/product_view.jsp");
		disp.forward(request, response);
	}
}










