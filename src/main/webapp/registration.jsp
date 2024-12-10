<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Club Registration</title>
    <link rel="stylesheet" href="css/registration.css" />
</head>
<body>
    <div class="registration-container">
        <div class="sidebar">
            <a href="home.jsp" class="back-btn">← Back To Dashboard</a>
        </div>
        <div class="content">
            <h2>Only activites of Notice have to Register Here</h2>
            <form method="POST" action="">
                <table class="registration-table">
                    <tr>
                        <td><label for="fullName">Full Name:</label></td>
                        <td><input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required></td>
                    </tr>
                    <tr>
                        <td><label for="rollNo">University Roll Number:</label></td>
                        <td><input type="text" id="rollNo" name="rollNo" placeholder="Enter your roll number" required></td>
                    </tr>
                    <tr>
                        <td><label for="department">Department:</label></td>
                        <td>
                            <select id="department" name="department" required>
                                <option value="CSE">Computer Science</option>
                                <option value="ECE">Electronics</option>
                                <option value="EEE">Electrical</option>
                                <option value="MECH">Mechanical</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="year">Year of Study:</label></td>
                        <td>
                            <select id="year" name="year" required>
                                <option value="1">1st Year</option>
                                <option value="2">2nd Year</option>
                                <option value="3">3rd Year</option>
                                <option value="4">4th Year</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="email">Email Address:</label></td>
                        <td><input type="email" id="email" name="email" placeholder="Enter your email address" required></td>
                    </tr>
                    <tr>
                        <td><label for="mobile">Contact Number:</label></td>
                        <td><input type="tel" id="mobile" name="mobile" placeholder="Enter your mobile number" required></td>
                    </tr>
                    <tr>
                        <td><label for="dob">Date of Birth:</label></td>
                        <td><input type="date" id="dob" name="dob" required></td>
                    </tr>
                    <tr>
                        <td><label for="event">Event Name:</label></td>
                        <td><input type="text" id="event" name="event" placeholder="Enter event name" required></td>
                    </tr>
                    <tr>
                        <td><label for="category">Event Category:</label></td>
                        <td>
                            <select id="category" name="category" required>
                                <option value="nss">Nss</option>
                                <option value="outreach">Outreach</option>
                                <option value="adventure">Adventure</option>
                                
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="club">Program:</label></td>
                        <td>
                            <select id="club" name="club" required>
                                <option value="healthawarenessprogram">Health Awareness Program</option>
                                <option value="cleanlinesscampaign">Cleanliness Campaign</option>
                                <option value="fooddistributiondrive">Food Distribution Drive</option>
                                <option value="blooddonationcamp">Blood Donation Camp</option>
                                <option value="treeplantationdrive">Tree Plantation Drive</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="team">Team/Individual:</label></td>
                        <td>
                            <select id="team" name="team" required>
                                <option value="team">Team</option>
                                <option value="individual">Individual</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="teamName">Team Name (if applicable):</label></td>
                        <td><input type="text" id="teamName" name="teamName" placeholder="Enter your team name"></td>
                    </tr>
                    <tr>
                        <td><label for="teamMembers">Number of Team Members:</label></td>
                        <td><input type="number" id="teamMembers" name="teamMembers" placeholder="Enter number of team members"></td>
                    </tr>
                    <tr>
                        <td><label for="eventDate">Event Date:</label></td>
                        <td><input type="date" id="eventDate" name="eventDate" required></td>
                    </tr>
                    <tr>
                        <td><label for="timeSlot">Preferred Time Slot:</label></td>
                        <td>
                            <select id="timeSlot" name="timeSlot" required>
                                <option value="morning">Morning</option>
                                <option value="afternoon">Afternoon</option>
                                <option value="evening">Evening</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="participationType">Participation Type:</label></td>
                        <td>
                            <select id="participationType" name="participationType" required>
                                <option value="volunteer">Volunteer</option>
                                <option value="participant">Participant</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <div class="form-actions">
                    <button type="submit" class="submit-btn">Submit Registration</button>
                </div>
            </form>

            <%
                if(request.getMethod().equalsIgnoreCase("POST")) {
                    // Capture form data
                    String fullName = request.getParameter("fullName");
                    String rollNo = request.getParameter("rollNo");
                    String department = request.getParameter("department");
                    String year = request.getParameter("year");
                    String email = request.getParameter("email");
                    String mobile = request.getParameter("mobile");
                    String dob = request.getParameter("dob");
                    String event = request.getParameter("event");
                    String category = request.getParameter("category");
                    String club = request.getParameter("club");
                    String team = request.getParameter("team");
                    String teamName = request.getParameter("teamName");
                    int teamMembers = Integer.parseInt(request.getParameter("teamMembers"));
                    String eventDate = request.getParameter("eventDate");
                    String timeSlot = request.getParameter("timeSlot");
                    String participationType = request.getParameter("participationType");

                    Connection conn = null;
                    PreparedStatement stmt = null;
                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp", "root", "Dharani@23");

                        // SQL query to insert data into registrationform table
                        String sql = "INSERT INTO registrationform (fullName, rollNo, department, year, email, mobile, dob, event, category, club, team, teamName, teamMembers, eventDate, timeSlot, participationType) "
                                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, fullName);
                        stmt.setString(2, rollNo);
                        stmt.setString(3, department);
                        stmt.setString(4, year);
                        stmt.setString(5, email);
                        stmt.setString(6, mobile);
                        stmt.setString(7, dob);
                        stmt.setString(8, event);
                        stmt.setString(9, category);
                        stmt.setString(10, club);
                        stmt.setString(11, team);
                        stmt.setString(12, teamName);
                        stmt.setInt(13, teamMembers);
                        stmt.setString(14, eventDate);
                        stmt.setString(15, timeSlot);
                        stmt.setString(16, participationType);

                        // Execute the insert statement
                        int rowsAffected = stmt.executeUpdate();

                        if (rowsAffected > 0) {
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
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
