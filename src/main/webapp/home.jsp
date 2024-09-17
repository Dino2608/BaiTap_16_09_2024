<%@page import="Login.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* General styling for topbar */
.topbar {
    background-color: #f8f9fa;
    padding: 10px 0;
    border-bottom: 1px solid #e0e0e0;
}

.topbar .container {
    display: flex;
    justify-content: space-between;
    flex-direction: row
    
}

.topbar .left-topbar,
.topbar .right-topbar {
    list-style: none;
    margin: 0;
    padding: 0;
}

.topbar .left-topbar li,
.topbar .right-topbar li {
    display: inline-block;
    margin-left: 15px;
}

.topbar .left-topbar li a,
.topbar .right-topbar li a {
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
@media (max-width: 768px) {
    .topbar .left-topbar,
    .topbar .right-topbar {
        text-align: center;
        margin-bottom: 10px;
    }

    .topbar .left-topbar li,
    .topbar .right-topbar li {
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
                        <li><a href="<%=request.getContextPath()%>/login">Đăng nhập</a> | 
                            <a href="<%=request.getContextPath()%>/register">Đăng ký</a>
                        </li>
                    <%
                    } else {
                        String fullName = ((UserModel) account).getFullName();
                    %>
                        <li><a href="<%=request.getContextPath()%>/member/myaccount"><%=fullName%></a> | 
                            <a href="<%=request.getContextPath()%>/logout">Đăng Xuất</a>
                        </li>
                    <%
                    }
                    %>
                    <li><i class="fa fa-search search-button"></i></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>