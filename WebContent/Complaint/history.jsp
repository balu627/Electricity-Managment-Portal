<%@ page session="true" %>
<%@ page import="java.util.*, bean.ComplaintData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String custName = (String) session.getAttribute("custName");
    String email = (String) session.getAttribute("email");

    List<ComplaintData> list1 = (List<ComplaintData>) request.getAttribute("Complaints");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complaint History</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Bree Serif', serif;
            margin: 0;
            padding: 0;
            background: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s") no-repeat center center/cover;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            padding: 20px 0 10px;
            margin: 0 auto;
            border-bottom: 2px solid #3498db;
        }

        .table-wrapper {
            width: 90%;
            margin: 30px auto;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f5f5f5;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
        }

        th {
            background-color: #2e4053;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #ffffff;
        }

        tr:hover {
            background-color: #e9e9e9;
        }

        p {
            text-align: center;
            font-size: 18px;
            margin-top: 40px;
            color: #333;
        }

        /* Modal Popup */
        #popupModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 9999;
            justify-content: center;
            align-items: center;
        }

        #popupModal .popup-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 90%;
            max-width: 600px;
            position: relative;
            font-size: 16px;
        }

        #popupModal .popup-content h3 {
            text-align: center;
            margin-bottom: 15px;
        }

        #popupModal .popup-content span.close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 22px;
            cursor: pointer;
        }
        #popupModal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 10000;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

#popupModal .popup-content {
    background-color: #ffffff;
    padding: 25px 30px;
    border-radius: 12px;
    width: 100%;
    max-width: 600px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
    position: relative;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    animation: fadeIn 0.3s ease-in-out;
}

#popupModal .popup-content h3 {
    margin-top: 0;
    font-size: 24px;
    color: #2c3e50;
    text-align: center;
    border-bottom: 2px solid #3498db;
    padding-bottom: 10px;
}

#popupModal .popup-content span.close-btn {
    position: absolute;
    top: 10px;
    right: 20px;
    font-size: 26px;
    font-weight: bold;
    color: #999;
    cursor: pointer;
    transition: color 0.3s ease;
}

#popupModal .popup-content span.close-btn:hover {
    color: #e74c3c;
}

#popupContent div {
    margin: 10px 0;
    font-size: 16px;
    line-height: 1.5;
}

#popupContent strong {
    display: inline-block;
    width: 130px;
    color: #34495e;
}

#popupContent span {
    color: #555;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
        
    </style>
</head>

<body>
<jsp:include page="/shared/header.jsp" />
<h2>Pending Complaint History</h2>

<div class="table-wrapper">
    <%
        if (list1 == null || list1.isEmpty()) {
    %>
    <p>No complaints found.</p>
    <%
        } else {
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Category</th>
            <th>Type</th>
            <th>Status</th>
            <th>Details</th>
        </tr>
        <%
            for (int i = 0; i < list1.size(); i++) {
                ComplaintData c = list1.get(i);
        %>
        <tr>
            <td><%= c.getComplaintId() %></td>
            <td><%= c.getCategoryType() %></td>
            <td><%= c.getComplaintType() %></td>
            <td><%= c.getStatus() %></td>
            <td>
                <button type="button" onclick="showPopup(<%= i %>)" style="background: none; border: none; cursor: pointer;">
                    <i class="zmdi zmdi-receipt" style="font-size: 25px;"></i>
                </button>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        }
    %>
</div>


<div id="popupModal">
    <div class="popup-content">
        <span class="close-btn" onclick="closePopup()">&times;</span>
        <h3>Complaint Details</h3>
        <div id="popupContent"></div>
    </div>
</div>
<script>
    const complaintList = [];
    <% for (int i = 0; i < list1.size(); i++) {
        ComplaintData c = list1.get(i);
    %>
    complaintList.push({
        complaintId: "<%= c.getComplaintId() %>",
        consumerNo: "<%= c.getConsumerNo() %>",
        name: "<%= c.getName() %>",
        mobile: "<%= c.getMobile() %>",
        categoryType: "<%= c.getCategoryType() %>",
        complaintType: "<%= c.getComplaintType() %>",
        status: "<%= c.getStatus() %>",
        landmark: "<%= c.getLandmark() %>",
        address: "<%= c.getAddress() %>",
        description: "<%= c.getDescription() %>"
    });
    <% }  %>
    

    function showPopup(index) {
        const c = complaintList[index];

        const content = document.getElementById("popupContent");

        content.textContent = "";

        const fields = [
            ["Complaint ID", c.complaintId],
            ["Consumer No", c.consumerNo],
            ["Name", c.name],
            ["Mobile", c.mobile],
            ["Category", c.categoryType],
            ["Type", c.complaintType],
            ["Status", c.status],
            ["Landmark", c.landmark],
            ["Address", c.address],
            ["Description", c.description]
        ];

        fields.forEach(([label, value]) => {
            const strong = document.createElement("strong");
            strong.textContent = label+' : ';
            const span = document.createElement("span");
            span.textContent = value;

            const line = document.createElement("div");
            line.appendChild(strong);
            line.appendChild(span);
            content.appendChild(line);
        });

        document.getElementById('popupModal').style.display = 'flex';
    }


    function closePopup() {
        document.getElementById('popupModal').style.display = 'none';
    }
</script>

</body>
</html>
