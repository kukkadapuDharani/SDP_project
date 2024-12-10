<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Extracurricular Portal</title>
    <link rel="stylesheet" href="css/home.css" />
</head>
<body>
    <div class="container">
        <aside class="sidebar">
            <div class="logo">
                <h1>Portal</h1>
            </div>
            <ul class="menu">
                <li><a href="/home.jsp">Dashboard</a></li>
                <li><a href="/club.jsp">Clubs</a></li>
                <li><a href="/registration.jsp">Registration</a></li>
                <li><a href="/awards.jsp">Awards</a></li>
                <li><a href="/notice.jsp">Notice</a></li>
                <li><a href="/schedule.jsp">Schedule</a></li>
            </ul>
            <div class="logout">
                <a href="/index.jsp">Logout</a>
            </div>
        </aside>
        
        <main class="main-content">
            <section class="welcome">
                <h1>Welcome to the Student Portal</h1>
                <p>Stay updated with your extracurricular activities and achievements.</p>
            </section>

            <!-- Logos for extracurricular activities -->
            <br>
            <br>
            <section class="extracurricular-logos">
                <div class="logo-item">
                    <img src="images/sports-logo.jpg" alt="Sports">
                </div>
                <div class="logo-item">
                    <img src="images/cultural-logo.jpg" alt="Cultural">
                </div>
                <div class="logo-item">
                    <img src="images/awards-logo.jpg" alt="Awards">
                </div>
            </section>
            <br>
            <br>
            <br>		                                 
            <div class="footer">
                <p>&copy; 2024 Student Extracurricular Portal. All Rights Reserved.</p>
            </div>
        </main>
    </div>
</body>
</html>