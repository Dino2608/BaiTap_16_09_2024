package services;

import dao.UserDao;
import dao.UserDaoImpl;
import models.UserModel;

public class UserServiceImpl implements UserService {
	UserDao userDao = new UserDaoImpl();

	@Override
	public UserModel login(String username, String password) {
		UserModel user = this.findByUserName(username);
		if (user != null && password.equals(user.getPassWord())) {
			return user;
		}
		return null;
	}

	private UserModel findByUserName(String username) {
		return userDao.findByUserName(username);
	}

	@Override
	public UserModel get(String username) {
		return userDao.get(username);
	}

	@Override
	public boolean register(String username, String password, String email, String fullname, String phone) {
		if (userDao.checkExistUsername(username)) {
			return false;
		}
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		userDao.insert(new UserModel(email, username, fullname, password, null, 5, phone, date));
		return true;
	}

	@Override
	public boolean checkExistEmail(String email) {
		return userDao.checkExistEmail(email);
	}

	@Override
	public boolean checkExistUsername(String username) {
		return userDao.checkExistUsername(username);
	}

	@Override
	public boolean checkExistPhone(String phone) {
		return userDao.checkExistPhone(phone);
	}

	@Override
	public void insert(UserModel user) {
		userDao.insert(user);
	}

	@Override
	public void updatePassword(String username, String password) {
		userDao.updatePassword(username, password);

	}
}