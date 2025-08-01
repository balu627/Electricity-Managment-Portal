<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        text-align: center;
        padding-top: 100px;
    }
    .message-box {
        background: #fff;
        padding: 20px 40px;
        border-radius: 10px;
        display: inline-block;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }
</style>

<script>

    setTimeout(function() {
        window.location.href = '<%= request.getAttribute("redirectPage") %>';
    }, 2000);
</script>

</head>
<body>

<div class="message-box">
    <h2><%= request.getAttribute("message") %></h2>
    <p>Redirecting...</p>
</div>

</body>
</html>
