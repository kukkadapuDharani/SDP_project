<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Register Club</title>
    <link rel="stylesheet" href="css/adminregisterclub.css" />
</head>
<body>
    <div class="admin-container">
        <h2>Admin - Club Registrations</h2>
        
        <!-- Form to Register New Club -->
        <h3>Register New Club</h3>
        <form method="post" action="adminregisterclub.jsp">
            <label for="idNumber">ID Number:</label>
            <input type="text" id="idNumber" name="idNumber" required />

            <label for="clubName">Club Name:</label>
            <input type="text" id="clubName" name="clubName" required />

            <label for="department">Department:</label>
            <input type="text" id="department" name="department" required />

            <label for="yearOfStudy">Year of Study:</label>
            <input type="text" id="yearOfStudy" name="yearOfStudy" required />

            <button type="submit">Register</button>
        </form>

        <%
            // Handle form submission for registering new club
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String idNumber = request.getParameter("idNumber");
                String clubName = request.getParameter("clubName");
                String department = request.getParameter("department");
                String yearOfStudy = request.getParameter("yearOfStudy");

                Connection conn = null;
                PreparedStatement stmt = null;

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                    // Insert data into the database
                    String sql = "INSERT INTO ClubRegistration (idNumber, clubName, department, yearOfStudy) VALUES (?, ?, ?, ?)";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, idNumber);
                    stmt.setString(2, clubName);
                    stmt.setString(3, department);
                    stmt.setString(4, yearOfStudy);

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        out.println("<p>Registration successful!</p>");
                    } else {
                        out.println("<p>Registration failed. Please try again.</p>");
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

        <!-- Display Registered Club Data -->
        <h3>Registered Clubs</h3>
        <table class="club-table">
            <thead>
                <tr>
                    <th>ID Number</th>
                    <th>Club Name</th>
                    <th>Department</th>
                    <th>Year of Study</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Fetch and display registered clubs
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                        // Fetch registered clubs from the database
                        String sql = "SELECT * FROM ClubRegistration";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        // Display data in table
                        while (rs.next()) {
                            String idNumber = rs.getString("idNumber");
                            String clubName = rs.getString("clubName");
                            String department = rs.getString("department");
                            String yearOfStudy = rs.getString("yearOfStudy");

                            out.println("<tr>");
                            out.println("<td>" + idNumber + "</td>");
                            out.println("<td>" + clubName + "</td>");
                            out.println("<td>" + department + "</td>");
                            out.println("<td>" + yearOfStudy + "</td>");
                            out.println("</tr>");
                        }

                    } catch (Exception e) {
                        out.println("<p>Error fetching data: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
