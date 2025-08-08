<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>New Connection Request</title>
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
            text-decoration: underline;
        }

        .container {
            max-width: 700px;
            background: white;
            margin: 40px auto;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #004466;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #2c3e50;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            margin-top: 25px;
            background-color: #004466;
            color: white;
            border: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #006699;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background: #004466;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h2><a href="<%=request.getContextPath()%>/">Electricity Billing Portal</a></h2>
    <div>
        <a href="<%=request.getContextPath()%>/Home/login.jsp">Login</a>
        <a href="<%=request.getContextPath()%>/Home/consumer_register.jsp">Register</a>
        <a href="connection_request.jsp">New Connection</a>
    </div>
</div>

<div class="container">
    <h2>Apply for New Connection</h2>
    <form action="ConnectionRequestServlet" method="post">
        <label for="fullName">Full Name:</label>
        <input type="text" name="fullName" id="fullName" required>

        <label for="email">Email Address:</label>
        <input type="email" name="email" id="email" required>

        <label for="mobile">Mobile Number:</label>
        <input type="text" name="mobile" id="mobile" pattern="\\d{10}" maxlength="10" required>

        <label for="address">Full Address:</label>
        <textarea name="address" id="address" rows="4" required></textarea>

        <label for="pincode">Pin Code:</label>
        <input type="text" name="pincode" id="pincode" pattern="\\d{6}" maxlength="6" required>

        <input type="submit" value="Submit Request">
    </form>
</div>

<div class="footer">
    &copy; 2025 Electricity Billing System | All Rights Reserved
</div>

</body>
</html>
	