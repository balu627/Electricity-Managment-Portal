<%@ page session="true" %>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0);

    String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");
if (user == null || !"admin".equals(role)) {
    response.sendRedirect("login.jsp");
    return;
}
    
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Bill Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Bree Serif', serif;
        margin: 0;
        color: #333;
        letter-spacing: 1px;
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
    
    h1 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 30px;
        margin-top:2rem;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .container {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        max-width: 550px;
        background-color: #f5f5f5;
        margin: 0 auto;
        padding: 30px;
        border-radius: 8px;
        color:black;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
    }

    .container>div:first-child {
        flex: 1 0 100%;
    } 

    .container>div {
        flex: 0 1 48%;
    }

    .child2 {
        margin-right: 10px;
    }
     
    input[type="text"], #month{
        width: 100%;
        padding: 12px;
        margin: 8px 0 20px;
        border: 1px solid #ddd;
        border-radius: 20px;
        box-sizing: border-box;
        font-size: 12px;
        font-weight:200;
        transition: border 0.3s;
        letter-spacing: 1.2px;
        color: #566573;
        opacity: 1;
        font-size:15px;
    }

    ::placeholder {
        color: #566573;
        opacity: 1;
        font-size:15px;
    }
    
    input[type="text"]:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 5px rgba(52,152,219,0.5);
    }
    
    input[type="submit"] {
        margin-top:10px;
        background-color: #2e4053;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        width: 45%;
        margin-left:25%;
        font-style: normal;
        font-weight: 600;
        font-size: 16px;
        line-height: 20px;
        font-family: Lexend, sans-serif;
        transition: background-color 0.5s;
        letter-spacing: 1px;
    }
    
    input[type="submit"]:hover {
        background-color: #2980b9;
        box-shadow: 0px 5px 5px 0px rgba(143, 148, 155, 0.2);
        
    }
    
    label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
        letter-spacing: 1px;
        font-size:17px;
    }
</style>
</head>
<body>
<div class="topbar">
        <div class="menu">
            <div class="dropdown">
                <a href="adminhome.jsp">Dashboard</a>
            </div>
            
            
            <div class="dropdown">
                <a href="AddBill.jsp">Billing</a>
                <div class="dropdown-content">
                    <a href="AddBill.jsp">AddBill</a>
                </div>
            </div>
            
            <div class="dropdown">
                <a href="active">Complaints</a>
                <div class="dropdown-content">
                    <a href="active">View Active Complaints</a>
                    <a href="changestatus.jsp">Resolve Complaint</a>
                </div>
            </div>
        </div>
        
        <div class="user-info">
            <span>Welcome Admin, <%= name %></span>
            <button type="button" onclick="logout()">Logout</button>
        </div>
    </div>

<h1>Add Bill</h1>
    <form  class="container" action="addBillservlet" method="post">
        <div class="child1">
            <label for="consumerNo">Consumer Number:</label>
            <input type="text" id="consumerNo" name="consumerNo" pattern="^\d{13}$" minlength="13" maxlength="13"  placeholder="Enter consumer number" required>
        </div>
     
    
        <input type="submit" value="Submit Bill">
    </form>
    <script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>
</body>
</html>
