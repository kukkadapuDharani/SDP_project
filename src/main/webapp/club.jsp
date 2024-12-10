<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clubs Directory</title>
    <link rel="stylesheet" href="css/club.css" />
    <script>
        function toggleDetails(clubId) {
            var details = document.getElementById(clubId);
            if (details.style.display === "none") {
                details.style.display = "block";
            } else {
                details.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div class="clubs-container">
        <h2>Clubs Directory</h2>
        <div class="clubs-grid">
            
            <!-- Club 1 -->
            <div class="club-card">
                <img src="images/artclub.jpeg" alt="ART Club" class="club-image" />
                <h3>ART Club</h3>
                <button onclick="toggleDetails('artDetails')">Show Details</button>
                <div id="artDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> John, Sarah, Mike</p>
                    <p><strong>Mentors:</strong> Dr. Smith, Prof. Adams</p>
                    <p><strong>Room No:</strong> 101</p>
                </div>
                <a href="registerclub.jsp?clubName=ART%20Club"><button>Register</button></a>
            </div>

            <!-- Club 2 -->
            <div class="club-card">
                <img src="images/culturalclub.png" alt="Cultural Club" class="club-image" />
                <h3>Cultural Club</h3>
                <button onclick="toggleDetails('culturalDetails')">Show Details</button>
                <div id="culturalDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> Emily, Jacob, Lily</p>
                    <p><strong>Mentors:</strong> Prof. James</p>
                    <p><strong>Room No:</strong> 202</p>
                </div>
                <a href="registerclub.jsp?clubName=Cultural%20Club"><button>Register</button></a>
            </div>

            <!-- Club 3 -->
            <div class="club-card">
                <img src="images/designclub.jpeg" alt="Design Club" class="club-image" />
                <h3>Design Club</h3>
                <button onclick="toggleDetails('designDetails')">Show Details</button>
                <div id="designDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> Alex, Tanya, Ravi</p>
                    <p><strong>Mentors:</strong> Dr. Sharma, Prof. Lee</p>
                    <p><strong>Room No:</strong> 303</p>
                </div>
                <a href="registerclub.jsp?clubName=Design%20Club"><button>Register</button></a>
            </div>

            <!-- Club 4 -->
            <div class="club-card">
                <img src="images/photo.png" alt="Photography Club" class="club-image" />
                <h3>Photography Club</h3>
                <button onclick="toggleDetails('photographyDetails')">Show Details</button>
                <div id="photographyDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> John, Sarah, Mike</p>
                    <p><strong>Mentors:</strong> Dr. Smith, Prof. Adams</p>
                    <p><strong>Room No:</strong> 101</p>
                </div>
                <a href="registerclub.jsp?clubName=Photography%20Club"><button>Register</button></a>
            </div>

            <!-- Club 5 -->
            <div class="club-card">
                <img src="images/musicclub.jpeg" alt="Music Club" class="club-image" />
                <h3>Music Club</h3>
                <button onclick="toggleDetails('musicDetails')">Show Details</button>
                <div id="musicDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> Alice, Robert, Mark</p>
                    <p><strong>Mentors:</strong> Prof. Jane</p>
                    <p><strong>Room No:</strong> 305</p>
                </div>
                <a href="registerclub.jsp?clubName=Music%20Club"><button>Register</button></a>
            </div>

            <!-- Club 6 -->
            <div class="club-card">
                <img src="images/adventureclub.jpeg" alt="Adventure Club" class="club-image" />
                <h3>Adventure Club</h3>
                <button onclick="toggleDetails('adventureDetails')">Show Details</button>
                <div id="adventureDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> Michael, Lisa, John</p>
                    <p><strong>Mentors:</strong> Coach Tom</p>
                    <p><strong>Room No:</strong> 404</p>
                </div>
                <a href="registerclub.jsp?clubName=Adventure%20Club"><button>Register</button></a>
            </div>

            <!-- Club 7 -->
            <div class="club-card">
                <img src="images/aiclub.jpeg" alt="AI Club" class="club-image" />
                <h3>AI Club</h3>
                <button onclick="toggleDetails('aiDetails')">Show Details</button>
                <div id="aiDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> Chris, Emma, Jake</p>
                    <p><strong>Mentors:</strong> Prof. Ethan</p>
                    <p><strong>Room No:</strong> 402</p>
                </div>
                <a href="registerclub.jsp?clubName=AI%20Club"><button>Register</button></a>
            </div>

            <!-- Club 8 -->
            <div class="club-card">
                <img src="images/dramaclub.jpeg" alt="Drama Club" class="club-image" />
                <h3>Drama Club</h3>
                <button onclick="toggleDetails('dramaDetails')">Show Details</button>
                <div id="dramaDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> Olivia, Lucas, Emma</p>
                    <p><strong>Mentors:</strong> Mrs. Green</p>
                    <p><strong>Room No:</strong> 505</p>
                </div>
                <a href="registerclub.jsp?clubName=Drama%20Club"><button>Register</button></a>
            </div>

            <!-- Club 9 -->
            <div class="club-card">
                <img src="images/gardenclub.jpeg" alt="Gardening Club" class="club-image" />
                <h3>Gardening Club</h3>
                <button onclick="toggleDetails('gardeningDetails')">Show Details</button>
                <div id="gardeningDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> Sophia, Noah, Isabella</p>
                    <p><strong>Mentors:</strong> Mr. Smith</p>
                    <p><strong>Room No:</strong> 606</p>
                </div>
                <a href="registerclub.jsp?clubName=Gardening%20Club"><button>Register</button></a>
            </div>

            <!-- Club 10 -->
            <div class="club-card">
                <img src="images/roboticsclub.jpeg" alt="Robotics Club" class="club-image" />
                <h3>Robotics Club</h3>
                <button onclick="toggleDetails('roboticsDetails')">Show Details</button>
                <div id="roboticsDetails" class="club-details" style="display: none;">
                    <p><strong>Core Members:</strong> Ethan, Mia, Ava</p>
                    <p><strong>Mentors:</strong> Mr. Davies</p>
                    <p><strong>Room No:</strong> 707</p>
                </div>
                <a href="registerclub.jsp?clubName=Robotics%20Club"><button>Register</button></a>
            </div>

        </div>
    </div>
</body>
</html>
