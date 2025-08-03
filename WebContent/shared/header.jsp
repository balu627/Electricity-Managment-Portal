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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
            font-family: 'Bree Serif', serif;
            margin: 0;
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
    
</style>
<body>
<div class="topbar">
    <div class="menu">
        <div class="dropdown">
            <a href="<%=request.getContextPath()%>/Home/home.jsp">Home</a>
        </div>

        <div class="dropdown">
            <a href="<%=request.getContextPath()%>/viewBills">Bills</a>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/viewBills">View Bill</a>
                <a href="<%=request.getContextPath()%>/BillHistory">Payment History</a>
            </div>
        </div>

        <div class="dropdown">
            <a href="<%=request.getContextPath()%>/ComplaintRegistrationLoading">Complaint</a>

            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/ComplaintRegistrationLoading">Register Complaint</a>
                <a href="<%=request.getContextPath()%>/Complaint/Feedback.jsp">Feedback</a>
                <a href="<%=request.getContextPath()%>/history">Complaint History</a>
            </div>
        </div>

        <div class="dropdown">
            <a href="<%=request.getContextPath()%>/ProfileServlet">Profile</a>
        </div>
    </div>

    <div class="user-info">
        <span>Welcome, <%= custName != null ? custName : user %></span>
        <form action="<%=request.getContextPath()%>/LogoutServlet" method="post" style="margin: 0;">
            <button type="submit">Logout</button>
        </form>
    </div>
</div>


</body>
</html>