<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Awards Achieved by Students</title>
    <link rel="stylesheet" href="css/adminawards.css" />
    <script>
        // JavaScript function for searching/filtering the table
        function filterTable() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("awardsTable");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
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
            <a href="adminhome.jsp" class="back-btn">← Back To Dashboard</a>
        </div>
        <div class="content">
            <h2>Awards Achieved by Students</h2>

            <!-- Search Bar -->
            <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search by name, event, or award..." class="search-bar">

            <!-- Add Award Form -->
            <h3>Add New Award</h3>
            <form action="adminawards.jsp" method="post">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required />
                
                <label for="rollNo">Roll Number:</label>
                <input type="text" id="rollNo" name="rollNo" required />
                
                <label for="event">Event:</label>
                <input type="text" id="event" name="event" required />
                
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" required />
                
                <label for="awardType">Award Type:</label>
                <input type="text" id="awardType" name="awardType" required />
                
                <label for="leadershipRole">Leadership Role:</label>
                <input type="text" id="leadershipRole" name="leadershipRole" />
                
                <label for="participationType">Participation Type:</label>
                <input type="text" id="participationType" name="participationType" />
                
                <label for="awardDate">Award Date:</label>
                <input type="date" id="awardDate" name="awardDate" required />
                
                <button type="submit" name="action" value="insert">Add Award</button>
            </form>

            <!-- Table to display awards -->
            <table class="awards-table" id="awardsTable">
                <thead>
                    <tr>
                        <th>Award ID</th>
                        <th>Full Name</th>
                        <th>Roll Number</th>
                        <th>Event</th>
                        <th>Category</th>
                        <th>Award Type</th>
                        <th>Leadership Role</th>
                        <th>Participation Type</th>
                        <th>Award Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Database connection setup
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            // Establishing connection
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                            // Handle insert operation (adding new award)
                            if ("insert".equals(request.getParameter("action"))) {
                                String fullName = request.getParameter("fullName");
                                String rollNo = request.getParameter("rollNo");
                                String event = request.getParameter("event");
                                String category = request.getParameter("category");
                                String awardType = request.getParameter("awardType");
                                String leadershipRole = request.getParameter("leadershipRole");
                                String participationType = request.getParameter("participationType");
                                String awardDate = request.getParameter("awardDate");

                                // SQL query for insert
                                String sqlInsert = "INSERT INTO awards (fullName, rollNo, event, category, awardType, leadershipRole, participationType, awardDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                                try (PreparedStatement pst = conn.prepareStatement(sqlInsert)) {
                                    pst.setString(1, fullName);
                                    pst.setString(2, rollNo);
                                    pst.setString(3, event);
                                    pst.setString(4, category);
                                    pst.setString(5, awardType);
                                    pst.setString(6, leadershipRole);
                                    pst.setString(7, participationType);
                                    pst.setString(8, awardDate);
                                    int result = pst.executeUpdate();

                                    if (result > 0) {
                                        out.println("<p>New award added successfully!</p>");
                                    } else {
                                        out.println("<p>Error: Could not add the award.</p>");
                                    }
                                }
                            }

                            // Handle delete operation
                            String deleteId = request.getParameter("deleteId");
                            if (deleteId != null) {
                                String sqlDelete = "DELETE FROM awards WHERE award_id = ?";
                                try (PreparedStatement pst = conn.prepareStatement(sqlDelete)) {
                                    pst.setInt(1, Integer.parseInt(deleteId));
                                    int result = pst.executeUpdate();

                                    if (result > 0) {
                                        out.println("<p>Award deleted successfully!</p>");
                                    } else {
                                        out.println("<p>Error: Could not delete the award.</p>");
                                    }
                                }
                            }

                            // SQL query to fetch student awards
                            String sql = "SELECT * FROM awards";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            // Display each award in the table
                            while (rs.next()) {
                                int awardId = rs.getInt("award_id");
                                String fullName = rs.getString("fullName");
                                String rollNo = rs.getString("rollNo");
                                String event = rs.getString("event");
                                String category = rs.getString("category");
                                String awardType = rs.getString("awardType");
                                String leadershipRole = rs.getString("leadershipRole");
                                String participationType = rs.getString("participationType");
                                String awardDate = rs.getString("awardDate");

                                out.println("<tr>");
                                out.println("<td>" + awardId + "</td>");
                                out.println("<td>" + fullName + "</td>");
                                out.println("<td>" + rollNo + "</td>");
                                out.println("<td>" + event + "</td>");
                                out.println("<td>" + category + "</td>");
                                out.println("<td>" + awardType + "</td>");
                                out.println("<td>" + (leadershipRole != null ? leadershipRole : "N/A") + "</td>");
                                out.println("<td>" + (participationType != null ? participationType : "N/A") + "</td>");
                                out.println("<td>" + awardDate + "</td>");
                                out.println("<td><a href='adminawards.jsp?deleteId=" + awardId + "' class='delete-btn'>Delete</a></td>");
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