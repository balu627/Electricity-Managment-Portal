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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compliant Registration</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Bree Serif', serif;
            margin: 0;
            background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            height:100%;
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
    form {
        background: #fff;
        padding: 25px;
        max-width: 700px;
        margin: auto;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
    }
    input[type="text"], select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    input[type="submit"], input[type="reset"] {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover, input[type="reset"]:hover {
        background-color: #0056b3;
    }
</style>

</head>
<body>

<div class="topbar">
        <div class="menu">
            <div class="dropdown">
                <a href="home.jsp">Home</a>
            </div>
            
            <div class="dropdown">
                <a href="viewBills">Bills</a>
                <div class="dropdown-content">
                    <a href="viewBills">View Bill</a>
                    <a href="BillHistory">Payment History</a>
                </div>
            </div>
            
            <div class="dropdown">
                <a href="index.jsp">Complaint</a>
                <div class="dropdown-content">
                    <a href="index.jsp">Register Complaint</a>
                    <a href="Search.jsp">Search Complaint Status</a>
                    <a href="Feedback.jsp">Feedback</a>
                    <a href="history">Complaint History</a>
                </div>
            </div>
            
            <div class="dropdown">
                <a href="ProfileServlet">Profile</a>
            </div>
        </div>
        
        <div class="user-info">
            <span>Welcome, <%= custName != null ? custName : user %></span>
            <button type="button" onclick="logout()">Logout</button>
        </div>
    </div>


	<form  method="post" action="register1">
<label for="ct"  id=ct1>Complaint/Service Type</label>
 <select name="complaint"  id="ct">
        <option value="Failure of Power supply"> Failure of Power supply</option>
         <option value="Voltage Complaint"> Voltage Complaints</option>
          <option value="Billing Issues"> Billing Issues</option>
          </select>
          
          
      <label for ="lm" id="lmk">LandMark</label>
      <input type="text" id="lm" name = "lmk">
          <br>
          <br>
          <br>
          
        <label for="cat"  id=cat1>Category Type</label>
      
      <select name="cat"  id="cat">
        <option value="Bill Category"> Bill Category</option>
         <option value="Administration"> Administration</option>
          <option value="Service"> Service</option>
          </select>
          
          
           <label for ="cn" id="cnb">Consumer Number</label>
      <input type="text" id="cn" name = "cnb">
          <br>
          <br>
          <br>          
          
           <label for ="cp" name="cpn">Contact Person</label>
      <input type="text" id="cp" name="cpn">
      
       <label for ="pd" id="pdn">Problem Description</label>
      <input type="text" id="pd" name="pd">
      
          <br>
          <br>
          <br>
      <label for="mn" id="mbn">Mobile Number</label>
<input type="text" id="mn" name="mb" pattern="[0-9]{10}" title="Enter a 10-digit phone number" required>
      
       <label for ="add" id="ad">Address</label>
      <input type="text" id="add" name ="add">
      
      
      <br><br><br> 
      
      
      <input type = submit >
      <input type = reset >
   
      
      </form>
      <script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>
</body>
</html>