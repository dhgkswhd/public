package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.TradingVO;
import vo.ProductVO;

public class ProductDAO {
	private static ProductDAO single = null;
	SqlSessionFactory factory = null;
	
	public static ProductDAO getInstance() {
		if(single == null)
			single = new ProductDAO();
		return single;
	}
	
	public ProductDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	/** ----------------------- 클릭한 제조회사 리스트 조회 (완성) ----------------------- */
	public List<ProductVO> select ( String p_company ) {
		List<ProductVO> list = null;
		SqlSession sqlSession = factory.openSession();
		
		if ( p_company.equals("all") ) {
			list = sqlSession.selectList( "product.p_listall", p_company );
		}
		else {
			list = sqlSession.selectList( "product.p_list", p_company );
		}
		
		sqlSession.close();
		
		return list;
	}
	
	/** --- 상품 등록 --- */
	public void insertProduct ( ProductVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert( "product.insertProduct", vo );
		sqlSession.commit();
		sqlSession.close();
	}
	
	/** ----------------------- 상품 삭제 (만들어야함) ----------------------- */
	/*public void delete ( String p_idx ) {
		int res;
		SqlSession sqlSession = factory.openSession();
		res = sqlSession.delete("product.product_delete", p_idx);
		System.out.println("삭제결과 : " + res);
		sqlSession.commit();
		sqlSession.close();
	} */
	
	/** --- 클릭한 상품 상세보기 --- */
	public ProductVO selectOne ( int p_idx ) {
		ProductVO vo = null;
		
		SqlSession sqlSession = factory.openSession();
		vo = (ProductVO) sqlSession.selectOne( "product.selectOne", p_idx );
		sqlSession.close();
		
		return vo;
	}
	
	/** --- PRODUCT 테이블에서 해당 거래의 상태를 '완료' 로 변경 --- */
	public void transactionComplete( int p_idx ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "product.transactionComplete", p_idx );
		sqlSession.commit();
		sqlSession.close();
	}

	/** --- 판매자가 입금요청 버튼누르면 TRADING 테이블의 현재 거래의 상태를 '거래중'으로 변경 --- */
	public void depositWaiting ( int p_idx ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "product.depositwaiting", p_idx );
		sqlSession.commit();
		sqlSession.close();
	}

	
	/** ----------------------- 전체 게시물 개수 ----------------------- */
	public int selectCount() {
		SqlSession sqlSession = factory.openSession();
		int count = (int)sqlSession.selectOne("product.count");
		sqlSession.close();
		
		return count;
	}

	/** ----------------------- 오버로딩된 select 메서드 ----------------------- */
	public List<ProductVO> select ( HashMap<String, String> map ) {
		List<ProductVO> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("product.paginglist", map);
		sqlSession.close();
		
		return list;
	}
}













