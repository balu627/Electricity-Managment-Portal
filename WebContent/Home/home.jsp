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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Home</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Bree Serif', serif;
            margin: 0;
            background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            height: 100vh;
        }

        .welcome-container {
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.9);
            margin: 50px auto;
            width: 80%;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <jsp:include page="/shared/header.jsp" />

    <div class="welcome-container">
        <h2>Welcome to Your Electricity Account</h2>
        <p>You can now manage your electricity services online.</p>
        
        <div id="dashboard" style="margin-top: 30px;">
            <h3>Account Summary</h3>
            <p><strong>User ID:</strong> <%= user %></p>
            <% if (custName != null) { %>
                <p><strong>Name:</strong> <%= custName %></p>
            <% } %>
            <% if (email != null) { %>
                <p><strong>Email:</strong> <%= email %></p>
            <% } %>
        </div>
    </div>

    <script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>
</body>
</html>
