<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Electricity Consumer Registration</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      background: #f2f2f2;
      color: #333;
      line-height: 1.6;
      background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl2e6phZYZ5_SO0KCIPgB2doz9WrsJvIOD_g&s");
      background-repeat: no-repeat;
      background-size: cover;
      background-position: center;
      height: 100%;
    }
    
    .main {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
    }
    
    .container {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      width: 900px;
      max-width: 100%;
      overflow: hidden;
    }
    
    .signup-content {
      display: flex;
      flex-wrap: wrap;
    }
    
    .signup-form {
      width: 50%;
      padding: 40px;
    }
    
    .signup-image {
      width: 50%;
      padding: 0;
      background: #f8f9fa;
      display: flex;
      justify-content: flex-end;
    }
    
    .signup-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    
    .form-title {
      font-size: 24px;
      font-weight: 700;
      color: #333;
      margin-bottom: 30px;
      text-align: center;
    }
    
    .form-group {
      margin-bottom: 20px;
      position: relative;
    }
    
    .form-group label {
      position: absolute;
      left: 10px;
      top: 50%;
      transform: translateY(-50%);
      color: #666;
    }
    
    .form-group input, .form-group select {
      width: 100%;
      padding: 10px 10px 10px 35px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
      outline: none;
      transition: all 0.3s;
    }
    
    .form-group input:focus, .form-group select:focus {
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
    }
    
    .form-button {
      text-align: center;
      margin-top: 30px;
    }
    
    .form-submit {
      background: #007bff;
      color: white;
      border: none;
      padding: 12px 30px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      font-weight: 600;
      transition: background 0.3s;
    }
    
    .form-submit:hover {
      background: #0056b3;
    }
    
    .already-member {
      text-align: center;
      margin-top: 15px;
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
      margin-bottom: 15px;
    }
    
    /* Mobile number and country code side by side */
    .mobile-number-group {
      display: flex;
      gap: 5%;
    }
    
    #countryCode {
      width: 30% !important;
      padding-left: 35px;
    }
    
    #mobile {
      width: 65% !important;
      padding-left: 15px;
      margin-left: 0;
    }
    
    @media (max-width: 768px) {
      .signup-form, .signup-image {
        width: 100%;
      }
      
      .signup-content {
        flex-direction: column;
      }
      
      .mobile-number-group {
        flex-direction: column;
        gap: 0;
      }
      
      #countryCode, #mobile {
        width: 100% !important;
        margin-bottom: 10px;
      }
    }
    .signup-image img{
    border-radius:5px;
    }
    a{
    
     }
  </style>
</head>
<body>
  <div class="main">
    <section class="signup">
      <div class="container">
        <div class="signup-content">
          <div class="signup-form">
            <h2 class="form-title">Consumer Registration</h2>
            
            <% if(request.getAttribute("errorMessage") != null) { %>
              <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
              </div>
            <% } %>
            
            <form method="post" action="RegisterConsumerServlet" class="register-form" id="registerForm" onsubmit="return validateForm()">


				<div class="form-group">
                <label for="ConsumerID"><i class="zmdi zmdi-assignment"></i></label>
                <input type="text" name="ConsumerID" id="ConsumerID" placeholder="Consumer Id" pattern="^\d{13}$" minlength="13" maxlength="13" required />
              	</div>
				

              <div class="form-group">
                <label for="billNo"><i class="zmdi zmdi-assignment"></i></label>
                <input type="text" name="billNo" id="billNo" placeholder="Bill Number" pattern="^\d{5}$" minlength="5" maxlength="5" required />
              </div>

              <div class="form-group">
                <label for="title"><i class="zmdi zmdi-account-box"></i></label>
                <select name="title" id="title" required>
                  <option value="">--Select Title--</option>
                  <option value="Mr">Mr</option>
                  <option value="Mrs">Mrs</option>
                  <option value="Ms">Ms</option>
                </select>
              </div>

              <div class="form-group">
                <label for="custName"><i class="zmdi zmdi-account"></i></label>
                <input type="text" name="custName" id="custName" placeholder="Customer Name" pattern="^[A-Za-z\s]{1,100}$" maxlength="100" required />
              </div>
              
              <div class="form-group">
                <label for="custAge"><i class="zmdi zmdi-account"></i></label>
                <input type="text" name="custAge" id="custAge" placeholder="Customer Age"  pattern="^(1[89]|[2-9][0-9]|100)$"  maxlength="3" required  title="Age must be greater than 18 " />
              </div>
	
              <div class="form-group">
                <label for="email"><i class="zmdi zmdi-email"></i></label>
                <input type="email" name="email" id="email" placeholder="Email" pattern="^[0-9 A-Z a-z .!]+@[a-z]+\.[a-z]{2,}" required />
              </div>

              <div class="form-group">
                <label for="countryCode"><i class="zmdi zmdi-smartphone-android"></i></label>
                <select name="countryCode" id="countryCode" required>
                  <option value="+91">+91 India</option>
                  <option value="+1">+1 USA</option>
                  <option value="+44">+44 UK</option>
                </select>
                <input type="text" name="mobile" id="mobile" placeholder="Mobile Number" pattern="^[6-9]+\d{9}"  maxlength="10" required />
              </div>
              
              <div class="form-group">
                <label for="address"><i class="zmdi zmdi-home"></i></label>
                <input type="text" name="address" id="address" placeholder="Address" pattern="^.{5,250}$" minlength="5" maxlength="250" required />
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
                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
              </div>
              <div>
              <a href="login.jsp" class="signup-image-link">I am already a member</a>
              </div>

            </form>
          </div>
          <div class="signup-image">
            <figure><img src="https://www.argusmedia.com/_next/image?url=%2F-%2Fmedia%2Fproject%2Fargusmedia%2Fmainsite%2Fimages%2F04-gas-and-power%2Fmarket%2Fmobile%2Fherobanner390x620_electricpowerpage.jpg%3Fh%3D620%26iar%3D0%26w%3D390%26rev%3D270ee15dc2344e28be2645727306aafa%26hash%3DABB329532160CE3968FD91691A0E8985&w=828&q=75" alt="signup image"></figure>
            
          </div>
        </div>
      </div>
    </section>
  </div>

  <script>
    function validateForm() {
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirmPassword").value;
      if (password !== confirmPassword) {
        alert("Passwords didn't match!");
        return false;
      }
      return true;
    }
  </script>
</body>
</html>