package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import service.MyBatisConnector;
import vo.TradingVO;

public class TradingDAO {
	private static TradingDAO single = null;
	SqlSessionFactory factory = null;
	
	public static TradingDAO getInstance() {
		if(single == null)
			single = new TradingDAO();
		return single;
	}
	
	public TradingDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	/** ----------------------- 클릭한 제조회사 모델 리스트 조회 (완성) ----------------------- */
	public List<TradingVO> select ( int idx ) {
		List<TradingVO> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList( "trading.p_listall2", idx );
		sqlSession.close();
		
		return list;
	}
	
	/** ----------------------- 매입신청 건 인서트 ----------------------- */
	public void insertTrading ( TradingVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert( "trading.insertTrading", vo );
		sqlSession.commit();
		sqlSession.close();
	}

	/** ----------------------- 상품번호로 제품 현재 클릭한상품의 매입자 리스트 획득 ----------------------- */
	public List<TradingVO> setectBuyerAll ( int p_idx ) {
		List<TradingVO> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList( "trading.selectBuyerAll", p_idx );
		sqlSession.close();
		
		return list;
	}
	
	/**--- 판매자가 입금요청 버튼누르면 TRADING 테이블의 현재 거래의 상태를 '입금대기'로 변경 ---*/
	public void depositWaiting ( int p_idx ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "trading.depositwaiting", p_idx );
		sqlSession.commit();
		sqlSession.close();
	}
	
	/**--- 거래가 성사되지 못한 나머지 매입자들의 상태를 '미체결' 로 변경 ---*/
	public void transactionFail ( TradingVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "trading.transactionFail", vo );
		sqlSession.commit();
		sqlSession.close();
	}

	/** --- TRADING 테이블에서 해당 거래의 상태를 '완료' 로 변경 --- */
	public void transactionComplete ( int p_idx ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "trading.transactionComplete", p_idx );
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	/** ----------------------- [판매자(일반회원)] 상태가 '완료' 인 모든정보 가져오기 (완성) ----------------------- */
	public List<TradingVO> G_getMyDealHistory ( String g_id ) {
		List<TradingVO> vo = null;
		
		SqlSession sqlSession = factory.openSession();
		HashMap<String,String> map = new HashMap<>();
		map.put("g_id", g_id);
		map.put("w1", "완료");
		map.put("w2", "완료");
		
		vo = sqlSession.selectList( "trading.g_deal_progress", map );
		sqlSession.close();
		
		return vo;
	}
	
	/** --- [seller] '입금대기', '대기' 인 거래 건의 모든정보 --- */
	public List<TradingVO> seller_transactionProgress ( String seller_id ) {
		List<TradingVO> vo = null;
		
		SqlSession sqlSession = factory.openSession();
		HashMap<String,String> map = new HashMap<>();
		map.put("seller_id", seller_id);
		map.put("w1", "입금대기");
		map.put("w2", "대기");
		
		vo = sqlSession.selectList( "trading.seller_transaction_progress", map );
		sqlSession.close();
		
		return vo;
	}
	
	/** ----------------------- [buyer] '입금대기', '대기' 인 거래 건의 모든정보 ----------------------- */
	public List<TradingVO> buyer_transactionProgress ( String buyer_id ) {
		List<TradingVO> vo = null;
		
		SqlSession sqlSession = factory.openSession();
		HashMap<String,String> map = new HashMap<>();
		map.put("buyer_id", buyer_id);
		map.put("w1", "입금대기");
		map.put("w2", "대기");
		
		vo = sqlSession.selectList( "trading.buyer_transaction_progress", map );
		sqlSession.close();
		
		return vo;
	}
	
	/** ----------------------- [구매자(사업자회원)] 상태가 '완료', '미체결' 인 모든정보 가져오기 (완성) ----------------------- */
	public List<TradingVO> B_getMyDealHistory ( String b_id ) {
		List<TradingVO> vo = null;
		
		SqlSession sqlSession = factory.openSession();
		HashMap<String,String> map = new HashMap<>();
		map.put("b_id", b_id);
		map.put("w1", "완료");
		map.put("w2", "미체결");
		
		vo = sqlSession.selectList( "trading.b_deal_progress", map );
		sqlSession.close();
		
		return vo;
	}
	
}
