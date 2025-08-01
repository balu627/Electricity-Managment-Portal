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
    
<%@ page import="java.util.*, bean.ComplaintRegistration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Complaint</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">

<style>
    body {
         font-family: 'Bree Serif', serif;
        margin: 0;
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
        margin-top:10px;
        margin-bottom: 10px;
        text-align: center;
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
        border-radius: 20px;
    }

    #search-container {
        position:relative;
        left:0%;
        margin-top:100px;
        max-width: 25%;
        margin: 40px auto;
        padding: 25px 30px;
        border-radius: 10px;
        background-color: #f5f5f5;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
    }

    .container {
        position:relative;
        left:0%;
        margin-top:100px;
        max-width: 50%;
        margin: 40px auto;
        padding: 25px 30px;
        border-radius: 10px;
        background-color: #f5f5f5;
        display:flex;
        flex-direction:row;
        justify-content:center;
        align-items:center;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
    }

    .child2 {
        margin-left:50px;
    }

    input[type="submit"] {
        background-color: #2e4053;
        color: white;
        padding: 10px 8px;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        width: 25%;
        position:relative;
        left:40%;
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


</head>
<body>

    <jsp:include page="/shared/header.jsp" />
    
    

<h2>Search Complaint By Id</h2>

    <div id="search-container">
        <form method="post" action="search">
                <p><b>Enter Complaint ID:</b></p> 
                <input type="text" name="complaintId" required />
                <input type="submit" value="Search" />
        </form>
    </div>

    <%
    ComplaintRegistration c = (ComplaintRegistration) request.getAttribute("complaint");
    
        if (c != null) {
    %>
        <h2>Complaint Details</h2>

        <div class="container">
            <div class="child1">
                <p><b>ID:</b> <%= c.getComplaintid() %></p>
                <p><b>Type:</b> <%= c.getType() %></p>
                <p><b>Category:</b> <%= c.getCategory() %></p>
                <p><b>Contact Person:</b> <%= c.getContactperson() %></p>
                <p><b>Landmark:</b> <%= c.getLandmark() %></p>
            </div>

            <div class="child2">
                <p><b>Consumer No:</b> <%= c.getConsumernumber() %></p>
                <p><b>Description:</b> <%= c.getProblemdescription() %></p>
                <p><b>Mobile:</b> <%= c.getMobile() %></p>
                <p><b>Address:</b> <%= c.getAddress() %></p>
                <p><b>Status:</b><%= c.getStatus() %></p>
            </div>
        </div>
       
    <%
        } else if (request.getAttribute("complaint") == null) {
    %>
        <p>No complaint found with the given ID.</p>
    <%
        }
    %>
    <script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>
</body>
</html>
