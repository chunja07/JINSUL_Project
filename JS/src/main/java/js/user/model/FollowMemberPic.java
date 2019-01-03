package js.user.model;

public class FollowMemberPic {
	private String follower_id;
	private String followed_id;
	private String member_profile_pic;
	
	public String getFollower_id() {
		return follower_id;
	}
	public void setFollower_id(String follower_id) {
		this.follower_id = follower_id;
	}
	public String getFollowed_id() {
		return followed_id;
	}
	public void setFollowed_id(String followed_id) {
		this.followed_id = followed_id;
	}
	public String getMember_profile_pic() {
		return member_profile_pic;
	}
	public void setMember_profile_pic(String member_profile_pic) {
		this.member_profile_pic = member_profile_pic;
	}
	
	
}
