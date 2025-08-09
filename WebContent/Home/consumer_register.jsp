<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Electricity Consumer Registration</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: #f2f2f2 url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s") no-repeat center center / cover;
      color: #333;
    }

    .main {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }

    .container {
      background: rgba(255, 255, 255, 0.95);
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      max-width: 1200px;
      width: 100%;
      overflow: hidden;
      padding: 20px;
    }

    .signup-content {
      display: flex;
      gap: 20px;
      flex-wrap: nowrap;
    }

    /* Both divs side by side */
    .form-div, .hidden-div {
      flex: 1 1 50%;
      padding: 20px 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
      background: #fff;
    }

    /* Hidden div default hidden */
    .hidden-div {
      display: none;
    }

    /* Toggle button */
    #toggleButton {
      display: block;
      margin: 0 auto 30px auto;
      padding: 12px 30px;
      font-size: 16px;
      font-weight: 600;
      border-radius: 5px;
      border: none;
      cursor: pointer;
      background-color: #007bff;
      color: white;
      transition: background-color 0.3s ease;
    }
    #toggleButton:hover {
      background-color: #0056b3;
    }

    .form-title {
      font-size: 28px;
      font-weight: 700;
      color: #333;
      margin-bottom: 40px;
      text-align: center;
    }

    .form-group {
      margin-bottom: 30px;
      position: relative;
    }

    .form-group label {
      position: absolute;
      left: 10px;
      top: 50%;
      transform: translateY(-50%);
      color: #666;
    }

    .form-group input,
    .form-group select {
      width: 100%;
      padding: 10px 10px 10px 45px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 17px;
      outline: none;
      transition: all 0.3s;
    }

    .form-group input:focus,
    .form-group select:focus {
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
    }

    .form-button {
      text-align: center;
      margin-top: 40px;
    }

    .form-submit {
      background: #007bff;
      color: white;
      border: none;
      padding: 14px 40px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 18px;
      font-weight: 600;
      transition: background 0.3s;
    }

    .form-submit:hover {
      background: #0056b3;
    }

    .already-member {
      text-align: center;
      margin-top: 20px;
      color: #666;
    }

    .already-member a {
      color: #007bff;
      text-decoration: none;
      font-weight: 600;
    }

    .already-member a:hover {
      text-decoration: underline;
    }

    .error-message {
      color: red;
      text-align: center;
      margin-bottom: 20px;
    }

    @media (max-width: 768px) {
      .signup-content {
        flex-wrap: wrap;
      }
      .form-div, .hidden-div {
        flex: 1 1 100%;
      }
      #toggleButton {
        width: 100%;
      }
    }
    /* OTP Section Styling */
.OTPContainer {
  background: #fff;
  padding: 25px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.05);
  text-align: center;
  max-width: 400px;
  margin: 0 auto;
}

.OTPContainer h3 {
  margin-bottom: 15px;
  font-weight: 600;
  font-size: 20px;
  color: #333;
}

.OTPContainer label {
  display: block;
  margin-bottom: 10px;
  font-size: 16px;
  color: #555;
}

.OTPContainer input[type="text"] {
  letter-spacing: 5px;
  text-align: center;
  font-size: 20px;
  padding: 10px;
  width: 180px;
  border: 1px solid #ccc;
  border-radius: 8px;
  margin-bottom: 20px;
  outline: none;
  transition: all 0.3s ease;
}

.OTPContainer input[type="text"]:focus {
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0,123,255,0.3);
}

.OTPContainer button {
  background: #007bff;
  color: white;
  border: none;
  padding: 10px 25px;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  font-weight: 600;
  transition: background 0.3s;
}

.OTPContainer button:hover {
  background: #0056b3;
}

.OTPContainer .resend-link {
  display: block;
  margin-top: 10px;
  font-size: 14px;
  color: #007bff;
  cursor: pointer;
}

.OTPContainer .resend-link:hover {
  text-decoration: underline;
}
    
  </style>
