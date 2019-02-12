package vo;

public class ProductVO {
	private int p_idx;			// 제품 고유번호
	private String p_register; 	// 등록자
	private String p_company; 	// 제조회사
	private String p_name; 		// 모델명
	private int p_price; 	    // 희망매입가
	private String p_text; 	 	// 내용
	private String p_image_s; // 미리보기이미지
	private String p_image_1; // 이미지 1
	private String p_image_2; // 이미지 2
	private String p_image_3; // 이미지 3
	private String p_image_4; // 이미지 4
	private String p_status;	  // 거래상태
	private String p_regidate;  // 등록일자
	
	public ProductVO() {}
	
	
	public int getP_idx() {
		return p_idx;
	}


	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}


	public String getP_register() {
		return p_register;
	}


	public void setP_register(String p_register) {
		this.p_register = p_register;
	}


	public String getP_company() {
		return p_company;
	}


	public void setP_company(String p_company) {
		this.p_company = p_company;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public int getP_price() {
		return p_price;
	}


	public void setP_price(int p_price) {
		this.p_price = p_price;
	}


	public String getP_text() {
		return p_text;
	}


	public void setP_text(String p_text) {
		this.p_text = p_text;
	}


	public String getP_image_s() {
		return p_image_s;
	}


	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}


	public String getP_image_1() {
		return p_image_1;
	}


	public void setP_image_1(String p_image_1) {
		this.p_image_1 = p_image_1;
	}


	public String getP_image_2() {
		return p_image_2;
	}


	public void setP_image_2(String p_image_2) {
		this.p_image_2 = p_image_2;
	}


	public String getP_image_3() {
		return p_image_3;
	}


	public void setP_image_3(String p_image_3) {
		this.p_image_3 = p_image_3;
	}


	public String getP_image_4() {
		return p_image_4;
	}


	public void setP_image_4(String p_image_4) {
		this.p_image_4 = p_image_4;
	}


	public String getP_status() {
		return p_status;
	}


	public void setP_status(String p_status) {
		this.p_status = p_status;
	}


	public String getP_regidate() {
		return p_regidate;
	}


	public void setP_regidate(String p_regidate) {
		this.p_regidate = p_regidate;
	}


}
