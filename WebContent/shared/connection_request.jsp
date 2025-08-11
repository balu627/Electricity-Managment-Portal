<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>New Connection Request</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f0f4f8;
        }
        .navbar {
            background-color: #004466;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h2 {
            color: white;
            margin: 0;
        }
        .navbar a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
        }
        .navbar a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 700px;
            background: white;
            margin: 40px auto;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #004466;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #2c3e50;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        button{
            margin-top: 25px;
            background-color: #004466;
            color: white;
            border-radius: 5px;
            padding:10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #006699;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background: #004466;
            color: white;
            margin-top: 50px;
        }
        .name{
        	display: flex; 
        	gap: 10px;
        	height:40px;
        }
        select
        {
        	border-radius: 8px;   
        	border: 1px solid #ccc;
        	padding:12px;
     	}
     	.name input{
     		height:100%;
     		margin-top:0px;
     	}
     	
     	#popupmessage{
		    display:none;
		    position: fixed;
		    top: 20px;
		    right: 20px;
		    background-color: #4CAF50;
		    color: white;
		    padding: 15px 20px;
		    border-radius: 5px;
		    font-size: 16px;
		    box-shadow: 0 4px 6px rgba(0,0,0,0.2);
		    z-index: 9999;
		    opacity: 0;
		    transition: opacity 0.5s ease;
     	}
    </style>
</head>
<body>

<div class="navbar">
    <h2><a href="<%=request.getContextPath()%>/">Electricity Billing Portal</a></h2>
    <div>
        <a href="<%=request.getContextPath()%>/Home/login.jsp">Login</a>
        <a href="<%=request.getContextPath()%>/Home/consumer_register.jsp">Register</a>
        <a href="connection_request.jsp">New Connection</a>
    </div>
</div>

<div class="container">
    <h2>Apply for New Connection</h2>
    <form action="<%=request.getContextPath()%>/ConnectionRequestServlet" method="post">
    
       <label for="title">	Full Name:</label>
		<div class="name">
		    <select name="title" id="title" required >
		    	<option value="">Title</option>
		        <option value="Mr">Mr</option>
		        <option value="Ms">Ms</option>
		        <option value="Mrs">Mrs</option>
		        <option value="Dr">Dr</option>
		    </select>
   	 		<input type="text" name="fullName" id="fullName"   pattern="^[A-Za-z\s]{1,100}$" placeholder="Full Name" required >
		</div>

        <label for="email">Email Address:</label>
        <input type="email" name="email" id="email"  pattern="^[0-9 A-Z a-z .!]+@[a-z]+\.[a-z]{2,}" required>
		
	     <label for="mobile">Mobile Number:</label>
		<div class="name">
	        <select name="countryCode" id="countryCode" required>
                  <option value="+91">+91</option>
                  <option value="+1">+1</option>
                  <option value="+44">+44</option>
                </select>
	        <input type="text" name="mobile" id="mobile"pattern="^[6-9]+\d{9}"  maxlength="10" required>
	      </div> 
	        
        <label for="address">Full Address:</label>
        <textarea name="address" id="address" rows="4" required></textarea>

        <button type="button" onclick="checkallfields()">Send OTP</button>
        
        <!-- Popup Notification -->
		
        
        
        <div class="OTPContainer">
			<div id="otpSection" style="display:none; margin-top:20px;">
		    	<label for="otp">Enter OTP:</label>
		    	<input type="text" id="otp" maxlength="6" pattern="\d{6}">
				<button type="button" onclick="verifyOtp()">Verify & Submit</button>
			</div>
	
		</div>
    </form>
</div>

<div id="popupMessage" style="
    display:none;
    position: fixed;
    top: 20px;
    right: 20px;
    background-color: #4CAF50;
    color: white;
    padding: 15px 20px;
    border-radius: 5px;
    font-size: 16px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.2);
    z-index: 9999;
    opacity: 0;
    transition: opacity 0.5s ease;
"></div>


<div class="footer">
    &copy; 2025 Electricity Billing System | All Rights Reserved
</div>
<script>
function checkallfields(){
    let title = document.getElementById("title").value;
    if(!title) {
        showPopup("Choose the Title","#f44336");
        return;
    }

    let Name = document.getElementById("fullName").value.trim();
    let nameRegex = /^[A-Za-z\s]{1,100}$/;
    if(!Name) {
        showPopup("Enter Your Name","#f44336");
        return;
    } else if(!nameRegex.test(Name)) {
        showPopup("Invalid Name! Only letters and spaces allowed.","#f44336");
        return;
    }

    let email = document.getElementById("email").value.trim();
    let emailRegex = /^[0-9A-Za-z.!]+@[a-z]+\.[a-z]{2,}$/;
    if(!email) {
        showPopup("Enter Your Email","#f44336");
        return;
    } else if(!emailRegex.test(email)) {
        showPopup("Invalid Email format!","#f44336");
        return;
    }

    let Ccode = document.getElementById("countryCode").value;
    if(!Ccode) {
        showPopup("Choose Country Code","#f44336");
        return;
    }
    
    let mobile = document.getElementById("mobile").value.trim();
    let mobileRegex = /^[6-9]\d{9}$/;
    if(!mobile) {
        showPopup("Enter your Mobile Number","#f44336");
        return;
    } else if(!mobileRegex.test(mobile)) {
        showPopup("Invalid Mobile Number!","#f44336");
        return;
    }

    let address = document.getElementById("address").value.trim();
    if(!address) {
        showPopup("Enter your Address","#f44336");
        return;
    }

    // If all validations pass
    sendOtp();
}



function showPopup(message, bgColor = "#4CAF50") {
    let popup = document.getElementById("popupMessage");
    popup.innerText = message;
    popup.style.backgroundColor = bgColor;
    popup.style.display = "block";
    
    // Fade in
    setTimeout(() => { popup.style.opacity = "1"; }, 10);

    // Hide after 3 seconds
    setTimeout(() => {
        popup.style.opacity = "0";
        setTimeout(() => { popup.style.display = "none"; }, 500);
    }, 5000);
}



function sendOtp() {
    let email = document.getElementById("email").value;

    fetch("<%=request.getContextPath()%>/SendOtpServlet", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "email=" + encodeURIComponent(email)
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === "success") {
        	
        	 showPopup("OTP Sent!", "#4CAF50");
            document.getElementById("otpSection").style.display = "block";
        } else {
        	showPopup("OTP Not Sent!", "#f44336");
        }
    });
}

function verifyOtp() {
    let otp = document.getElementById("otp").value;
    fetch("<%=request.getContextPath()%>/VerifyOtpServlet", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "otp=" + encodeURIComponent(otp)
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === "success") {
            showPopup(data.message, "#4CAF50");
            document.querySelector("form").submit();
        } else {
        	showPopup(data.message, "#f44336");
        }
    });
}
</script>
</body>

</html>
	