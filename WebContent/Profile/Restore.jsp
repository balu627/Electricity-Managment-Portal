<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Restore Account</title>
<style>

    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: #f0f0f0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Bree Serif', serif;
        margin: 0;
       	background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            height:100vh;
    }
    .card {
        background: #fff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        text-align: center;
        width: 350px;
    }
    .card h2 {
        margin-bottom: 20px;
        color: #333;
    }
    .card p {
        margin-bottom: 30px;
        color: #555;
        font-size: 15px;
    }
    .card button {
        padding: 12px 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 14px;
        margin: 10px 5px;
        transition: background 0.3s;
    }
    .restore-btn {
        background: #2e86de;
        color: #fff;
    }
    .restore-btn:hover {
        background: #1b4f72;
    }
    .back-btn {
        background: #bbb;
        color: #333;
    }
    .back-btn:hover {
        background: #999;
    }
</style>
</head>
<body>

<div class="card">
    <h2>Account Recovery</h2>
    <p>Restore your account and continue to login.</p>
    <p>Your User ID:</p>
    <input type="text" name="userId" value="<%= request.getAttribute("userId") %>" readonly style="border:none; background:transparent; font-weight:bold; text-align:center;">

    <form action="restoreAccount" method="post">
        <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">
        <button type="submit" class="restore-btn">Restore Account</button>
    </form>

    <form action="<%=request.getContextPath()%>/Home/login.jsp" method="get">
        <button type="submit" class="back-btn">Back</button>
    </form>
</div>


</body>
</html>