</head>
<body>
  <div class="main">
    <section class="signup">
      <div class="container">

        <div class="signup-content">
          <!-- Form Div -->
          <div class="form-div">
            <h2 class="form-title">Consumer Registration</h2>
            
            <% if(request.getAttribute("errorMessage") != null) { %>
              <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
              </div>
            <% } %>
            
            <form method="post" class="register-form" id="registerForm"  action="<%= request.getContextPath() %>/RegisterConsumerServlet">
              <div class="data">
              
		              <div class="form-group">
		                <label for="ConsumerID"><i class="zmdi zmdi-assignment"></i></label>
		                <input type="text" name="ConsumerID" id="ConsumerID" placeholder="Consumer Id" pattern="^\d{13}$" minlength="13" maxlength="13" required />
		              </div>
		
		              <div class="form-group">
		                <label for="billNo"><i class="zmdi zmdi-assignment"></i></label>
		                <input type="text" name="billNo" id="billNo" placeholder="Bill Number" pattern="^\d{5}$" minlength="5" maxlength="5" required />
		              </div>
		
		              <div class="form-group">
		                <label for="userId"><i class="zmdi zmdi-account-circle"></i></label>
		                <input type="text" name="userId" id="userId" placeholder="User ID" pattern="^\S{5,20}$" minlength="5" maxlength="20" required />
		              </div>
		
		              <div class="form-group">
		                <label for="password"><i class="zmdi zmdi-lock"></i></label>
		                <input type="text" name="password" id="password" placeholder="Password" pattern="^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[@#$%^&+=]).{8,}$" maxlength="30" minlength="8" required />
		              </div>
		
		              <div class="form-group">
		                <label for="confirmPassword"><i class="zmdi zmdi-lock-outline"></i></label>
		                <input type="text" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" pattern="^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[@#$%^&+=]).{8,}$" maxlength="30" minlength="8" required />
		              </div>
              
		              <div class="form-group form-button">
		              	<button type="button" id="toggleButton" onclick="validateForm()">Send OTP</button>
		              </div>
		
		              <div class="already-member">
		                <a href="login.jsp" class="signup-image-link">I am already a member</a>
		              </div>
		          </div>
              
              
              <div class="OTPContainer" style="display:none">
				  <h3>Verify OTP</h3>
				  <label for="otp">Enter OTP:</label>
				  <input type="text" id="otp" maxlength="6" pattern="\d{6}">
				  <br>
				  <button type="button" onclick="verifyOtp()">Verify & Submit</button>
				</div>
              
              
            </form>
          </div>
        </div>
      </div>
    </section>
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
  <script>
  function validateForm() {

	  // Helper: validate input by id, with message to show on failure
	  function validateInput(id, message) {
	    const input = document.getElementById(id);
	    if (!input) return false; // no element found
	    const val = input.value.trim();
	    if (!val) {
	      showPopup(message, "#f44336");
	      input.focus();
	      return false;
	    }
	    const pattern = input.getAttribute("pattern");
	    if (pattern) {
	      const regex = new RegExp(pattern);
	      if (!regex.test(val)) {
	        showPopup(message, "#f44336");
	        input.focus();
	        return false;
	      }
	    }
	    return true;
	  }

	  // Validate all fields one by one with proper messages:
	  if (!validateInput("ConsumerID", "Consumer ID must be exactly 13 digits")) return false;
	  if (!validateInput("billNo", "Bill Number must be exactly 5 digits")) return false;
	  if (!validateInput("userId", "User ID must be 5 to 20 characters with no spaces")) return false;
	  if (!validateInput("password", "Password must be at least 8 characters, include uppercase, lowercase, number and special character")) return false;
	  if (!validateInput("confirmPassword", "Confirm Password must match the password and follow the same rules")) return false;

	  // Check password matching separately
	  const password = document.getElementById("password").value.trim();
	  const confirmPassword = document.getElementById("confirmPassword").value.trim();
	  if (password !== confirmPassword) {
	    showPopup("Passwords didn't match!", "#f44336");
	    document.getElementById("confirmPassword").focus();
	  }
	 
	  //verify details
	  validateIds();
	  
	  
	}
  
  
  
  function validateIds()
  {
	  let ConsumerID = document.getElementById("ConsumerID").value;
	    let billNo = document.getElementById("billNo").value;
	    
	    //finding email from consumerid
	    
	     const params = "ConsumerID=" + encodeURIComponent(ConsumerID) +
                 "&billNo=" + encodeURIComponent(billNo);
	    
	    fetch("<%=request.getContextPath()%>/ValidateCredentialsGetOTP", {
	        method: "POST",
	        headers: { "Content-Type": "application/x-www-form-urlencoded" },
	        body: params
	    })
	    .then(res => res.json())
	    .then(data => {
	        if (data.status === "success") {
	        	
	        	sendOtp(data.email)
	        	 
	        } else {
	        	showPopup(data.message, "#f44336");
	        }
	    });
  }
  
  
  
  
  function verifyOtp() {
	    let otp = document.getElementById("otp").value;
	    console.log(otp);
	    fetch("<%=request.getContextPath()%>/VerifyOtpServlet", {
	        method: "POST",
	        headers: { "Content-Type": "application/x-www-form-urlencoded" },
	        body: "otp=" + encodeURIComponent(otp)
	    })
	    .then(res => res.json())
	    .then(data => {
	        if (data.status === "success") {
	            showPopup("OTP verified!", "#4CAF50");
	            document.querySelector("form").submit();
	        } else {
	        	showPopup("Invalid OTP!", "#f44336");
	        	return;
	        }
	    });
	}
  
  function sendOtp(email) {
	    
	    fetch("<%=request.getContextPath()%>/SendOtpServlet", {
	        method: "POST",
	        headers: { "Content-Type": "application/x-www-form-urlencoded" },
	        body: "email=" + encodeURIComponent(email)
	    })
	    .then(res => res.json())
	    .then(data => {
	        if (data.status === "success") {
	        	
	        	 showPopup("OTP Sent!", "#4CAF50");
	        	 toggleDivs()
	        } else {
	        	showPopup("OTP Not Sent!", "#f44336");
	        }
	    });
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
  
 

    function toggleDivs() {
      const heading = document.querySelector('.form-title');
      const formDiv = document.querySelector('.data');
      const hiddenDiv = document.querySelector('.OTPContainer');
      const btn = document.getElementById('toggleButton');

      if (formDiv.style.display !== 'none') {
    	 heading.style.display = 'none';
        formDiv.style.display = 'none';
        hiddenDiv.style.display = 'block';
        btn.textContent = 'Show Form';
      } else {
    	heading.style.display = 'block';
        formDiv.style.display = 'block';
        hiddenDiv.style.display = 'none';
        btn.textContent = 'Show Hidden Div';
      }
    }
  </script>
</body>
</html>
