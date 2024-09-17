<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.register-container {
	max-width: 400px;
	width: 100%;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.register-container h1 {
	text-align: center;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="register-container">
		<h1>Register</h1>
		<form id="registerForm" action="register" method="post">
			<div class="mb-3">
				<label for="email" class="form-label">Email address</label> <input
					type="email" class="form-control" name="email"
					placeholder="Enter your email" required>
			</div>
			<div class="mb-3">
				<label for="username" class="form-label">Username</label> <input
					type="text" class="form-control" name="username"
					placeholder="Enter your username" required>
			</div>
			<div class="mb-3">
				<label for="fullname" class="form-label">Full Name</label> <input
					type="text" class="form-control" name="fullname"
					placeholder="Enter your full name" required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" name="password"
					placeholder="Enter your password" required>
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">Phone Number</label> <input
					type="text" class="form-control" name="phone"
					placeholder="Enter your phone number" required>
			</div>

			<button type="submit" class="btn btn-primary w-100">Register</button>
		</form>
		<p class="text-center mt-3">
			<a href="/Test/login">Already have an account? Login</a>
		</p>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>