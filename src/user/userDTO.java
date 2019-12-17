package user;

public class userDTO {

	

		String id=null;
		String userPassword=null;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getUserPassword() {
			return userPassword;
		}
		public void setUserPassword(String userPassword) {
			this.userPassword = userPassword;
		}
		
		public userDTO() {
			
		}
		
		public userDTO(String id, String userPassword) {
			super();
			this.id = id;
			this.userPassword = userPassword;
		}
		
		

}
