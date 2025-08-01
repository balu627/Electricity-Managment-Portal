<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill Status</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        text-align: center;
        padding-top: 50px;
    }
    h3 {
        color: #27ae60;
    }
</style>

<script>
    setTimeout(function() {
        window.location.href = "Home/adminhome.jsp";
    }, 1000);
</script>

</head>
<body>

    <h1><%= request.getAttribute("message") %></h1>

</body>
</html>
