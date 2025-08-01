<%@ page session="true" %>
<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader("Expires", 0);
	
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String custName = (String) session.getAttribute("custName");
    String email = (String) session.getAttribute("email");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="style.css">
    <style>
body {
font-family: Arial, sans-serif;
background-color: #f2f6fc;
color: #333;
margin: 0;
padding: 0;
}
h2 {
text-align: center;
color: #2c3e50;
margin-top: 20px;
}
.container {
max-width: 600px;
margin: 40px auto;
background: white;
padding: 25px 30px;
border-radius: 10px;
box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
p, label {
font-size: 16px;
margin: 10px 0;
}
input[type="text"],
select {
width: 100%;
padding: 10px;
margin-top: 5px;
margin-bottom: 15px;
border: 1px solid #ccc;
border-radius: 5px;
}
input[type="submit"] {
background-color: #3498db;
color: white;
border: none;
padding: 10px 20px;
border-radius: 6px;
cursor: pointer;
transition: background 0.3s ease;
font-size: 16px;
}
input[type="submit"]:hover {
background-color: #2c80b4;
}

</style>
    <title>Status Update</title>
</head>
<script>

    setTimeout(function() {
        let ans = '<%= request.getAttribute("path") %>';
        if(ans=="login.jsp")
        	{
        		window.location.href = 'LogoutServlet';
        	}
        else
        	{
        	window.location.href='<%= request.getAttribute("path")%>'
        	}
    }, 2000);
</script>
<body>
<div class="container">
    <h2><%= request.getAttribute("message") %></h2>

</div>
</body>
</html>