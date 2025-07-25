<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "bean.ComplaintRegistration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
    body {
        font-family: "Lexend", sans-serif;
        margin: 0;
        padding: 20px;
        line-height: 1.6;
        background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
    }

    .navbar {
        background-color: #2e4053;
        padding: 10px;
        display: flex;
        gap: 20px;
        border-radius:5px;
    }
    .navbar a {
        color: white;
        text-decoration: none;
        font-weight: bold;
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

    <div class="navbar">
    <a href="history"><button>History</button></a>
 <a href= "active"><button>Active Complaints</button></a>
 <a href="search.jsp"><button>Search Complaint</button></a>
 <a href="feedback.jsp"><button>Feedback</button></a>
</div>

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
</body>
</html>
