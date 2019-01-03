package js.user.model;

public class Comment {    
    private int comment_id;
	private int content_id;
	private int comment_parents_id;
	private int comment_seq;
	private int comment_depth;
	private String comment_content;
	
	public Comment() {
		
	}
	public Comment(int comment_id, int content_id, int comment_parents_id, int comment_seq, int comment_depth,
			String comment_content) {
		super();
		this.comment_id = comment_id;
		this.content_id = content_id;
		this.comment_parents_id = comment_parents_id;
		this.comment_seq = comment_seq;
		this.comment_depth = comment_depth;
		this.comment_content = comment_content;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}

	public int getComment_parents_id() {
		return comment_parents_id;
	}

	public void setComment_parents_id(int comment_parents_id) {
		this.comment_parents_id = comment_parents_id;
	}

	public int getComment_seq() {
		return comment_seq;
	}

	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}

	public int getComment_depth() {
		return comment_depth;
	}

	public void setComment_depth(int comment_depth) {
		this.comment_depth = comment_depth;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	
	
	
}
