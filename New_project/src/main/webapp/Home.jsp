<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.dao.TemplateDao" %>
<%@ page import="com.model.WebsiteTemplate" %>
<%@ page import="com.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    TemplateDao templateDao = new TemplateDao();
    List<WebsiteTemplate> templates = templateDao.getAllTemplates();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Home | Buy Your Website</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background: #050505;
    color: white;
    min-height: 100vh;
}

/* Background glow */

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
    right: -150px;
    bottom: 50px;
    z-index: -1;
}

/* Navbar */

.navbar {
    padding: 18px 7%;
    display: flex;
    justify-content: space-between;
    align-items: center;

    background: rgba(255,255,255,0.05);
    backdrop-filter: blur(15px);

    border-bottom: 1px solid rgba(0,255,255,0.2);

    position: sticky;
    top: 0;
    z-index: 10;
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
    text-decoration: none;
    color: white;
    margin-left: 25px;
    transition: 0.3s;
}

.nav-links a:hover {
    color: #00ffff;
    text-shadow: 0 0 10px #00ffff;
}

.logout {
    color: #ff4dff !important;
}


/* Welcome */

.welcome {
    text-align: center;
    padding: 60px 20px 30px;
}

.welcome h1 {
    font-size: 42px;

    color: #00ffff;

    text-shadow:
        0 0 10px #00ffff,
        0 0 25px #00ffff;
}

.welcome h1 span {
    color: #ff00ff;

    text-shadow:
        0 0 10px #ff00ff,
        0 0 25px #ff00ff;
}

.welcome p {
    margin-top: 15px;
    color: #aaa;
    font-size: 17px;
}


/* Template section */

.template-section {
    width: 90%;
    max-width: 1200px;
    margin: auto;
    padding: 30px 0 60px;
}

.section-title {
    text-align: center;
    margin-bottom: 35px;
}

.section-title h2 {
    font-size: 30px;
    color: white;
}

.section-title p {
    color: #999;
    margin-top: 8px;
}


/* Cards */

.template-container {
    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(280px, 1fr));

    gap: 25px;
}


/* Glass card */

.template-card {

    background: rgba(255,255,255,0.06);

    border: 1px solid rgba(0,255,255,0.25);

    border-radius: 20px;

    overflow: hidden;

    backdrop-filter: blur(15px);

    transition: 0.4s;

    box-shadow:
        0 0 15px rgba(0,255,255,0.08);
}

.template-card:hover {

    transform: translateY(-8px);

    border-color: #00ffff;

    box-shadow:
        0 0 20px rgba(0,255,255,0.3),
        0 0 35px rgba(255,0,255,0.15);
}


/* Image */

.template-image {

    width: 100%;
    height: 190px;

    object-fit: cover;

    background: #111;
}


/* Card content */

.template-content {
    padding: 22px;
}

.template-content h3 {

    font-size: 22px;

    color: #00ffff;

    margin-bottom: 10px;

    text-shadow:
        0 0 8px rgba(0,255,255,0.5);
}

.category {

    display: inline-block;

    padding: 5px 10px;

    border-radius: 20px;

    background: rgba(255,0,255,0.1);

    color: #ff66ff;

    font-size: 13px;

    margin-bottom: 12px;
}

.description {

    color: #aaa;

    line-height: 1.5;

    min-height: 45px;

    margin-bottom: 15px;
}

.price {

    font-size: 23px;

    font-weight: bold;

    color: #fff;

    margin-bottom: 18px;
}


/* Button */

.book-btn {

    display: block;

    text-align: center;

    text-decoration: none;

    padding: 12px;

    border-radius: 10px;

    background:
        linear-gradient(
            90deg,
            #00ffff,
            #ff00ff
        );

    color: black;

    font-weight: bold;

    transition: 0.3s;
}

.book-btn:hover {

    box-shadow:
        0 0 15px #00ffff,
        0 0 25px #ff00ff;

    transform: translateY(-2px);
}


/* No templates */

.no-template {

    text-align: center;

    padding: 50px;

    color: #888;

    border: 1px solid rgba(255,255,255,0.1);

    border-radius: 15px;
}


/* Footer */

.footer {

    text-align: center;

    padding: 25px;

    color: #777;

    border-top:
        1px solid rgba(255,255,255,0.1);
}


/* Mobile */

@media(max-width: 600px) {

    .navbar {
        padding: 18px 5%;
    }

    .nav-links a {
        margin-left: 10px;
        font-size: 13px;
    }

    .welcome h1 {
        font-size: 30px;
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

        <a href="LogoutServlet" class="logout">
            Logout
        </a>

    </div>

</nav>


<!-- Welcome -->

<section class="welcome">

    <h1>
        Welcome,
        <span><%= user.getFirstname() %></span>
    </h1>

    <p>
        Choose a professional website template for your business.
    </p>

</section>


<!-- Templates -->

<section class="template-section">


    <div class="section-title">

        <h2>
            Available Website Templates
        </h2>

        <p>
            Select a template and submit your requirements.
        </p>

    </div>


    <div class="template-container">


        <%
            if (templates != null && !templates.isEmpty()) {

                for (WebsiteTemplate template : templates) {
        %>


        <div class="template-card">


            <!-- Demo Image -->

            <%
                if (template.getDemoImage() != null
                    && !template.getDemoImage().isEmpty()) {
            %>

                <img
                    src="<%= template.getDemoImage() %>"
                    class="template-image"
                    alt="Website Template">

            <%
                } else {
            %>

                <div
                    class="template-image"
                    style="
                        display:flex;
                        align-items:center;
                        justify-content:center;
                        color:#555;
                    ">

                    No Preview

                </div>

            <%
                }
            %>


            <!-- Content -->

            <div class="template-content">


                <h3>
                    <%= template.getTemplateName() %>
                </h3>


                <span class="category">
                    <%= template.getCategory() %>
                </span>


                <p class="description">
                    <%= template.getDescription() %>
                </p>


                <div class="price">

                    ₹ <%= template.getPrice() %>

                </div>


                <a
                    href="booking.jsp?id=<%= template.getTemplateId() %>"
                    class="book-btn">

                    BOOK THIS WEBSITE

                </a>


            </div>

        </div>


        <%
                }

            } else {
        %>


        <div class="no-template">

            <h3>
                No website templates available.
            </h3>

            <p>
                Please check again later.
            </p>

        </div>


        <%
            }
        %>


    </div>

</section>


<!-- Footer -->

<footer class="footer">

    © 2026 BuyYourWebsite | All Rights Reserved

</footer>


</body>

</html>