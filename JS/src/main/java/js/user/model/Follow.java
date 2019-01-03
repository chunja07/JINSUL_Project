package js.user.model;

public class Follow {
		private String follower_id;
		private String followed_id;
		private String relationship;
		
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
		public String getRelationship() {
			return relationship;
		}
		public void setRelationship(String relationship) {
			this.relationship = relationship;
		}
		
		public Follow() {}
		
		public Follow(String follower_id, String followed_id, String relationship) {
			
			this.follower_id = follower_id;
			this.followed_id = followed_id;
			this.relationship = relationship;
		}
		
		
}
