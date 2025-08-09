<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    String msg = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .message-box {
        max-width: 500px;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        font-size: 18px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }
    .error {
        background-color: #ffe6e6;
        color: #d9534f;
        border: 1px solid #d9534f;
    }
    .success {
        background-color: #e6ffed;
        color: #28a745;
        border: 1px solid #28a745;
    }
    .btn-home {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease;
        text-decoration: none;
        display: inline-block;
    }
    .btn-home:hover {
        background-color: #2c80b4;
    }
</style>
</head>
<body>

    <% if ("exists".equalsIgnoreCase(msg)) { %>
        <div class="message-box error">
            <h2>User Already Exists</h2>
            <p>Please try again with a different email or contact support.</p>
            <a href="<%=request.getContextPath()%>/" class="btn-home">Go to Home</a>
        </div>
    <% } else if ("submitted".equalsIgnoreCase(msg)) { %>
        <div class="message-box success">
            <h2>Details Submitted Successfully</h2>
            <p>Our team will get back to you shortly. Thank you!</p>
            <a href="<%=request.getContextPath()%>/" class="btn-home">Go to Home</a>
        </div>
    <% } else { %>
        <div class="message-box">
            <h2>Submission Failed</h2>
            <p>Data Not Submitted.</p>
            <a href="<%=request.getContextPath()%>/" class="btn-home">Go to Home</a>
        </div>
    <% } %>

</body>
</html>
