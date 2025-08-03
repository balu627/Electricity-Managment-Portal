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
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, bean.Bill,bean.MonthName" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill Payment History</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Bree Serif', serif;
        margin: 0;
        line-height: 1.6;
        color: #333;
        background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        height:100vh;
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
        border-bottom: 2px solid #3498db;
        padding-bottom: 10px;
        margin-bottom: 20px;
        text-align: center;
    }

    /* Add space for nav bar */
    .navbar {
        background-color: #2e4053;
        padding: 10px;
        color: white;
        text-align: center;
        margin-bottom: 20px;
    }
    
    table {
        width: 80%;  /* Reduce table width */
        margin: 20px auto;  /* Center the table and add top/bottom margin */
        border-collapse: collapse;
        box-shadow: 10px 10px rgba(92, 87, 87, 0.2);
        background-color: #f5f5f5;
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
        margin-left:30px;
        max-height: 370px;
        overflow-y: scroll;
        overflow-x: hidden;
    }
    
    .status-paid {
        color: #27ae60;
        font-weight: bold;
    }
    
    .status-pending {
        color: #e74c3c;
        font-weight: bold;
    }
    
    .month-name {
        text-transform: capitalize;
    }
    
    .no-records {
        text-align: center;
        padding: 20px;
        color: #7f8c8d;
        font-style: italic;
    }
    
    .amount {
        text-align: center;
    }
    
    .date {
        white-space: nowrap;
    }
    
    .secondbox {
    display: flex;
    justify-content: center;
    margin: 30px 0;
}

.search {
    background-color: #ffffffcc;
    padding: 20px 30px;
    border-radius: 10px;
    box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    gap: 20px;
    flex-wrap: wrap;
}

.search label {
    font-weight: bold;
    color: #2e4053;
}

.search input[type="month"] {
    padding: 8px 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-family: 'Bree Serif', serif;
}

.search input[type="submit"] {
    background-color: #004466;
    color: white;
    padding: 10px 20px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

.search input[type="submit"]:hover {
    background-color: #006699;
}


</style>
</head>
<body>
<jsp:include page="/shared/header.jsp" />

<h1>Bill Payment History</h1>
 
<% 
List<Bill> paidBills = (List<Bill>) request.getAttribute("paidBillsFiveMonths"); 
MonthName mn = new MonthName();
if (paidBills == null || paidBills.isEmpty()) { 
%>
    <p class="no-records">No bill records found.</p>
<% } else { %> 
    <div id="tableContainer">
        <table>
            <thead>
                <tr>
                    <th>Bill No</th>
                    <th>Month</th>
                    <th>Consumed Units</th>
                    <th class="amount">Amount (&#8377;)</th>
                    <th>Transaction ID</th>
                    <th>Status</th>
                    <th>Print Reciept</th>
                </tr>
            </thead>
            <tbody>
                 <% for (Bill bill : paidBills) { %>
                    <tr>
                        <td><%= bill.getBillNo() %></td>
                        <td class="month-name">
                        <% 
                        out.print(mn.getMonthName(Integer.parseInt(bill.getMonth().substring(5,7)))+"-"+bill.getMonth().substring(0,4));
                        %>
                    </td>
                        <td class="date"><%= bill.getUnits() %></td>
                        <td class="amount">&#8377;<%= bill.getAmount() %></td>
                        <td><%= bill.getTransactionId() %></td>
                        <td class="<%= "status-" + bill.getStatus().toLowerCase() %>">
                            <%= bill.getStatus() %>
                        </td>
                        <td>
    						<form action="PrintReceiptServlet" method="post">
        					<input type="hidden" name="transactionId" value="<%= bill.getTransactionId() %>">
        					<button type="submit" style="background: none; border: none; cursor: pointer;">
            				<i class="zmdi zmdi-receipt" style="font-size: 25px;"></i>
        					</button>
    						</form>
						</td>               
                    </tr>
                    
                <% } %>
	
            </tbody>
        </table>
    </div>
    
 <% } %>
  	<%
    	String fromm = request.getAttribute("from").toString();
    	String tom = request.getAttribute("to").toString();
    %>
     <div class="secondbox">
 			<form class="search" action="<%=request.getContextPath()%>/SearchByPeriodServlet" method="post">
            <div class="periodinput" id="search-range">
                <label for="from">From:</label>
                <input type="month" id="from" name="from" value="<%= fromm%>">
             	<label for="to">To :</label>
                <input type="month" id="to" name="to" value="<%= tom %>">
            
                <input type="submit" value="Search">
        	</div>
           
        </form> 
   
    </div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
    <script>
    document.querySelector("form.search").addEventListener("submit", function (e) {
        const from = document.getElementById("from").value;
        const to = document.getElementById("to").value;

        if (from > to) {
            alert("'From' month cannot be greater than 'To' month.");
            e.preventDefault();
        }
        if (!from || !to) {
            alert("Both 'From' and 'To' fields must be filled.");
            e.preventDefault();
            return;
        }
    });
    
    
    
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
    </script>
    <script type="text/javascript">
        function logout() {
            window.location.href = 'LogoutServlet';
        }
    </script>

</body>
</html>
