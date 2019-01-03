package js.admin.model;



public class Member {
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_birthday;
	private String member_gender;
	private String member_phone;
	private int member_trip_exp;
	private String member_register_date;
	// 비밀번호 업데이트 날짜
	private String member_updatePassword_date;
	// 연락처 업데이트 날짜
	private String member_updatePhoneNum_date;
	// 이메일 업데이트 날짜
	private String member_updateEmail_date;
	// 주소 업데이트 날짜
	private String member_updateAddress_date;
	// 프로필사진 업데이트 날짜
	private String member_updateProfile_date;
	
	private String member_profile_pic;
	private String member_email;
	private String member_Zip_code;
	private String member_Street_name_address;
	private String member_Detailed_Address;
	// 0 이면 사용자 1이면 어드민
	private int member_type;
	public Member() {

	}
	
	
	public Member(String member_id, String member_password, String member_name, String member_birthday,
			String member_gender, String member_phone, int member_trip_exp, String member_register_date,
			String member_updatePassword_date, String member_updatePhoneNum_date, String member_updateEmail_date,
			String member_updateAddress_date, String member_updateProfile_date, String member_profile_pic,
			String member_email, String member_Zip_code, String member_Street_name_address,
			String member_Detailed_Address, int member_type) {
		super();
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_name = member_name;
		this.member_birthday = member_birthday;
		this.member_gender = member_gender;
		this.member_phone = member_phone;
		this.member_trip_exp = member_trip_exp;
		this.member_register_date = member_register_date;
		this.member_updatePassword_date = member_updatePassword_date;
		this.member_updatePhoneNum_date = member_updatePhoneNum_date;
		this.member_updateEmail_date = member_updateEmail_date;
		this.member_updateAddress_date = member_updateAddress_date;
		this.member_updateProfile_date = member_updateProfile_date;
		this.member_profile_pic = member_profile_pic;
		this.member_email = member_email;
		this.member_Zip_code = member_Zip_code;
		this.member_Street_name_address = member_Street_name_address;
		this.member_Detailed_Address = member_Detailed_Address;
		this.member_type = member_type;
	}


	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getMember_trip_exp() {
		return member_trip_exp;
	}
	public void setMember_trip_exp(int member_trip_exp) {
		this.member_trip_exp = member_trip_exp;
	}
	public String getMember_register_date() {
		return member_register_date;
	}
	public void setMember_register_date(String member_register_date) {
		this.member_register_date = member_register_date;
	}
	public String getMember_updatePassword_date() {
		return member_updatePassword_date;
	}
	public void setMember_updatePassword_date(String member_updatePassword_date) {
		this.member_updatePassword_date = member_updatePassword_date;
	}
	public String getMember_updatePhoneNum_date() {
		return member_updatePhoneNum_date;
	}
	public void setMember_updatePhoneNum_date(String member_updatePhoneNum_date) {
		this.member_updatePhoneNum_date = member_updatePhoneNum_date;
	}
	public String getMember_updateEmail_date() {
		return member_updateEmail_date;
	}
	public void setMember_updateEmail_date(String member_updateEmail_date) {
		this.member_updateEmail_date = member_updateEmail_date;
	}
	public String getMember_updateAddress_date() {
		return member_updateAddress_date;
	}
	public void setMember_updateAddress_date(String member_updateAddress_date) {
		this.member_updateAddress_date = member_updateAddress_date;
	}
	public String getMember_updateProfile_date() {
		return member_updateProfile_date;
	}
	public void setMember_updateProfile_date(String member_updateProfile_date) {
		this.member_updateProfile_date = member_updateProfile_date;
	}
	public String getMember_profile_pic() {
		return member_profile_pic;
	}
	public void setMember_profile_pic(String member_profile_pic) {
		this.member_profile_pic = member_profile_pic;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_Zip_code() {
		return member_Zip_code;
	}
	public void setMember_Zip_code(String member_Zip_code) {
		this.member_Zip_code = member_Zip_code;
	}
	public String getMember_Street_name_address() {
		return member_Street_name_address;
	}
	public void setMember_Street_name_address(String member_Street_name_address) {
		this.member_Street_name_address = member_Street_name_address;
	}
	public String getMember_Detailed_Address() {
		return member_Detailed_Address;
	}
	public void setMember_Detailed_Address(String member_Detailed_Address) {
		this.member_Detailed_Address = member_Detailed_Address;
	}
	public int getMember_type() {
		return member_type;
	}
	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}
	
	
}
