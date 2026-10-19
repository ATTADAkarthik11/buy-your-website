<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.dao.TemplateDao" %>
<%@ page import="com.model.WebsiteTemplate" %>

<%
    Object admin = session.getAttribute("admin");

    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

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

    if (template == null) {

        response.sendRedirect("AdminHome.jsp");

        return;
    }
%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Update Template | Buy Your Website</title>


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

}


/* ========================= */
/* BACKGROUND */
/* ========================= */

body::before {

    content: "";

    position: fixed;

    width: 400px;
    height: 400px;

    background: #00ffff;

    filter: blur(160px);

    opacity: 0.12;

    top: 50px;
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


/* ========================= */
/* NAVBAR */
/* ========================= */

.navbar {

    width: 100%;

    padding: 20px 7%;

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


.navbar a {

    color: white;

    text-decoration: none;

    margin-left: 20px;

}


.navbar a:hover {

    color: #00ffff;

    text-shadow:
        0 0 10px #00ffff;
}


/* ========================= */
/* CONTAINER */
/* ========================= */

.container {

    width: 90%;

    max-width: 700px;

    margin: 50px auto;
}


/* ========================= */
/* CARD */
/* ========================= */

.form-card {

    padding: 40px;

    border-radius: 20px;

    background:
        rgba(255,255,255,0.06);

    backdrop-filter: blur(20px);

    border:
        1px solid rgba(255,0,255,0.25);

    box-shadow:
        0 0 30px rgba(255,0,255,0.08);
}


/* ========================= */
/* TITLE */
/* ========================= */

.form-card h1 {

    text-align: center;

    color: #ff00ff;

    margin-bottom: 10px;

    text-shadow:
        0 0 10px #ff00ff,
        0 0 20px #ff00ff;
}


.subtitle {

    text-align: center;

    color: #888;

    margin-bottom: 30px;
}


/* ========================= */
/* FORM */
/* ========================= */

.form-group {

    margin-bottom: 20px;
}


.form-group label {

    display: block;

    margin-bottom: 8px;

    color: #ddd;
}


.form-group input,
.form-group textarea,
.form-group select {

    width: 100%;

    padding: 13px;

    border-radius: 10px;

    border:
        1px solid rgba(0,255,255,0.25);

    background:
        rgba(0,0,0,0.5);

    color: white;

    outline: none;

    font-size: 15px;

    transition: 0.3s;
}


.form-group textarea {

    min-height: 120px;

    resize: vertical;
}


.form-group select {

    cursor: pointer;
}


.form-group select option {

    background: #111;

    color: white;
}


.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus {

    border-color: #ff00ff;

    box-shadow:
        0 0 12px rgba(255,0,255,0.4);
}


/* ========================= */
/* TEMPLATE ID */
/* ========================= */

.template-id {

    padding: 10px 13px;

    border-radius: 8px;

    background:
        rgba(0,255,255,0.05);

    border:
        1px solid rgba(0,255,255,0.15);

    color: #00ffff;

    margin-bottom: 20px;

    font-size: 14px;
}


/* ========================= */
/* BUTTONS */
/* ========================= */

.buttons {

    display: flex;

    gap: 15px;

    margin-top: 25px;
}


.update-btn {

    flex: 1;

    padding: 14px;

    border: none;

    border-radius: 10px;

    background:
        linear-gradient(
            90deg,
            #ff00ff,
            #00ffff
        );

    color: black;

    font-weight: bold;

    font-size: 15px;

    cursor: pointer;

    transition: 0.3s;
}


.update-btn:hover {

    transform: translateY(-2px);

    box-shadow:
        0 0 15px #ff00ff,
        0 0 25px #00ffff;
}


.cancel-btn {

    flex: 1;

    padding: 14px;

    border-radius: 10px;

    border:
        1px solid #777;

    color: #ccc;

    text-decoration: none;

    text-align: center;

    transition: 0.3s;
}


.cancel-btn:hover {

    border-color: #00ffff;

    color: #00ffff;

    box-shadow:
        0 0 10px rgba(0,255,255,0.3);
}


/* ========================= */
/* RESPONSIVE */
/* ========================= */

@media(max-width: 600px) {

    .container {

        width: 94%;

        margin: 30px auto;
    }


    .form-card {

        padding: 25px 20px;
    }


    .buttons {

        flex-direction: column;
    }

}

</style>

</head>


<body>


<!-- ========================= -->
<!-- NAVBAR -->
<!-- ========================= -->

<nav class="navbar">

    <div class="logo">

        BuyYourWebsite

    </div>


    <div>

        <a href="AdminHome.jsp">

            Dashboard

        </a>


        <a href="LogoutServlet">

            Logout

        </a>

    </div>

</nav>



<!-- ========================= -->
<!-- UPDATE FORM -->
<!-- ========================= -->

<div class="container">


    <div class="form-card">


        <h1>

            Update Website Template

        </h1>


        <p class="subtitle">

            Modify the selected website template

        </p>



        <!-- Template ID -->

        <div class="template-id">

            Template ID:

            <strong>
                <%= template.getTemplateId() %>
            </strong>

        </div>



        <form
            action="UpdateTemplateController"
            method="post">


            <!-- Hidden ID -->

            <input
                type="hidden"
                name="templateId"
                value="<%= template.getTemplateId() %>">



            <!-- Template Name -->

            <div class="form-group">

                <label>
                    Template Name
                </label>

                <input
                    type="text"
                    name="templateName"
                    value="<%= template.getTemplateName() %>"
                    required>

            </div>



            <!-- Description -->

            <div class="form-group">

                <label>
                    Description
                </label>

                <textarea
                    name="description"
                    required><%= template.getDescription() %></textarea>

            </div>



            <!-- Category -->

            <div class="form-group">

                <label>
                    Category
                </label>

                <select
                    name="category"
                    required>

                    <option value="Portfolio"
                        <%= "Portfolio".equals(template.getCategory()) ? "selected" : "" %>>

                        Portfolio

                    </option>


                    <option value="Restaurant"
                        <%= "Restaurant".equals(template.getCategory()) ? "selected" : "" %>>

                        Restaurant

                    </option>


                    <option value="Business"
                        <%= "Business".equals(template.getCategory()) ? "selected" : "" %>>

                        Business

                    </option>


                    <option value="Startup"
                        <%= "Startup".equals(template.getCategory()) ? "selected" : "" %>>

                        Startup / Tech

                    </option>


                    <option value="E-Commerce"
                        <%= "E-Commerce".equals(template.getCategory()) ? "selected" : "" %>>

                        E-Commerce

                    </option>


                    <option value="Other"
                        <%= "Other".equals(template.getCategory()) ? "selected" : "" %>>

                        Other

                    </option>

                </select>

            </div>



            <!-- Price -->

            <div class="form-group">

                <label>
                    Price
                </label>

                <input
                    type="number"
                    name="price"
                    value="<%= template.getPrice() %>"
                    min="0"
                    step="0.01"
                    required>

            </div>



            <!-- Demo Image -->

            <div class="form-group">

                <label>
                    Demo Image URL
                </label>

                <input
                    type="text"
                    name="demoImage"
                    value="<%= template.getDemoImage() == null ? "" : template.getDemoImage() %>">

            </div>



            <!-- Status -->

            <div class="form-group">

                <label>
                    Status
                </label>

                <select
                    name="status"
                    required>


                    <option value="ACTIVE"
                        <%= "ACTIVE".equals(template.getStatus()) ? "selected" : "" %>>

                        ACTIVE

                    </option>


                    <option value="INACTIVE"
                        <%= "INACTIVE".equals(template.getStatus()) ? "selected" : "" %>>

                        INACTIVE

                    </option>


                </select>

            </div>



            <!-- BUTTONS -->

            <div class="buttons">


                <button
                    type="submit"
                    class="update-btn">

                    UPDATE TEMPLATE

                </button>


                <a
                    href="AdminHome.jsp"
                    class="cancel-btn">

                    CANCEL

                </a>


            </div>


        </form>


    </div>

</div>


</body>

</html>