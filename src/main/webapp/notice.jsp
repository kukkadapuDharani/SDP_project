<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notice Board - Activities</title>
    <link rel="stylesheet" href="css/notice.css" />
</head>
<body>
    <div class="notice-container">
        <h1>Notice Board - Activities</h1>
        <table class="activities-table">
            <thead>
                <tr>
                    <th>Program</th>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Details</th>
                    <th>Register</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                        // SQL query to fetch activities
                        String sql = "SELECT * FROM activities";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String program = rs.getString("program");
                            String type = rs.getString("type");
                            String date = rs.getString("date");
                            String details = rs.getString("details");

                            out.println("<tr>");
                            out.println("<td>" + program + "</td>");
                            out.println("<td>" + type + "</td>");
                            out.println("<td>" + date + "</td>");
                            out.println("<td>" + details + "</td>");
                            out.println("<td><a href='registration.jsp' class='register-btn'>Register</a></td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
