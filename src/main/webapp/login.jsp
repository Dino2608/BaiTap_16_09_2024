<%@page import="Login.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.login {
	display: flex;
	margin-top: 100px;
	justify-content: center;
	align-items: center;
}

.login-container {
	max-width: 400px;
	width: 100%;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.login-container h1 {
	text-align: center;
	margin-bottom: 20px;
}
/* General styling for topbar */
.topbar {
	background-color: #f8f9fa;
	padding: 10px 0;
	border-bottom: 1px solid #e0e0e0;
}

.topbar .container {
	display: flex;
	justify-content: space-between;
	flex-direction: row;
	positon: relative;
	top: 0px;
	left: 0px;
}

.topbar .left-topbar, .topbar .right-topbar {
	list-style: none;
	margin: 0;
	padding: 0;
}

.topbar .left-topbar li, .topbar .right-topbar li {
	display: inline-block;
	margin-left: 15px;
}

.topbar .left-topbar li a, .topbar .right-topbar li a {
	color: #000;
	text-decoration: none;
	font-weight: bold;
}

.topbar .right-topbar li a:hover {
	text-decoration: underline;
}

.topbar .search-button {
	color: #333;
	font-size: 16px;
	cursor: pointer;
	margin-left: 15px;
}

/* Style for icons and positioning */
.topbar .fa-search {
	color: #333;
}

/* Responsiveness for smaller screens */
@media ( max-width : 768px) {
	.topbar .left-topbar, .topbar .right-topbar {
		text-align: center;
		margin-bottom: 10px;
	}
	.topbar .left-topbar li, .topbar .right-topbar li {
		display: block;
		margin-left: 0;
		margin-bottom: 10px;
	}
}
</style>
</head>
<body>
	<%
	// Kiểm tra xem người dùng đã đăng nhập hay chưa
	Object account = session.getAttribute("account");
	%>
	<div class="topbar">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<ul class="list-inline left-topbar">
						<li><a href="#">Support</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="col-sm-6">
					<ul class="list-inline right-topbar pull-right">
						<%
						if (account == null) {
						%>
						<li><a href="<%=request.getContextPath()%>/login">Đăng
								nhập</a> | <a href="<%=request.getContextPath()%>/register">Đăng
								ký</a></li>
						<%
						} else {
						String fullName = ((UserModel) account).getFullName();
						%>
						<li><a href="<%=request.getContextPath()%>/member/myaccount"><%=fullName%></a>
							| <a href="<%=request.getContextPath()%>/logout">Đăng Xuất</a></li>
						<%
						}
						%>
						<li><i class="fa fa-search search-button"></i></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class=login>
		<div class="login-container">
			<h1>Login</h1>
			<form id="loginForm" method="post">
				<div class="mb-3">
					<label for="username" class="form-label">Username</label> <input
						type="text" class="form-control" name="username"
						placeholder="Enter your username" required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						type="password" class="form-control" name="password"
						placeholder="Enter your password" required>
				</div>
				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input" id="rememberMe">
					<label class="form-check-label" for="rememberMe">Remember
						me</label>
				</div>
				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>
			<p class="text-center mt-3">
				<a href="/Test/forgotPassword">Forgot your password?</a>
			</p>
		</div>
	</div>
</body>
</html>
