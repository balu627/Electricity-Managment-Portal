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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">

    <title>Update Customer Profile</title>
    <style>
    body {
 font-family: 'Bree Serif', serif;
margin: 0;
line-height:1.6;
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

color: #2C3e50;
  border-bottom: 2px solid #3498db;
  padding-bottom: 10px;
  margin-top: 60px;
  margin-bottom: 20px;
  text-align: center;
}

#container1 {
max-width: 50%;
margin: 40px auto;
padding: 25px 30px;
border-radius: 10px;
flex-direction: row;
  background-color: #f3f3f3;
  box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
}
.child2 {
  margin-left: 100px;
}
p,label {
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
#mail {
  width: 100%;
  padding: 10px;
  margin-top: 5px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
input[type="submit"]{
background-color: #2e4053;
  color: white;
  padding: 10px 8px;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  width: 15%;
  position: relative;
  left: 42%;
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
<div class="container">
<h2>Update Customer Profile</h2>

<%
    CustomerData data = (CustomerData) request.getAttribute("data");
    if (data != null) {
%>

<form action="UpdateChangedDetails" method="post">
<div id="container1">
	<div class="child1">
    	<p><strong>Consumer No:</strong>
    	<input type="text" name="consumerNo" value="<%= data.getConsumerId() %>" readonly
           pattern="\d{13}" title="13 digit consumer number"></p>

    	<p><strong>Title:</strong>
    	<select name="title" required>
        	<option value="Mr." <%= "Mr.".equals(data.getTitle()) ? "selected" : "" %>>Mr.</option>
        	<option value="Ms." <%= "Ms.".equals(data.getTitle()) ? "selected" : "" %>>Ms.</option>
        	<option value="Mrs." <%= "Mrs.".equals(data.getTitle()) ? "selected" : "" %>>Mrs.</option>
        	<option value="Dr." <%= "Dr.".equals(data.getTitle()) ? "selected" : "" %>>Dr.</option>
        	<option value="Prof." <%= "Prof.".equals(data.getTitle()) ? "selected" : "" %>>Prof.</option>
    	</select>
    	</p>

    	<p><strong>Name:</strong>
    	<input type="text" name="name" value="<%= data.getCustName() %>" 
           pattern="[A-Za-z\s]{3,50}" title="Only letters and spaces, 3 to 50 chars" required></p>

    	<p><strong>Email:</strong>
    	<input type="text" name="email" value="<%= data.getEmail() %>" pattern="^[0-9 A-Z a-z .!]+@[a-z]+\.[a-z]{2,}" required></p>	
   	
    	<p><strong>Country Code:</strong>
    	<input type="text" name="countryCode" value="<%= data.getCountryCode() %>" 
           pattern="\+\d{1,4}" title="Country code like +91" required></p>

    <p><strong>Mobile Number:</strong>
    <input type="text" name="mobileNumber" value="<%= data.getMobile() %>" 
           pattern="\d{10}" title="10 digit mobile number" required></p>

    <p><strong>User ID:</strong>
    <input type="text" name="userId" value="<%= data.getUserId() %>" 
           pattern="^\S{5,20}$" minlength="5" maxlength="20" title="Alphanumeric, 5 to 20 chars" required></p>

    <p><strong>Password:</strong>
    <input type="text" name="password" value="<%= data.getPassword() %>" 
           pattern=".{6,20}" title="6 to 20 characters" required></p>

    </div>
    </div>
    <input type="submit" value="Save Changes">
</form>

<%
    } else {
%>
<p>No customer data found to update!</p>
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