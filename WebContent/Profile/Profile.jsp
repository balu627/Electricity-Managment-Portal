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

<%@ page import="bean.CustomerData" %>
<html>
<head>
    <title>Customer Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    
</head>
<style>
    body {
        font-family: 'Bree Serif', serif;
        margin: 0;
        padding:0;
        line-height: 1.6;
        background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
    }

    .topbar {
            background-color: #004466;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .menu {
            display: flex;
            align-items: center;
        }
        .menu > div {
            position: relative;
            margin-right: 20px;
        }
        .menu a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 10px 15px;
            display: inline-block;
        }
        .menu a:hover {
            background-color: #006699;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: #004466;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .user-info {
            display: flex;
            align-items: center;
        }
        .user-info span {
            margin-right: 15px;
            font-weight: bold;
        }
        .user-info button {
            padding: 6px 12px;
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .user-info button:hover {
            background-color: #e60000;
        }

    h2 {
        color: #2c3e50;
        border-bottom: 2px solid #3498db;
        padding-bottom: 10px;
        margin-bottom: 20px;
        text-align: center;
    }

    .container {
        max-width: 50%;
        margin: 70px auto;
        background-color: #f5f5f5;
        padding: 25px 30px;
        border-radius: 10px;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
    }

    #subContainer {
        display:flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }

    .child2 {
        margin-left: 80px;
    }

    p, label {
        color: #2c3e50;
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
            margin-top:30px;
            background-color: #2e4053;
            color: white;
            padding: 10px 8px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            width: 32%;
            position:relative;
            left:17%;
            font-style: normal;
            font-weight: 600;
            font-size: 16px;
            line-height: 20px;
            font-family: "Lexend", sans-serif;
            transition: background-color 0.5s;
            letter-spacing: 1px;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
        box-shadow: 0px 5px 5px 0px rgba(143, 148, 155, 0.2);
    }

</style>
<body>
    <jsp:include page="/shared/header.jsp" />
<div class="container">

<h2>Customer Profile Details</h2>

<%
    CustomerData data = (CustomerData) request.getAttribute("data");
    if (data != null) {
%>

    <div id="subContainer">
        <div class="child1">
            <p><strong>Consumer No : </strong><%= data.getConsumerId() %></p>
            <p><strong>Title : </strong><%= data.getTitle() %></p>
            <p><strong>Name : </strong><%= data.getCustName() %></p>
            <p><strong>Email : </strong><%= data.getEmail() %></p>
            <p><strong>Address : </strong><%= data.getAddress() %></p>
        </div>

        <div class="child2">
            <p><strong>Country Code : </strong><%= data.getCountryCode() %></p>
            <p><strong>Mobile Number : </strong><%= data.getMobile() %></p>
            <p><strong>User ID : </strong><%= data.getUserId() %></p>
            <p><strong>Password : </strong><%= data.getPassword() %></p>
        </div>
    </div>


<form action="UpdateProfileServlet" method="post" style="display:inline;">
    <input type="hidden" name="consumerNo" value="<%= data.getConsumerId() %>">
    <input type="submit" value="Update Profile">
</form>

<form action="SoftDeleteServlet" method="post" style="display:inline; margin-left:10px;">
    <input type="hidden" name="userId" value="<%= data.getUserId() %>">
    <input type="submit" value="Deactivate Account">
</form>

<%
    } else {
%>
<p>No customer data found!</p>
<%
    }
%>
</div>
<script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>
</body>
</html>