package vo;

public class CommentVO {
	private int			com_idx;			// 댓글(comment)의 고유번호, key
	private int			fb_idx;				// 댓글을 달 원글의 글번호, FREEBOARD 테이블의 글번호(fb_idx) 
	private String		com_comment;		// 댓글 내용
	private String 		com_writer;			// 댓글 작성자(현재 로그인한 sessionScope.memberID 값)
	private String 		com_uploadDate;		// 댓글 작성일

	public CommentVO() {
		
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public int getFb_idx() {
		return fb_idx;
	}

	public void setFb_idx(int fb_idx) {
		this.fb_idx = fb_idx;
	}

	public String getCom_comment() {
		return com_comment;
	}

	public void setCom_comment(String com_comment) {
		this.com_comment = com_comment;
	}

	public String getCom_writer() {
		return com_writer;
	}

	public void setCom_writer(String com_writer) {
		this.com_writer = com_writer;
	}

	public String getCom_uploadDate() {
		return com_uploadDate;
	}

	public void setCom_uploadDate(String com_uploadDate) {
		this.com_uploadDate = com_uploadDate;
	}
	
}

