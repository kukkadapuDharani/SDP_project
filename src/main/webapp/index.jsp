<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
</head>
<body>
    <div class="login-window">
        <div class="login-header">
            <i class="fas fa-user-circle"></i> Sign In
        </div>
        <div class="login-content">
            <div class="form-group">
                <label for="T1">Username*</label>
                <input type="text" id="T1" placeholder="Enter your username" required />
            </div>
            <div class="form-group">
                <label for="T2">Password*</label>
                <input type="password" id="T2" placeholder="Enter your password" required />
            </div>
            <div class="forgot-password">
                Forgot <span class="link" onclick="forgotPassword()">Password?</span>
            </div>
            <button class="signin-button" onclick="signIn()">Sign In</button>
            <div class="message" id="ack"></div>
            <div class="signup-section">
                Don't have an account? 
                <span class="link" onclick="redirectToSignup()">SIGN UP NOW</span>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script type="text/javascript">
        function signIn() {
            const username = document.getElementById("T1").value;
            const password = document.getElementById("T2").value;

            if (!username || !password) {
                swal("Error", "All fields are required!", "error");
                return;
            }

            const data = JSON.stringify({ username, password });

            fetch("http://localhost:8080/user/login", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: data,
            })
            .then((response) => response.text()) // Get response text
            .then((message) => {
                if (message === "User logged in successfully!") {
                    swal("Success", message, "success").then(() => {
                        window.location.href = "home.jsp"; // Redirect to home page
                    });
                } else {
                    swal("Error", message, "error");
                }
            })
            .catch((error) => {
                console.error("Error:", error);
                swal("Error", "Something went wrong with the request!", "error");
            });
        }

        function redirectToSignup() {
            window.location.href = "signup.jsp"; // Redirect to signup page
        }

        function forgotPassword() {
            swal("Info", "Password reset feature coming soon!", "info");
        }
    </script>
</body>
</html>
