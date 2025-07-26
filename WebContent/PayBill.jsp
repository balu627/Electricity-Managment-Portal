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
    
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, bean.Bill" %>
<%@ page import="bean.MonthName" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Page</title>
<style>
    body {
    	margin-top:0px;
    	margin:0px;
    	padding:0px;
    	padding-top:0px;
        font-family: "Lexend", sans-serif;
        background-color: #f5f5f5;
        line-height: 1.6;
        color: #333;
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
        padding-bottom: 5px;
    }

    .payment-heading {
        margin-top:70px;
        text-align: center;
        margin-bottom: -15px;
    }
    
    /* h3 {
        color: #2c3e50;
        margin-top: 25px;
    } */
    
    table {
        width: 100%;
        margin:20px 0;
        border-collapse: collapse;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
        background-color: white;
        border-radius:5px;
    }
    
    table, th, td {
        border: 1px solid #ddd;
    }
    
    th, td {
        padding: 10px;
        text-align: left;
    }
    
    th {
        background-color: #2e4053;
        color: white;
    }
    
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    p {
        font-size:18px;
        margin: 10px 0;
        color: #273746;
        font-family: "Lexend", sans-serif;
    }
    
    .container {
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
        flex-wrap: nowrap;
        max-width: 80%;
        margin: 0 auto;
        padding: 30px;
        border-radius: 8px;
        color:black;
        background-color: transparent;
    }

    .container>div:first-child {
        flex: 0 1 30%;
    } 

    .container>div {
        flex: 0 1 30%;
    }

    .child1 {
        background-color: #f5f5f5;
        padding:30px 70px 80px;
        border-radius: 8px;
        font-family: Lexend, sans-serif;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
        max-height:500px;
    }

    .child2 {
        margin-left: 80px;
        padding:30px 70px 80px;
        background-color: #f5f5f5;
        border-radius: 8px;
        font-family: "Lexend", sans-serif;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
    }

    .amt-details {
        margin-top:-50px;
        position: relative;
        top:80px;
        left:70px;
    }

    .pg-charge {
        margin-left:45px;
    }

    .total-amount {
        margin-left:37px;
    }

    #tableContainer {
        width: 100%;
        height: 300px;
        overflow-y: scroll;
        overflow-x: hidden;
    }

    label {
        font-weight: 600;
        color: #273746;
    }

    .card-type {
        margin-left: 50px;
        margin-bottom:-20px;
    }
    
    #card-number, #user-name {
        padding: 8px;
        margin: 5px 0 25px;
        width: 100%;
        box-sizing: border-box;
        border: 1px solid #ddd;
        border-radius: 20px;
    }

    #expiry-date, #cvv {
        padding: 8px;
        margin: 5px 0 25px;
        width: 100%;
        box-sizing: border-box;
        border: 1px solid #ddd;
        border-radius: 20px;
    }

    #card-details {
        display:flex;
        flex-direction: row;
    }

    .item2 {
        margin-left: 10px;
    }

    ::placeholder {
        color: #566573;
        opacity: 1;
        font-size:15px;
    }

    
    input[type="radio"] {
        margin-right: 5px;
    }

    .card-type span {
    color: #273746;
    font-weight: 600;
}

    
    .paybtn {
        margin-top:10px;
        background-color: #2e4053;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        width: 45%;
        position:relative;
        left:100px;
        font-style: normal;
        font-weight: 600;
        font-size: 16px;
        line-height: 20px;
        font-family: Lexend, sans-serif;
        transition: background-color 0.5s;
        letter-spacing: 1px;
    }
    
    button:hover {
        background-color: #2980b9;
        box-shadow: 0px 5px 5px 0px rgba(143, 148, 155, 0.2);
    }
</style>
</head>

<%
    MonthName mn = new MonthName();    
    List<Bill> bills = (List<Bill>) request.getAttribute("selectedBills");
    System.out.println(bills.size());
    int totalAmount = 0;
%>

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




    <h2 class="payment-heading">Payment Page</h2>
    

<form action="paymentSuccessServlet" method="post" class="container">
    <div class="child1">
        <h2>Bill Details</h2>
        <div id="tableContainer">
            <table>
              <tr><th>Bill No</th><th>Amount</th><th>Month</th></tr>
    <% for (Bill b : bills) {  
    	String month = mn.getMonthName(Integer.parseInt((b.getMonth().substring(5,7))));
    	month = month +"-"+b.getMonth().substring(0,4);
    
    %>
        <tr>
            <td><%= b.getBillNo() %></td>
            <input type="hidden" name="billNo" value="<%= b.getBillNo() %>">
            <td>&#8377;<%= b.getAmount() %></td>
            <input type="hidden" name="totalamount" value="<%= b.getAmount() %>">
            <td><%= month %></td>
        </tr>
        <% totalAmount += b.getAmount(); %>
    <% } %>

            </table>

            
    </div>
        

            <div class="amt-details">
                <p><strong>Total Bill Amount :</strong> &#8377;<%= totalAmount %></p>
                <p><strong>PG Charges :</strong> <span class="pg-charge">&#8377;<%= totalAmount*3/100 %></span></p>
                <p><strong>Total Payable :</strong><span class="total-amount">&#8377;<%= totalAmount + totalAmount*3/100 %></span></p>
            </div>
        
    </div>
    
    <div class="child2">
        <h2>Select Payment Method:</h2>
        
        <div class="card-type">
            <input type="radio" name="paymentMode" value="Credit Card" checked> <span>Credit Card</span>
            <input type="radio" name="paymentMode" value="Debit Card"> <span>Debit Card</span>
        </div>

        <br><br>
        <label>Card Number:</label><br>
        <input type="text" name="cardNumber" placeholder="Enter card number" id="card-number"  pattern="^\d{16}$" maxlength="16" minlength="16" required
        ><br>

        <label>Card Holder Name:</label><br>
        <input type="text" name="holderName" placeholder="Name on card" id="user-name" pattern="^[A-Za-z\s]{1,100}$" maxlength="100" required
        ><br>

        <div id="card-details">
            <div class="item1">
                <label>Expiry Date:</label><br>
                <input type="text" name="expiry" placeholder="MM/YY" id="expiry-date" pattern="^(0[1-9]|1[0-2])\/(2[5-9]|[3-9][0-9])$" required
                >
            </div>
            
            <div class="item2">
                <label>CVV:</label><br>
                <input type="text" name="cvv" placeholder="CVV" maxlength="3" minlength="3" pattern="^\d{3}$" id="cvv"><br>
            </div>
        </div>

        <input type="hidden" name="totalAmount" value="<%= totalAmount + totalAmount*3/100 %>">
        <button class="paybtn" type="submit" id="pay-button">Pay &#8377;<%= totalAmount + totalAmount*3/100 %></button>
    </div>
    </form>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script>
       $(document).ready(function(){
            var rowCount = $('tbody tr').length;
            if (rowCount <= 4 ) {
                $("<style>", {id: "myStyle"}).appendTo("head");
                $("#myStyle").html("#tableContainer { overflow: hidden; }");
            }else {
                $('#tableContainer').addClass('do-scroll');
            }
        });
    </script>
    <script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>

    </body>
    </html>
