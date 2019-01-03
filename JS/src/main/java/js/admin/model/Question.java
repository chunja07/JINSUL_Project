package js.admin.model;

import java.util.Date;

public class Question {
	
	private int question_id;	
	private String member_id;
	private String question_title;
	private String question_content;
	private String question_date;
		

	public Question() {

	}
	
	
	public Question(int question_id, String member_id, String question_title, String question_content,
		String question_date) {
		super();
		this.question_id = question_id;
		this.member_id = member_id;
		this.question_title = question_title;
		this.question_content = question_content;
		this.question_date = question_date;
	
	}


	public int getQuestion_id() {
		return question_id;
	}


	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getQuestion_title() {
		return question_title;
	}


	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}


	public String getQuestion_content() {
		return question_content;
	}


	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}


	public String getQuestion_date() {
		return question_date;
	}


	public void setQuestion_date(String question_date) {
		this.question_date = question_date;
	}


	

	
}
