<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Club</title>
    <link rel="stylesheet" href="css/adminaddclub.css" />
</head>
<body>
    <div class="add-club-container">
        <h2>Add a New Club</h2>
        <form action="adminaddclub.jsp" method="post" enctype="multipart/form-data">
            <label for="clubName">Club Name:</label>
            <input type="text" id="clubName" name="clubName" required />

            <label for="coreMembers">Core Members (comma-separated):</label>
            <input type="text" id="coreMembers" name="coreMembers" required />

            <label for="mentors">Mentors (comma-separated):</label>
            <input type="text" id="mentors" name="mentors" required />

            <label for="roomNo">Room Number:</label>
            <input type="text" id="roomNo" name="roomNo" required />

            <label for="clubImage">Club Image:</label>
            <input type="file" id="clubImage" name="clubImage" required />

            <button type="submit" name="action" value="addClub">Add Club</button>
        </form>
        <a href="adminhome.jsp" class="back-btn">← Back to Dashboard</a>

        <%
            if ("addClub".equals(request.getParameter("action"))) {
                String clubName = request.getParameter("clubName");
                String coreMembers = request.getParameter("coreMembers");
                String mentors = request.getParameter("mentors");
                String roomNo = request.getParameter("roomNo");
                Part clubImage = request.getPart("clubImage");

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    // Save the uploaded file
                    String filePath = application.getRealPath("images/") + clubImage.getSubmittedFileName();
                    clubImage.write(filePath);

                    // Save club details in the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                    String sql = "INSERT INTO clubs (club_name, core_members, mentors, room_no, image_path) VALUES (?, ?, ?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, clubName);
                    pstmt.setString(2, coreMembers);
                    pstmt.setString(3, mentors);
                    pstmt.setString(4, roomNo);
                    pstmt.setString(5, "images/" + clubImage.getSubmittedFileName());
                    int rowsInserted = pstmt.executeUpdate();

                    if (rowsInserted > 0) {
                        out.println("<p>Club added successfully!</p>");
                    } else {
                        out.println("<p>Error: Unable to add club.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
</body>
</html>
