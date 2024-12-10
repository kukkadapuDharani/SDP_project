<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Clubs Schedule</title>
    <link rel="stylesheet" href="css/schedule.css" />
    <script>
        // Function to handle search filtering
        function filterTable() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("scheduleTable");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none"; // Initially hide the row
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = ""; // Show row if it matches the search term
                            break;
                        }
                    }
                }
            }
        }
    </script>
</head>
<body>
    <div class="schedule-container">
        <div class="sidebar">
            <a href="home.jsp" class="back-btn">← Back To Dashboard</a>
        </div>
        <div class="content">
            <h2>Registered Clubs Schedule</h2>

            <!-- Search Bar -->
            <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search for clubs, events, or categories..." class="search-bar">

            <!-- Table for 'registrationform' data -->
            <h3>Event Registrations</h3>
            <table class="schedule-table" id="scheduleTable">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Roll Number</th>
                        <th>Department</th>
                        <th>Event</th>
                        <th>Category</th>
                        <th>Club</th>
                        <th>Team/Individual</th>
                        <th>Team Name</th>
                        <th>Team Members</th>
                        <th>Event Date</th>
                        <th>Preferred Time Slot</th>
                        <th>Participation Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        Statement stmt1 = null;
                        ResultSet rs1 = null;

                        try {
                            // Database connection
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                            // Fetch data from 'registrationform'
                            String sql1 = "SELECT * FROM registrationform";
                            stmt1 = conn.createStatement();
                            rs1 = stmt1.executeQuery(sql1);

                            // Display each row in the table
                            while (rs1.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs1.getString("fullName") + "</td>");
                                out.println("<td>" + rs1.getString("rollNo") + "</td>");
                                out.println("<td>" + rs1.getString("department") + "</td>");
                                out.println("<td>" + rs1.getString("event") + "</td>");
                                out.println("<td>" + rs1.getString("category") + "</td>");
                                out.println("<td>" + rs1.getString("club") + "</td>");
                                out.println("<td>" + rs1.getString("team") + "</td>");
                                out.println("<td>" + (rs1.getString("teamName") != null ? rs1.getString("teamName") : "N/A") + "</td>");
                                out.println("<td>" + rs1.getInt("teamMembers") + "</td>");
                                out.println("<td>" + rs1.getString("eventDate") + "</td>");
                                out.println("<td>" + rs1.getString("timeSlot") + "</td>");
                                out.println("<td>" + rs1.getString("participationType") + "</td>");
                                out.println("</tr>");
                            }
                        } catch (Exception e) {
                            out.println("<p>Error fetching Event Registrations: " + e.getMessage() + "</p>");
                        } finally {
                            if (rs1 != null) rs1.close();
                            if (stmt1 != null) stmt1.close();
                        }
                    %>
                </tbody>
            </table>

            <!-- Table for 'ClubRegistration' data -->
            <h3>Club Memberships</h3>
            <table class="schedule-table">
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
                        Statement stmt2 = null;
                        ResultSet rs2 = null;

                        try {
                            // Fetch data from 'ClubRegistration'
                            String sql2 = "SELECT * FROM ClubRegistration";
                            stmt2 = conn.createStatement();
                            rs2 = stmt2.executeQuery(sql2);

                            // Display each row in the table
                            while (rs2.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs2.getString("idNumber") + "</td>");
                                out.println("<td>" + rs2.getString("clubName") + "</td>");
                                out.println("<td>" + rs2.getString("department") + "</td>");
                                out.println("<td>" + rs2.getString("yearOfStudy") + "</td>");
                                out.println("</tr>");
                            }
                        } catch (Exception e) {
                            out.println("<p>Error fetching Club Memberships: " + e.getMessage() + "</p>");
                        } finally {
                            if (rs2 != null) rs2.close();
                            if (stmt2 != null) stmt2.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
