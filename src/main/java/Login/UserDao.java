package Login;

public interface UserDao {
	UserModel get(String username);
	
	UserModel findByUserName(String username);

	void updatePassword(String username, String password);
	
	void insert(UserModel user);

	boolean checkExistEmail(String email);

	boolean checkExistUsername(String username);

	boolean checkExistPhone(String phone);
}
