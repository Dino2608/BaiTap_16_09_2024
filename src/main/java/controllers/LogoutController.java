package controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/logout")
public class LogoutController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. Xóa session
		HttpSession session = request.getSession(); // Get current session without creating new one
		session.invalidate(); // Xóa toàn bộ session

		// 2. Xóa cookies
		Cookie cookie = null;
		Cookie[] cookies = null;
		cookies = request.getCookies();
		for (Cookie element : cookies) {
            cookie = element;
			cookie.setMaxAge(0); // Xóa cookie
			response.addCookie(cookie); // Thêm cookie đã chỉnh sửa vào phản hồi để xóa
		}

		// 3. Chuyển hướng về trang login
		response.sendRedirect(request.getContextPath() + "/login");
	}
}
