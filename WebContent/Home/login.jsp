<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0);

String user = (String) session.getAttribute("user");
if (user != null) {
	response.sendRedirect(request.getContextPath() + "/Home/home.jsp");
    return;
}
    
    String custName = (String) session.getAttribute("custName");
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Electricity Portal Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      background: #f2f2f2;
      color: #333;
      line-height: 1.6;
      background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
      height: 100vh;
    }
    
    .main {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }
    
    .container {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      width: 500px;
      max-width: 100%;
      padding: 40px;
    }
    
    .login-form {
      width: 100%;
    }
    
    .form-title {
      font-size: 24px;
      font-weight: 700;
      color: #333;
      margin-bottom: 30px;
      text-align: center;
    }
    
    .form-group {
      margin-bottom: 20px;
      position: relative;
    }
    
    .form-group label {
      position: absolute;
      left: 10px;
      top: 50%;
      transform: translateY(-50%);
      color: #666;
    }
    
    .form-group input, .form-group select {
      width: 100%;
      padding: 10px 10px 10px 35px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
      outline: none;
      transition: all 0.3s;
    }
    
    .form-group input:focus {
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
    }
    
    .form-button {
      text-align: center;
      margin-top: 30px;
    }
    
    .form-submit {
      background: #007bff;
      color: white;
      border: none;
      padding: 12px 30px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      font-weight: 600;
      transition: background 0.3s;
    }
    
    .form-submit:hover {
      background: #0056b3;
    }
    
    .error-message {
      color: red;
      text-align: center;
      margin-bottom: 15px;
    }
    
    .register-link {
      text-align: center;
      margin-top: 20px;
    }
    
    .register-link a {
      color: #007bff;
      text-decoration: none;
      font-weight: 600;
    }
    
    .user-type {
      margin-bottom: 20px;
    }
    
    .user-type label {
      margin-right: 15px;
    }
  </style>
</head>
<body>
  <div class="main">
    <div class="container">
      <form method="post" action="<%=request.getContextPath()%>/LoginServlet" class="login-form" id="loginForm">
        <h2 class="form-title">Electricity Portal Login</h2>
        
        <% if(request.getAttribute("errorMessage") != null) { %>
          <div class="error-message">
            <%= request.getAttribute("errorMessage") %>
          </div>
        <% } %>
        
        <div class="user-type">
          <label>
            <input type="radio" name="userType" value="consumer" checked> Consumer
          </label>
          <label>
            <input type="radio" name="userType" value="admin"> Admin
          </label>
        </div>
        
        <div class="form-group">
          <label for="userId"><i class="zmdi zmdi-account-circle"></i></label>
          <input type="text" name="userId" id="userId" placeholder="User ID"pattern="^\S{5,20}$" minlength="5" maxlength="20" required />
        </div>
        
        <div class="form-group">
          <label for="password"><i class="zmdi zmdi-lock"></i></label>
          <input type="text" name="password" id="password" placeholder="Password" maxlength ="30" required />
        </div>
        
        <div class="form-button">
          <input type="submit" name="login" id="login" class="form-submit" value="Login" />
        </div>
      </form>
      
      <div class="register-link">
        <p>Don't have an account? <a href="consumer_register.jsp">Register here</a></p>
      </div>
    </div>
  </div>
</body>
</html> 