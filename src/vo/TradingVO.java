package vo;

public class TradingVO {
	private int t_idx;				// trading 테이블 고유번호
	private int p_idx;  			// 제품 고유번호
	private String p_image_s;		// 제품 이미지(미리보기)
	private String p_name;			// 제품명
	private String buyer_id;		// 구매자 아이디
	private int buyer_hopeprice;	// 구매자 희망매입가
	private String seller_id;		// 판매자 아이디
	private int seller_hopeprice;   // 판매자 희망매입가
	private String t_status;		// 상태
	private String t_regidate;		// 등록일자
	
	public TradingVO() {}
	
	public int getT_idx() {
		return t_idx;
	}


	public void setT_idx(int t_idx) {
		this.t_idx = t_idx;
	}


	public int getP_idx() {
		return p_idx;
	}


	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}


	public String getP_image_s() {
		return p_image_s;
	}


	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getBuyer_id() {
		return buyer_id;
	}


	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}


	public int getBuyer_hopeprice() {
		return buyer_hopeprice;
	}


	public void setBuyer_hopeprice(int buyer_hopeprice) {
		this.buyer_hopeprice = buyer_hopeprice;
	}


	public String getSeller_id() {
		return seller_id;
	}


	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}


	public int getSeller_hopeprice() {
		return seller_hopeprice;
	}


	public void setSeller_hopeprice(int seller_hopeprice) {
		this.seller_hopeprice = seller_hopeprice;
	}


	public String getT_status() {
		return t_status;
	}


	public void setT_status(String t_status) {
		this.t_status = t_status;
	}


	public String getT_regidate() {
		return t_regidate;
	}


	public void setT_regidate(String t_regidate) {
		this.t_regidate = t_regidate;
	}

}
