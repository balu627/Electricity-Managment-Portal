<%@ page session="true" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Registration Successful</title>
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
    
    .success-container {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }
    
    .success-box {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      width: 500px;
      max-width: 100%;
      padding: 40px;
      text-align: center;
    }
    
    .success-icon {
      font-size: 60px;
      color: #4CAF50;
      margin-bottom: 20px;
    }
    
    .success-box h2 {
      font-size: 24px;
      font-weight: 700;
      color: #333;
      margin-bottom: 20px;
    }
    
    .success-details {
      text-align: left;
      margin: 25px 0;
      padding: 20px;
      background: #f8f9fa;
      border-radius: 5px;
    }
    
    .success-details p {
      margin-bottom: 10px;
    }
    
    .success-details strong {
      display: inline-block;
      width: 120px;
    }
    
    .login-button {
      display: inline-block;
      background: #007bff;
      color: white;
      text-decoration: none;
      padding: 12px 30px;
      border-radius: 5px;
      font-weight: 600;
      transition: background 0.3s;
      margin-top: 20px;
    }
    
    .login-button:hover {
      background: #0056b3;
    }
  </style>
</head>
<body>
  <div class="success-container">
    <div class="success-box">
      <div class="success-icon">
        <i class="zmdi zmdi-check-circle"></i>
      </div>
      <h2>Registration Successful!</h2>
      
      <div class="success-details">
        <p><strong>Customer Number:</strong> ${CUSTOMER_ID}</p>
        <p><strong>Name:</strong> ${custName}</p>
        <p><strong>Email:</strong> ${email}</p>
        <p><strong>User ID:</strong> ${userId}</p>
      </div>
      
      <p>Your account has been successfully created.</p>
      <a href="login.jsp" class="login-button">Proceed to Login</a>
    </div>
  </div>
</body>
</html> 