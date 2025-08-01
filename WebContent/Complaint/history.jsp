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
<%@ page import="java.util.*, bean.ComplaintRegistration" %>     <%
     List<ComplaintRegistration> list1 = (List<ComplaintRegistration>) request.getAttribute("PendingComplaints");
     List<ComplaintRegistration> list2 = (List<ComplaintRegistration>) request.getAttribute("solvedComplaints");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>complaint history </title>
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
            margin-bottom: 20px;
            text-align: center;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
            background-color: #f5f5f5;
            margin-left:170px;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #2e4053;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: white;
        }

        tr:hover {
            background-color: #e9e9e9;
        }

        #tableContainer {
            margin-top:30px;
            height: 350px;
            overflow-y: scroll;
            overflow-x: hidden;
        }

        input[type="submit"] {
            margin-top:30px;
            background-color: #2e4053;
            color: white;
            padding: 10px 8px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            width: 20%;
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

  <h2>Pending Complaint History</h2>
  
      <%
            if (list1 == null) {
        %>
            <p>No complaints </p>
        <%
            } else {
        %>
    
    <h3> Complaints</h3>
    <table border="1">
      <tr><th>ID</th><th>Type</th><th>Category</th><th>Contact</th><th>Status</th></tr>
      <%
        for (ComplaintRegistration c : list1) {
          
      %>
        <tr>
          <td><%= c.getComplaintid() %></td>
          <td><%= c.getType() %></td>
          <td><%= c.getCategory() %></td>
          <td><%= c.getContactperson() %></td>
          <td><%= c.getStatus() %></td>
        </tr>
      <%
          
        }
      %>
    </table>
   <%
          
        }
      %>
      
      
      <h2>Solved Complaint History</h2>
  
      <%
            if (list1 == null) {
        %>
            <p>No complaints </p>
        <%
            } else {
        %>
    
    <h3> Solved Complaints</h3>
    <table border="1">
      <tr><th>ID</th><th>Type</th><th>Category</th><th>Contact</th><th>Status</th></tr>
      <%
        for (ComplaintRegistration c : list2) {
          
      %>
        <tr>
          <td><%= c.getComplaintid() %></td>
          <td><%= c.getType() %></td>
          <td><%= c.getCategory() %></td>
          <td><%= c.getContactperson() %></td>
          <td><%= c.getStatus() %></td>
        </tr>
      <%
          
        }
      %>
    </table>
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