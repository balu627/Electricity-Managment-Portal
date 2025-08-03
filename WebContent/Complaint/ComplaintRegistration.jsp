<%@ page session="true" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Home/login.jsp");
        return;
    }

    String custName = (String) session.getAttribute("custName");
    String email = (String) session.getAttribute("email");
%>
<%@ page import="bean.CustomerData" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Complaint Registration</title>
    <meta charset="ISO-8859-1">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            font-family: 'Bree Serif', serif;
            margin: 0;
            background: linear-gradient(to right, #005577, #002233);
            color: #333;
            min-height: 100vh;
        }

        .form {
            background: #fff;
            padding: 30px 40px;
            max-width: 750px;
            margin: 50px auto;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .form h2 {
            text-align: center;
            color: #004466;
            margin-bottom: 30px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .form-group label {
            flex: 0 0 200px;
            font-weight: bold;
            font-size: 15px;
        }

        .form-group input[type="text"],
        .form-group select {
            flex: 1;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            margin-top: 8px;
        }

        .form-actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .form-actions input[type="submit"],
        .form-actions input[type="reset"] {
            padding: 12px 25px;
            background-color: #004466;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-actions input[type="submit"]:hover,
        .form-actions input[type="reset"]:hover {
            background-color: #006699;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 9999;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
        }

        .modal-content h3 {
            margin-bottom: 20px;
        }

        .modal-content button {
            padding: 10px 20px;
            background-color: #004466;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button:hover {
            background-color: #006699;
        }
    </style>
</head>
<body>

<jsp:include page="/shared/header.jsp" />
<%
CustomerData customer = (CustomerData) request.getAttribute("customer");
%>

<form class="form" id="complaintForm">
    <h2>Complaint Registration</h2>

    <div class="form-group">
        <label for="consumernumber">Consumer Number</label>
        <input type="text" id="consumernumber" name="consumernumber" value="<%= customer.getConsumerId() %>" readonly required>
    </div>

    <div class="form-group">
        <label for="name">Contact Person</label>	
        <input type="text" id="name" name="name" value="<%= customer.getCustName() %>" readonly required>
    </div>

    <div class="form-group">
        <label for="mobile">Mobile Number</label>
        <input type="text"
               id="mobile"
               name="mobile"
               pattern="^\+\d{1,4}\s\d{10}$"
               title="Enter phone number in format +CC XXXXXXXXXX (e.g., +91 9876543210)"
               value="<%= customer.getCountryCode() + ' ' + customer.getMobile() %>"
               required>
    </div>

    <div class="form-group">
        <label for="category">Category Type</label>
        <select name="category" id="category" required onchange="updateComplaintOptions()">
            <option value="">-- Select Category --</option>
            <option value="Bill Category">Bill Category</option>
            <option value="Administration">Administration</option>
            <option value="Service">Service</option>
            <option value="Other">Other</option>
        </select>
        <input type="text" name="otherCategory" id="otherCategory" placeholder="Please specify category" style="display:none; margin-top:10px;">
    </div>

    <div class="form-group">
        <label for="complaintType">Complaint Type</label>
        <select name="complaintType" id="complaintType" required onchange="checkOtherComplaint()">
            <option value="">-- Select Complaint Type --</option>
        </select>
        <input type="text" name="otherComplaint" id="otherComplaint" placeholder="Please specify complaint" style="display:none; margin-top:10px;">
    </div>

    <div class="form-group">
        <label for="landmark">Landmark</label>
        <input type="text" id="landmark" name="landmark" required>
    </div>

    <div class="form-group">
        <label for="address">Address</label>
        <input type="text" id="address" name="address" value="<%= customer.getAddress() %>" required>
    </div>

    <div class="form-group">
        <label for="description">Problem Description</label>
        <input type="text" id="description" name="description" required>
    </div>

    <div class="form-actions">
        <input type="submit" value="Submit">
        <input type="reset" value="Reset">
    </div>
</form>

<div class="modal" id="successModal">
  <div class="modal-content">
    <h3>Complaint Registered Successfully!</h3>
    <button onclick="closeModal()">OK</button>
  </div>
</div>

<!-- JavaScript -->
<script>
  $('#complaintForm').on('submit', function(e) {
    e.preventDefault(); 

    $.ajax({
      type: 'POST',
      url: '<%= request.getContextPath() %>/register', 
      data: $(this).serialize(), 
      success: function(response) {
        showModal(); 
      },
      error: function(xhr, status, error) {
        alert('Something went wrong: ' + error);
      }
    });
  });

  function showModal() {
    document.getElementById("successModal").style.display = "flex";
  }

  function closeModal() {
	    
	    window.location.href = '<%= request.getContextPath() %>/Home/home.jsp';
	  }

  function updateComplaintOptions() {
    const complaintDropdown = document.getElementById("complaintType");
    const category = document.getElementById("category").value;
    const otherCategory = document.getElementById("otherCategory");
    const otherComplaint = document.getElementById("otherComplaint");

    // Reset complaint dropdown
    complaintDropdown.innerHTML = '<option value="">-- Select Complaint Type --</option>';
    otherComplaint.style.display = "none";

    if (category === "Other") {
      otherCategory.style.display = "block";
    } else {
      otherCategory.style.display = "none";
    }

    let options = [];

    if (category === "Bill Category") {
      options = [
        "Incorrect Meter Reading",
        "Overcharging",
        "Late Bill Generation",
        "Billing Issues",
        "Other"
      ];
    } else if (category === "Administration") {
      options = [
        "Office Not Responding",
        "Staff Misbehavior",
        "Unattended Requests",
        "Other"
      ];
    } else if (category === "Service") {
      options = [
        "Failure of Power Supply",
        "Voltage Complaint",
        "Transformer Issue",
        "Line Down",
        "Other"
      ];
    } else if (category === "Other") {
      options = ["Other"];
    }

    for (const optionText of options) {
      const option = document.createElement("option");
      option.value = optionText;
      option.textContent = optionText;
      complaintDropdown.appendChild(option);
    }
  }

  function checkOtherComplaint() {
    const complaint = document.getElementById("complaintType").value;
    const otherComplaint = document.getElementById("otherComplaint");
    otherComplaint.style.display = (complaint === "Other") ? "block" : "none";
  }
</script>

</body>
</html>
