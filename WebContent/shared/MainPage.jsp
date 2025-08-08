<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Electricity Billing System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f0f4f8;
        }
        .navbar {
            background-color: #004466;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h2 {
            color: white;
            margin: 0;
        }
        .navbar a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
        }
        .navbar a:hover {
            text-decoration: none;
        }
        .hero {
            background-image: url("./Media/MainImage.jpg");

            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.7);
            font-size: 32px;
            font-weight: bold;
        }
        .content {
            max-width: 1000px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .step {
            margin-bottom: 20px;
        }
        .step h3 {
            color: #004466;
            margin-bottom: 10px;
        }
        .step p {
            font-size: 16px;
            line-height: 1.5;
        }
        .image-row {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        .image-row img {
            width: 32%;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        .footer {
            text-align: center;
            padding: 20px;
            background: #004466;
            color: white;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h2><a href="<%=request.getContextPath()%>/">Electricity Billing Portal</a></h2>
    <div>
        <a href="Home/login.jsp">Login</a>
        <a href="Home/consumer_register.jsp">Register</a>
        <a href="shared/connection_request.jsp">Get Electricity Connection</a>
    </div>
</div>

<div class="hero">
    Welcome to Your Electricity Billing System
</div>

<div class="content">
    <h2 style="text-align:center; color:#2c3e50;">How It Works</h2>

    <div class="step">
        <h3>Step 1: Establish Connection</h3>
        <p>
            Click on <strong>"Establish Connection"</strong> and fill out your basic information like name, email, mobile number, and address.
            Our team will review the request. Once approved by the admin, you’ll receive a <strong>unique Consumer Number</strong> via email.
        </p>
    </div>

    <div class="step">
        <h3>Step 2: Register</h3>
        <p>
            After receiving the Consumer Number, click on the <strong>"Register"</strong> link to create your account using that number and other details.
        </p>
    </div>

    <div class="step">
        <h3>Step 3: Login and Use Portal</h3>
        <p>
            Once registered, log in using your User ID and password. You can now view bills, payment status, and other utilities through your dashboard.
        </p>
    </div>
</div>

<div class="footer">
    &copy; 2025 Electricity Billing System | All Rights Reserved
</div>

</body>
</html>
