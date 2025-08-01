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
<%@ page import="java.sql.*, dao.BillDao" %>
<%@ page import="java.util.*, bean.Bill" %>
<%@ page import="bean.MonthName" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unpaid Bills List</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Bree Serif', serif;
        background-color: #f8f9fa;
        margin: 0;
        color: #343a40;
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
    h2 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 25px;
        padding-bottom: 10px;
        margin-top:2rem;
        border-bottom: 2px solid #e9ecef;
    }
    table {
        width: 100%;
        max-width: 1000px;
        margin: 0 auto;
        border-collapse: collapse;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
        background-color: white;
        border-radius:5px;
    }
    thead tr {
        background-color: #2e4053;
        color: white;
        text-align: left;
        
    }
    th, td {
        padding: 12px 15px;
        text-align: center;
        
    }
    tbody tr {
        border-bottom: 1px solid #dddddd;
    }
    tbody tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }
    tbody tr:hover {
        background-color: #e3f2fd;
        cursor: pointer;
    }
    tfoot tr {
        background-color: #e9ecef;
        font-weight: bold;
    }
    /* Status styling */
    td:last-child[data-status="unpaid"] {
        color: #e74c3c;
        font-weight: bold;
    }
    
    #tableContainer {
        max-height: 370px;
        overflow-y: scroll;
        overflow-x: hidden;
    }
    
    #payButton {
        margin: 40px auto;
        display: block;
        padding: 12px 25px;
        font-size: 16px;
        font-weight:600;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        transition: background-color 0.3s;
        letter-spacing: 1px;
    }
    #payButton:hover {
        background-color: #2c80b4;
    }
    #payButton:disabled {
        background-color: #95a5a6;
        cursor: not-allowed;
    }
    .selected-row {
        background-color: #d4e6f7 !important;
    }
    input[type="checkbox"] {
        transform: scale(1.3);
        cursor: pointer;
    }
</style>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script>

$(document).ready(function(){
    var rowCount = $('tbody tr').length;
    console.log(rowCount);
    if (rowCount < 6 ) {
        $("<style>", {id: "myStyle"}).appendTo("head");
        $("#myStyle").html("#tableContainer { overflow: hidden; }");
    }else {
        $('#tableContainer').addClass('do-scroll');
    }
});

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('tbody tr').forEach(row => {
        row.addEventListener('click', e => {
            if (e.target.type !== 'checkbox') {
                let cb = row.querySelector('input[type="checkbox"]');
                cb.checked = !cb.checked;
                toggleRowAndTotal(cb);
            }
        });
    });

    document.querySelectorAll('input[name="billSelect"]').forEach(cb => {
        cb.addEventListener('change', () => toggleRowAndTotal(cb));
    });

    updatePayButton();
});

function toggleRowAndTotal(cb) {
    updateRowStyle(cb.closest('tr'), cb.checked);
    updateTotal();
    updatePayButton();
}
    
    
    const checkboxes = document.querySelectorAll('input[name="billSelect"]');
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            updateRowStyle(this.closest('tr'), this.checked);
            updateTotal();
            updatePayButton();
        });
    });

    function updateRowStyle(row, isChecked) {
        if (isChecked) {
            row.classList.add('selected-row');
        } else {
            row.classList.remove('selected-row');
        }
    }

    function updateTotal() {
        let checkboxes = document.querySelectorAll('input[name="billSelect"]:checked');
        let total = 0;
        checkboxes.forEach(cb => {
            total += parseFloat(cb.getAttribute('amount'));
        });
        document.getElementById("totalAmount").innerText = "₹" + total.toFixed(2);
    }

    function updatePayButton() {
        const payButton = document.getElementById("payButton");
        const checkedCount = document.querySelectorAll('input[name="billSelect"]:checked').length;
        payButton.disabled = checkedCount === 0;
    }
    

</script>



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

<h2>List of Unpaid Bills</h2>

<form action="PayBillServlet" method="post">
    <div id="tableContainer">
        <table>
            <thead>
                <tr>
                    <th>Select</th>
                    <th>Bill No</th>
                    <th>Consumed Units</th>
                    <th>Amount</th>
                    <th>Month</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    MonthName mn = new MonthName();
                    List<Bill> unpaidBills = (List<Bill>) request.getAttribute("unpaidBills");
                    if (unpaidBills != null && !unpaidBills.isEmpty()) {
                        for (Bill b : unpaidBills) {
                             String month = mn.getMonthName(Integer.parseInt(b.getMonth().substring(5,7)));
                             String year = b.getMonth().substring(0,4);
                             month = month + "-" + year;
                %>
                <tr>
                    <td>
                        <input type="checkbox" name="billSelect" value="<%= b.getBillNo() %>" 
                               amount="<%= b.getAmount() %>">
                    </td>
                    <td><%= b.getBillNo() %></td>
                    <td><%= b.getUnits() %></td>
                    <td>₹<%= b.getAmount() %></td>
                    <td><%= month %></td>
                    <td data-status="<%= b.getStatus().toLowerCase() %>"><%= b.getStatus() %></td>
                </tr>
                <%
                        }
                    }
                    else{
                    	%><tr>
    						<td colspan="6" style="text-align:center; font-weight:bold;">No Dues</td>
						  </tr>
						  <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3">Total Amount</td>
                    <td colspan="3" id="totalAmount">₹0.00</td> 
                </tr>
            </tfoot>
        </table>
    </div>

    <button type="submit" id="payButton" disabled>Pay Selected Bills</button>
</form>
<script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>

</body>
</html>