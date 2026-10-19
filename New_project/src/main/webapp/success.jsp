<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Request Submitted | Buy Your Website</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {

    min-height: 100vh;

    background: #050505;

    color: white;

    display: flex;

    flex-direction: column;

}


/* Neon background */

body::before {

    content: "";

    position: fixed;

    width: 400px;
    height: 400px;

    background: #00ffff;

    filter: blur(160px);

    opacity: 0.12;

    top: 100px;
    left: -150px;

    z-index: -1;

}


body::after {

    content: "";

    position: fixed;

    width: 400px;
    height: 400px;

    background: #ff00ff;

    filter: blur(160px);

    opacity: 0.12;

    bottom: 50px;
    right: -150px;

    z-index: -1;

}


/* Navbar */

.navbar {

    width: 100%;

    padding: 18px 7%;

    display: flex;

    justify-content: space-between;

    align-items: center;

    background: rgba(255,255,255,0.05);

    backdrop-filter: blur(15px);

    border-bottom:
        1px solid rgba(0,255,255,0.2);

}


.logo {

    font-size: 24px;

    font-weight: bold;

    color: #00ffff;

    text-shadow:
        0 0 10px #00ffff,
        0 0 20px #00ffff;

}


.nav-links a {

    color: white;

    text-decoration: none;

    margin-left: 25px;

    transition: 0.3s;

}


.nav-links a:hover {

    color: #00ffff;

    text-shadow: 0 0 10px #00ffff;

}


/* Main */

.success-container {

    flex: 1;

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 30px;

}


/* Success Card */

.success-card {

    width: 500px;

    max-width: 100%;

    padding: 45px 35px;

    text-align: center;

    background:
        rgba(255,255,255,0.06);

    border:
        1px solid rgba(0,255,255,0.3);

    border-radius: 25px;

    backdrop-filter: blur(20px);

    box-shadow:
        0 0 25px rgba(0,255,255,0.15),
        0 0 40px rgba(255,0,255,0.08);

}


/* Success icon */

.success-icon {

    width: 90px;

    height: 90px;

    margin: 0 auto 25px;

    border-radius: 50%;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 45px;

    color: #00ffff;

    border:
        2px solid #00ffff;

    box-shadow:
        0 0 15px #00ffff,
        0 0 35px rgba(0,255,255,0.5);

}


/* Heading */

.success-card h1 {

    color: #00ffff;

    font-size: 32px;

    margin-bottom: 15px;

    text-shadow:
        0 0 10px #00ffff,
        0 0 20px #00ffff;

}


.success-card h2 {

    color: #ff00ff;

    font-size: 20px;

    margin-bottom: 15px;

    text-shadow:
        0 0 10px #ff00ff;

}


.success-card p {

    color: #aaa;

    line-height: 1.6;

    margin-bottom: 10px;

}


/* Message */

.message {

    margin: 25px 0;

    padding: 15px;

    border-radius: 12px;

    background:
        rgba(0,255,255,0.05);

    border:
        1px solid rgba(0,255,255,0.15);

    color: #ccc;

}


/* Buttons */

.buttons {

    display: flex;

    justify-content: center;

    gap: 15px;

    margin-top: 25px;

}


.btn {

    padding: 12px 22px;

    border-radius: 10px;

    text-decoration: none;

    font-weight: bold;

    transition: 0.3s;

}


.home-btn {

    background:
        linear-gradient(
            90deg,
            #00ffff,
            #00aaff
        );

    color: black;

}


.home-btn:hover {

    box-shadow:
        0 0 15px #00ffff;

    transform: translateY(-2px);

}


.logout-btn {

    border:
        1px solid #ff00ff;

    color: #ff66ff;

    background:
        rgba(255,0,255,0.05);

}


.logout-btn:hover {

    background:
        rgba(255,0,255,0.15);

    box-shadow:
        0 0 15px #ff00ff;

}


/* Footer */

.footer {

    text-align: center;

    padding: 20px;

    color: #666;

    border-top:
        1px solid rgba(255,255,255,0.1);

}


/* Mobile */

@media(max-width: 600px) {

    .success-card {

        padding: 35px 20px;

    }

    .success-card h1 {

        font-size: 27px;

    }

    .buttons {

        flex-direction: column;

    }

    .btn {

        width: 100%;

    }

}

</style>

</head>


<body>


<!-- Navbar -->

<nav class="navbar">

    <div class="logo">
        BuyYourWebsite
    </div>


    <div class="nav-links">

        <a href="Home.jsp">
            Home
        </a>

        <a href="Contact.jsp">
            Contact
        </a>

        <a href="LogoutServlet">
            Logout
        </a>

    </div>

</nav>



<!-- Success -->

<div class="success-container">

    <div class="success-card">


        <!-- Success Icon -->

        <div class="success-icon">

            ✓

        </div>


        <h1>
            Request Submitted!
        </h1>


        <h2>
            Thank You, <%= user.getFirstname() %>!
        </h2>


        <p>
            Your website request has been successfully submitted.
        </p>


        <div class="message">

            Our admin team will review your requirements
            and contact you regarding the next steps.

        </div>


        <p>
            You can return to the home page and explore
            more website templates.
        </p>


        <div class="buttons">

            <a
                href="Home.jsp"
                class="btn home-btn">

                Back to Home

            </a>


            <a
                href="LogoutServlet"
                class="btn logout-btn">

                Logout

            </a>

        </div>


    </div>

</div>



<!-- Footer -->

<footer class="footer">

    © 2026 BuyYourWebsite | All Rights Reserved

</footer>


</body>

</html>