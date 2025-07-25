<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        height: 100vh;
        background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .center-content {
        text-align: center;
        background-color: rgba(255, 255, 255, 0.8);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }

    .emoji {
        font-size: 100px;
        margin-bottom: 20px;
    }

    .message {
        font-size: 24px;
        color: #333;
    }
</style>
</head>
<script>

    setTimeout(function() {
        window.location.href = 'home.jsp';
    }, 2000);
</script>
<body>
    <div class="center-content">
        <div class="emoji"></div>
        <p class="message">Thanks for the Feedback</p>
    </div>
</body>
</html>