package js.admin.model;

import java.util.Date;

public class Notice {
	
	private int notice_id;	
	private String member_id;
	private String notice_title;
	private String notice_content;
	private String notice_img;
	private String notice_date;
		

	public Notice() {

	}
	
	
	public Notice(int notice_id, String member_id, String notice_title, String notice_content,
			String notice_img, String notice_date) {
		super();
		this.notice_id = notice_id;
		this.member_id = member_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_img = notice_img;
		this.notice_date = notice_date;
	
	}


	public int getNotice_id() {
		return notice_id;
	}


	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}


	public String getNotice_content() {
		return notice_content;
	}


	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	
	public String getNotice_img() {
		return notice_img;
	}


	public void setNotice_img(String notice_img) {
		this.notice_img = notice_img;
	}


	public String getNotice_date() {
		return notice_date;
	}


	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}



	
}
