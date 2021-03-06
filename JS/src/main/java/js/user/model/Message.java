package js.user.model;

public class Message {

	private int message_id;
	private String member_id;
	private String member_receiver;
	private String message_content;
	private String message_picture;
	private String message_profil_pic;
	private String message_send_date;

	public Message() {

	}
	
	

	public Message(int message_id, String member_id, String member_receiver, String message_content,
			String message_picture, String message_profil_pic, String message_send_date) {
		super();
		this.message_id = message_id;
		this.member_id = member_id;
		this.member_receiver = member_receiver;
		this.message_content = message_content;
		this.message_picture = message_picture;
		this.message_profil_pic = message_profil_pic;
		this.message_send_date = message_send_date;
	}



	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_receiver() {
		return member_receiver;
	}

	public void setMember_receiver(String member_receiver) {
		this.member_receiver = member_receiver;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public String getMessage_picture() {
		return message_picture;
	}

	public void setMessage_picture(String message_picture) {
		this.message_picture = message_picture;
	}

	public String getMessage_profil_pic() {
		return message_profil_pic;
	}

	public void setMessage_profil_pic(String message_profil_pic) {
		this.message_profil_pic = message_profil_pic;
	}

	public String getMessage_send_date() {
		return message_send_date;
	}

	public void setMessage_send_date(String message_send_date) {
		this.message_send_date = message_send_date;
	}

	

}
