<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Activities</title>
    <link rel="stylesheet" href="css/adminnotice.css" />
</head>
<body>
    <div class="admin-container">
        <h1>Admin - Manage Activities</h1>

        <!-- Form to Add New Activity -->
        <h3>Add New Activity</h3>
        <form method="post" action="adminnotice.jsp">
            <label for="program">Program Name:</label>
            <input type="text" id="program" name="program" required />

            <label for="type">Type:</label>
            <input type="text" id="type" name="type" required />

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required />

            <label for="details">Details:</label>
            <textarea id="details" name="details" required></textarea>

            <button type="submit">Add Activity</button>
        </form>

        <% 
            // Handle form submission for adding new activity
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String program = request.getParameter("program");
                String type = request.getParameter("type");
                String date = request.getParameter("date");
                String details = request.getParameter("details");

                Connection conn = null;
                PreparedStatement stmt = null;

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                    // Insert data into the activities table
                    String sql = "INSERT INTO activities (program, type, date, details) VALUES (?, ?, ?, ?)";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, program);
                    stmt.setString(2, type);
                    stmt.setString(3, date);
                    stmt.setString(4, details);

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        out.println("<p>Activity added successfully!</p>");
                    } else {
                        out.println("<p>Failed to add activity. Please try again.</p>");
                    }

                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                    }
                }
            }

            // Delete an activity
            if ("delete".equals(request.getParameter("action"))) {
                String activityId = request.getParameter("activityId");
                Connection conn = null;
                PreparedStatement stmt = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                    String sql = "DELETE FROM activities WHERE id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, Integer.parseInt(activityId));

                    int rowsDeleted = stmt.executeUpdate();
                    if (rowsDeleted > 0) {
                        out.println("<p>Activity deleted successfully!</p>");
                    } else {
                        out.println("<p>Failed to delete activity. Please try again.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>

        <!-- Display Existing Activities -->
        <h3>Existing Activities</h3>
        <table class="activities-table">
            <thead>
                <tr>
                    <th>Program</th>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Details</th>
                    <th>Actions</th>
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
                            String activityId = String.valueOf(rs.getInt("id"));
                            String program = rs.getString("program");
                            String type = rs.getString("type");
                            String date = rs.getString("date");
                            String details = rs.getString("details");

                            out.println("<tr>");
                            out.println("<td>" + program + "</td>");
                            out.println("<td>" + type + "</td>");
                            out.println("<td>" + date + "</td>");
                            out.println("<td>" + details + "</td>");
                            out.println("<td><a href='adminnotice.jsp?action=delete&activityId=" + activityId + "'>Delete</a></td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error fetching activities: " + e.getMessage() + "</p>");
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
