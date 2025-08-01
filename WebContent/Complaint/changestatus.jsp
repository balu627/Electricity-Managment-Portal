<%@ page session="true" %>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0);
String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");
if (user == null || !"admin".equals(role)) {
    response.sendRedirect("login.jsp");
    return;
}
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, bean.ComplaintRegistration" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Complaint Status</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
<style>
body {
    font-family: 'Bree Serif', serif;
    margin: 0;
    padding: 0;
    height: 100vh;
    background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}
.topbar {
    background-color: #004466;
    color: white;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.menu {
    display: flex;
    align-items: center;
}
.menu > div {
    position: relative;
    margin-right: 20px;
}
.menu a {
    color: white;
    text-decoration: none;
    font-weight: bold;
    padding: 10px 15px;
    display: inline-block;
}
.menu a:hover {
    background-color: #006699;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
.dropdown-content a {
    color: #004466;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
.dropdown-content a:hover {
    background-color: #ddd;
}
.dropdown:hover .dropdown-content {
    display: block;
}
.user-info {
    display: flex;
    align-items: center;
}
.user-info span {
    margin-right: 15px;
    font-weight: bold;
}
.user-info button {
    padding: 6px 12px;
    background-color: #ff4d4d;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.user-info button:hover {
    background-color: #e60000;
}
.content-box {
    background-color: rgba(255, 255, 255, 0.95);
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3);
    text-align: center;
    width: 400px;
    margin: 50px auto;
}
h2 {
    color: #2e4053;
    margin-bottom: 20px;
}
input[type="text"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    font-size: 16px;
}
input[type="submit"] {
    background-color: #2e4053;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
}
input[type="submit"]:hover {
    background-color: #2980b9;
}
</style>
</head>
<body>
<jsp:include page="/shared/adminheader.jsp" />
</div>
<div class="content-box">
    <h2>Change Complaint Status</h2>
    <form method="post" action="changestatus">
        <input type="text" name="complaintId" placeholder="Enter Complaint ID" required />
        <input type="submit" value="Search" />
    </form>
</div>
<script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>
</body>
</html>
