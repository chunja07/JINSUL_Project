package js.user.model;

public class memberUpdate {

	private String current_member_password;
	private String new_member_password;
	private String new_member_password_chk;
	private String member_id;
	private String member_updatePassword_date;
	// 비밀번호 찾기에서 사용
	private String member_email;

	public memberUpdate() {

	}

	public memberUpdate(String current_member_password, String new_member_password, String new_member_password_chk,
			String member_id, String member_updatePassword_date, String member_email) {
		super();
		this.current_member_password = current_member_password;
		this.new_member_password = new_member_password;
		this.new_member_password_chk = new_member_password_chk;
		this.member_id = member_id;
		this.member_updatePassword_date = member_updatePassword_date;
		this.member_email = member_email;
	}

	public String getCurrent_member_password() {
		return current_member_password;
	}

	public void setCurrent_member_password(String current_member_password) {
		this.current_member_password = current_member_password;
	}

	public String getNew_member_password() {
		return new_member_password;
	}

	public void setNew_member_password(String new_member_password) {
		this.new_member_password = new_member_password;
	}

	public String getNew_member_password_chk() {
		return new_member_password_chk;
	}

	public void setNew_member_password_chk(String new_member_password_chk) {
		this.new_member_password_chk = new_member_password_chk;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_updatePassword_date() {
		return member_updatePassword_date;
	}

	public void setMember_updatePassword_date(String member_updatePassword_date) {
		this.member_updatePassword_date = member_updatePassword_date;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

}
