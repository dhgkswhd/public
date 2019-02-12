package vo;

public class BuyerVO {
	private int buyer_idx;				 // 사업자회원 고객번호
	private String buyer_id;			 // 사업자회원 아이디
	private String buyer_pwd;			 // 사업자회원 비밀번호
	private String buyer_phonenumber;			 // 사업자회원 연락처
	private String buyer_businessnumber; // 사업자회원 사업자번호
	private String buyer_mutualname;	 // 사업자회원 상호명
	private int buyer_wallet;			 // 사업자회원 보유한 머니 (처음에 x만원지급)
	private String buyer_joindate;
	
	public BuyerVO() {}

	public int getBuyer_idx() {
		return buyer_idx;
	}

	public void setBuyer_idx(int buyer_idx) {
		this.buyer_idx = buyer_idx;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getBuyer_pwd() {
		return buyer_pwd;
	}

	public void setBuyer_pwd(String buyer_pwd) {
		this.buyer_pwd = buyer_pwd;
	}

	public String getBuyer_phonenumber() {
		return buyer_phonenumber;
	}

	public void setBuyer_phonenumber(String buyer_phonenumber) {
		this.buyer_phonenumber = buyer_phonenumber;
	}

	public String getBuyer_businessnumber() {
		return buyer_businessnumber;
	}

	public void setBuyer_businessnumber(String buyer_businessnumber) {
		this.buyer_businessnumber = buyer_businessnumber;
	}

	public String getBuyer_mutualname() {
		return buyer_mutualname;
	}

	public void setBuyer_mutualname(String buyer_mutualname) {
		this.buyer_mutualname = buyer_mutualname;
	}

	public int getBuyer_wallet() {
		return buyer_wallet;
	}

	public void setBuyer_wallet(int buyer_wallet) {
		this.buyer_wallet = buyer_wallet;
	}

	public String getBuyer_joindate() {
		return buyer_joindate;
	}

	public void setBuyer_joindate(String buyer_joindate) {
		this.buyer_joindate = buyer_joindate;
	}
	
	

}
