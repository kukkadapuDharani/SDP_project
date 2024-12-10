<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/signup.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
</head>
<body>
    <div class="signup-window">
        <div class="signup-header">
            <i class="fas fa-user-plus"></i> Sign Up
        </div>
        <div class="signup-content">
            <div class="form-group">
                <label for="firstname">First Name*</label>
                <input type="text" id="firstname" placeholder="Enter your first name" required />
            </div>
            <div class="form-group">
                <label for="lastname">Last Name*</label>
                <input type="text" id="lastname" placeholder="Enter your last name" required />
            </div>
            <div class="form-group">
                <label for="mobileno">Mobile Number*</label>
                <input type="text" id="mobileno" placeholder="Enter your mobile number" required />
            </div>
            <div class="form-group">
                <label for="emailid">Email*</label>
                <input type="email" id="emailid" placeholder="Enter your email" required />
            </div>
            <div class="form-group">
                <label for="username">Username*</label>
                <input type="text" id="username" placeholder="Choose a username" required />
            </div>
            <div class="form-group">
                <label for="password">Password*</label>
                <input type="password" id="password" placeholder="Enter a password" required />
            </div>
            <button class="signup-button" onclick="signUp()">Sign Up</button>
            <div class="message" id="signupAck"></div>
            <div class="signin-section">
                Already have an account? 
                <span class="link" onclick="redirectToSignIn()">SIGN IN NOW</span>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        function signUp() {
            const firstname = document.getElementById("firstname").value;
            const lastname = document.getElementById("lastname").value;
            const mobileno = document.getElementById("mobileno").value;
            const emailid = document.getElementById("emailid").value;
            const username = document.getElementById("username").value;
            const password = document.getElementById("password").value;

            if (!firstname || !lastname || !mobileno || !emailid || !username || !password) {
                swal("Error", "All fields are required!", "error");
                return;
            }

            const data = JSON.stringify({
                firstname,
                lastname,
                mobileno,
                emailid,
                username,
                password
            });

            fetch("http://localhost:8080/user/signup", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: data,
            })
                .then((response) => response.text())
                .then((message) => {
                    if (message === "User registered successfully!") {
                        swal("Success", message, "success").then(() => {
                            window.location.href = "index.jsp"; // Redirect to sign-in page
                        });
                    } else {
                        swal("Error", message, "error");
                    }
                })
                .catch((error) => {
                    console.error("Error:", error);
                    swal("Error", "Something went wrong!", "error");
                });
        }

        function redirectToSignIn() {
            window.location.href = "index.jsp"; // Redirect to sign-in page
        }
    </script>
</body>
</html>
