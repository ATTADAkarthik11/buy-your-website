<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.dao.TemplateDao" %>
<%@ page import="com.model.WebsiteTemplate" %>
<%@ page import="com.model.User" %>

<%
    // Check whether user is logged in

    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }


    // Get template ID from URL

    String id = request.getParameter("id");

    WebsiteTemplate template = null;


    if (id != null) {

        try {

            int templateId = Integer.parseInt(id);

            TemplateDao dao = new TemplateDao();

            template = dao.getTemplateById(templateId);

        } catch (Exception e) {

            e.printStackTrace();

        }
    }


    // If template does not exist,
    // go back to Home page

    if (template == null) {

        response.sendRedirect("Home.jsp");

        return;
    }

%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Book Website | Buy Your Website</title>


<style>

/* ============================= */
/* BASIC */
/* ============================= */

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

}


/* ============================= */
/* NEON BACKGROUND */
/* ============================= */

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


/* ============================= */
/* NAVBAR */
/* ============================= */

.navbar {

    width: 100%;

    padding: 18px 7%;

    display: flex;

    justify-content: space-between;

    align-items: center;

    background: rgba(255,255,255,0.05);

    backdrop-filter: blur(15px);

    border-bottom: 1px solid rgba(0,255,255,0.2);

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

    text-shadow:
        0 0 10px #00ffff;

}


/* ============================= */
/* MAIN CONTAINER */
/* ============================= */

.container {

    width: 90%;

    max-width: 1100px;

    margin: 50px auto;

}


/* ============================= */
/* TITLE */
/* ============================= */

.title {

    text-align: center;

    margin-bottom: 40px;

}


.title h1 {

    font-size: 38px;

    color: #00ffff;

    text-shadow:
        0 0 10px #00ffff,
        0 0 25px #00ffff;

}


.title p {

    margin-top: 10px;

    color: #999;

}


/* ============================= */
/* BOOKING LAYOUT */
/* ============================= */

.booking-container {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 30px;

}


/* ============================= */
/* GLASS CARD */
/* ============================= */

.card {

    background: rgba(255,255,255,0.06);

    border: 1px solid rgba(0,255,255,0.25);

    border-radius: 20px;

    padding: 30px;

    backdrop-filter: blur(15px);

    box-shadow:
        0 0 20px rgba(0,255,255,0.08);

}


/* ============================= */
/* TEMPLATE IMAGE */
/* ============================= */

.template-image {

    width: 100%;

    height: 230px;

    object-fit: cover;

    border-radius: 15px;

    margin-bottom: 20px;

}


/* ============================= */
/* TEMPLATE NAME */
/* ============================= */

.template-name {

    font-size: 28px;

    color: #00ffff;

    margin-bottom: 10px;

    text-shadow:
        0 0 10px #00ffff;

}


/* ============================= */
/* CATEGORY */
/* ============================= */

.category {

    display: inline-block;

    padding: 6px 12px;

    border-radius: 20px;

    background: rgba(255,0,255,0.12);

    color: #ff66ff;

    font-size: 13px;

    margin-bottom: 15px;

}


/* ============================= */
/* DESCRIPTION */
/* ============================= */

.description {

    color: #aaa;

    line-height: 1.6;

    margin-bottom: 20px;

}


/* ============================= */
/* PRICE */
/* ============================= */

.price {

    font-size: 28px;

    font-weight: bold;

    color: white;

}


/* ============================= */
/* FORM TITLE */
/* ============================= */

.form-title {

    color: #ff00ff;

    font-size: 25px;

    margin-bottom: 25px;

    text-shadow:
        0 0 10px #ff00ff;

}


/* ============================= */
/* FORM GROUP */
/* ============================= */

.form-group {

    margin-bottom: 20px;

}


.form-group label {

    display: block;

    margin-bottom: 8px;

    color: #ddd;

}


/* ============================= */
/* TEXTAREA */
/* ============================= */

.form-group textarea {

    width: 100%;

    min-height: 180px;

    resize: vertical;

    padding: 14px;

    border-radius: 12px;

    border: 1px solid rgba(0,255,255,0.3);

    background: rgba(0,0,0,0.5);

    color: white;

    outline: none;

    font-size: 15px;

}


.form-group textarea:focus {

    border-color: #00ffff;

    box-shadow:
        0 0 12px rgba(0,255,255,0.4);

}


