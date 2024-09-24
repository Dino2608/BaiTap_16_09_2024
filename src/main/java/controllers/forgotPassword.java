package controllers;

import java.io.IOException;

import dao.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserService;
import services.UserServiceImpl;

@WebServlet(urlPatterns = "/forgotPassword")
public class forgotPassword extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/forgotPassword.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean checkUsername = new UserDaoImpl().checkExistUsername(username);
        if (checkUsername) {
        	UserService service = new UserServiceImpl();
        	service.updatePassword(username, password);
        	response.sendRedirect(request.getContextPath() + "/login");
        }else {
        	response.getWriter().write("{\"success\": false, \"message\": \"Username not found\"}");
        }
	}

}
