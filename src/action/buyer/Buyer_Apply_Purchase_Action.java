package action.buyer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BuyerDAO;
import dao.TradingDAO;
import vo.TradingVO;

@WebServlet("/apply_purchase.do")
public class Buyer_Apply_Purchase_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* 사업자회원 매입신청하기 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int   	   		  p_idx = Integer.parseInt( request.getParameter("p_idx") ); 		  // 제품고유번호
		String 		  p_image_s = request.getParameter("p_image_s");		   	  	  		  // 미리보기이미지
		String    		 p_name = request.getParameter("p_name");			   		  		  // 제품명
		
		String 		  seller_id = request.getParameter("seller_id"); 				  	 	  // 판매자
		int    seller_hopeprice = Integer.parseInt(request.getParameter("seller_hopeprice")); // 판매희망가
		String 		   buyer_id = request.getParameter("buyer_id"); 				  		  // 구매자
		int     buyer_hopeprice = Integer.parseInt(request.getParameter("buyer_hopeprice"));  // 구매희망가
				
		System.out.println("제품고유번호 : " + p_idx);
		System.out.println("판매자 : " + seller_id);
		System.out.println("판매자 판매희망가격 : " + seller_hopeprice);
		System.out.println("구매자 : " + buyer_id);
		System.out.println("구매희망가 : " + buyer_hopeprice);
		System.out.println("상품매입신청자 : " + buyer_id);
		System.out.println("이미지명 : " + p_image_s);
		System.out.println("상품명 : " + p_name);
		
		
		TradingVO vo = new TradingVO();
		vo.setP_idx( p_idx );
		vo.setP_image_s( p_image_s );
		vo.setP_name( p_name );
		vo.setSeller_id( seller_id );
		vo.setSeller_hopeprice( seller_hopeprice );
		vo.setBuyer_id( buyer_id );
		vo.setBuyer_hopeprice( buyer_hopeprice );
		
		// Trading 테이블에 인서트
		TradingDAO.getInstance().insertTrading( vo );
		
		RequestDispatcher disp = request.getRequestDispatcher("product_list_input.do");
		disp.forward(request, response);
		
	}

}
