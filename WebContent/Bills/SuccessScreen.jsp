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
    
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Successful</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        color: #333;
        margin: 0;
        padding: 20px;
        background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
    }

    .container {
        background-color: #ffffff;
        max-width: 600px;
        margin: 30px auto;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        text-align: center;
    }

    h1 {
        color: #27ae60;
        margin-bottom: 20px;
    }

    h3 {
        color: #2c3e50;
        margin-top: 25px;
        border-bottom: 2px solid #3498db;
        padding-bottom: 5px;
    }

    p {
        font-size: 16px;
        margin: 10px 0;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        background-color: #ecf0f1;
        padding: 8px;
        margin: 5px 0;
        border-radius: 4px;
    }

    .btn-print, .btn-back {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        margin: 10px 10px 0 10px;
        font-size: 16px;
        cursor: pointer;
    }

    .btn-print {
        background-color: #3498db;
        color: white;
    }

    .btn-print:hover {
        background-color: #2980b9;
    }

    .btn-back {
        background-color: #bdc3c7;
        color: #2c3e50;
    }

    .btn-back:hover {
        background-color: #95a5a6;
    }

</style>


<script>
    function printPage() {
        window.print();
    }
</script>

</head>
<body>
<div class="container">
    <h1>Payment Successful!</h1>

    <h3>Transaction Details:</h3>

    <p><strong>Transaction ID:</strong> <%= request.getAttribute("Tid") %></p>
    <p><strong>Payment Date & Time:</strong> <%= request.getAttribute("paymentdateandtime") %></p>
    <p><strong>Payment Mode:</strong> <%= request.getAttribute("paymentmode") %></p>
    <p><strong>Total Amount Paid:</strong> &#8377;<%= request.getAttribute("totalamount") %></p>

    <h3>Bills Paid:</h3>
    <ul>
        <%
            String[] billNos = (String[]) request.getAttribute("billNodis");
            if (billNos != null) {
                for (String billNo : billNos) {
        %>
                    <li>Bill No: <%= billNo %></li>
        <%
                }
            }
        %>
    </ul>

    <button class="btn-print" onclick="printPage()">Print Receipt</button>
    <a href="Home/home.jsp"><button class="btn-back" >back to home</button></a>
</div>

<script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>
</body>
</html>
