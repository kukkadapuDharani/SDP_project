<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Sign In</title>
    <link rel="stylesheet" href="css/admin.css" />
</head>
<body>
    <div class="login-container">
        <h1>Admin Sign In</h1>
        <form method="post" action="adminhome.jsp">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required />
            </div>
            <button type="submit" class="signin-button">Sign In</button>
        </form>
        <div id="error-message" style="color:red;"></div>
    </div>

    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        if (username != null && password != null) {
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                // Validate user credentials
                String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, username);
                stmt.setString(2, password);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    // If credentials are correct, redirect to admin dashboard (or wherever you need to redirect)
                    response.sendRedirect("admindashboard.jsp");
                } else {
                    // If invalid credentials, show error message
                    out.println("<script type='text/javascript'>document.getElementById('error-message').innerText = 'Invalid Username or Password!';</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>