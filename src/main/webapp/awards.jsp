<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Awards Achieved by Students</title>
    <link rel="stylesheet" href="css/awards.css" />
    <script>
        // Function to handle search filtering
        function filterTable() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("awardsTable");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those that don't match the search query
            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";  // Initially hide the row
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";  // Show row if it matches the search term
                            break;
                        }
                    }
                }
            }
        }
    </script>
</head>
<body>
    <div class="awards-container">
        <div class="sidebar">
            <a href="home.jsp" class="back-btn">← Back To Dashboard</a>
        </div>
        <div class="content">
            <h2>Awards Achieved by Students</h2>
            
            <!-- Search Bar -->
            <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search by name, event, or award..." class="search-bar">

            <!-- Table to display awards -->
            <table class="awards-table" id="awardsTable">
                <thead>
                    <tr>
                        <th>Award ID</th>  <!-- Added Award ID column -->
                        <th>Full Name</th>
                        <th>Roll Number</th>
                        <th>Event</th>
                        <th>Category</th>
                        <th>Award Type</th>
                        <th>Leadership Role</th>
                        <th>Participation Type</th>
                        <th>Award Date</th>
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

                            // SQL query to fetch student awards, including award_id
                            String sql = "SELECT * FROM awards";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            // Iterate through the result set and display each award in the table
                            while (rs.next()) {
                                int awardId = rs.getInt("award_id");  // Fetch award_id from the result set
                                String fullName = rs.getString("fullName");
                                String rollNo = rs.getString("rollNo");
                                String event = rs.getString("event");
                                String category = rs.getString("category");
                                String awardType = rs.getString("awardType");
                                String leadershipRole = rs.getString("leadershipRole");
                                String participationType = rs.getString("participationType");
                                String awardDate = rs.getString("awardDate");

                                out.println("<tr>");
                                out.println("<td>" + awardId + "</td>");  // Display award_id in the table
                                out.println("<td>" + fullName + "</td>");
                                out.println("<td>" + rollNo + "</td>");
                                out.println("<td>" + event + "</td>");
                                out.println("<td>" + category + "</td>");
                                out.println("<td>" + awardType + "</td>");
                                out.println("<td>" + (leadershipRole != null ? leadershipRole : "N/A") + "</td>");
                                out.println("<td>" + participationType + "</td>");
                                out.println("<td>" + awardDate + "</td>");
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
    </div>
</body>
</html>