/* ============================= */
/* BOOK BUTTON */
/* ============================= */

.book-btn {

    width: 100%;

    padding: 14px;

    border: none;

    border-radius: 10px;

    background:
        linear-gradient(
            90deg,
            #00ffff,
            #ff00ff
        );

    color: black;

    font-size: 16px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;

}


.book-btn:hover {

    transform: translateY(-2px);

    box-shadow:
        0 0 15px #00ffff,
        0 0 25px #ff00ff;

}


/* ============================= */
/* USER INFO */
/* ============================= */

.user-info {

    margin-bottom: 25px;

    padding: 15px;

    border-radius: 12px;

    background: rgba(0,255,255,0.05);

    border: 1px solid rgba(0,255,255,0.15);

}


.user-info p {

    margin: 6px 0;

    color: #aaa;

}


.user-info strong {

    color: #00ffff;

}


/* ============================= */
/* RESPONSIVE */
/* ============================= */

@media(max-width: 800px) {

    .booking-container {

        grid-template-columns: 1fr;

    }


    .title h1 {

        font-size: 30px;

    }

}


@media(max-width: 500px) {

    .navbar {

        padding: 18px 5%;

    }


    .logo {

        font-size: 20px;

    }


    .nav-links a {

        margin-left: 10px;

        font-size: 13px;

    }


    .card {

        padding: 20px;

    }

}

</style>

</head>


<body>


<!-- ============================= -->
<!-- NAVBAR -->
<!-- ============================= -->

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



<!-- ============================= -->
<!-- MAIN -->
<!-- ============================= -->

<div class="container">


    <!-- TITLE -->

    <div class="title">

        <h1>

            Book Your Website

        </h1>


        <p>

            Tell us what you need and we will build it for you.

        </p>

    </div>



    <!-- BOOKING CONTAINER -->

    <div class="booking-container">


        <!-- ============================= -->
        <!-- TEMPLATE DETAILS -->
        <!-- ============================= -->

        <div class="card">


            <%

                if (template.getDemoImage() != null
                        && !template.getDemoImage().isEmpty()) {

            %>


                <img

                    src="<%= template.getDemoImage() %>"

                    class="template-image"

                    alt="Website Preview">


            <%

                } else {

            %>


                <div

                    class="template-image"

                    style="
                        display:flex;
                        justify-content:center;
                        align-items:center;
                        background:#111;
                        color:#555;
                    ">


                    No Preview Available


                </div>


            <%

                }

            %>



            <h2 class="template-name">

                <%= template.getTemplateName() %>

            </h2>



            <span class="category">

                <%= template.getCategory() %>

            </span>



            <p class="description">

                <%= template.getDescription() %>

            </p>



            <div class="price">

                ₹ <%= template.getPrice() %>

            </div>


        </div>



        <!-- ============================= -->
        <!-- BOOKING FORM -->
        <!-- ============================= -->

        <div class="card">


            <h2 class="form-title">

                Your Requirements

            </h2>



            <!-- USER INFORMATION -->

            <div class="user-info">


                <p>

                    <strong>Name:</strong>

                    <%= user.getFirstname() %>

                    <%= user.getLastname() %>

                </p>



                <p>

                    <strong>Email:</strong>

                    <%= user.getEmail() %>

                </p>



                <p>

                    <strong>Mobile:</strong>

                    <%= user.getMobile() %>

                </p>


            </div>



            <!-- BOOKING FORM -->

            <form

                action="BookWebsiteController"

                method="post">


                <!-- Template ID -->

                <input

                    type="hidden"

                    name="templateId"

                    value="<%= template.getTemplateId() %>">



                <!-- Requirements -->

                <div class="form-group">


                    <label>

                        Tell us about your website

                    </label>



                    <textarea

                        name="requirements"

                        placeholder="Example:

I need a modern portfolio website.
I need Home, About, Skills and Contact pages.
I want a dark theme.
I need a WhatsApp contact button.
I want my LinkedIn and GitHub links."

                        required></textarea>


                </div>



                <!-- Submit Button -->

                <button

                    type="submit"

                    class="book-btn">

                    SUBMIT WEBSITE REQUEST

                </button>


            </form>


        </div>


    </div>


</div>


</body>

</html>