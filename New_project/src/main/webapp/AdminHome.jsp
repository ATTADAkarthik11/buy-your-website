<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.dao.TemplateDao" %>
<%@ page import="com.dao.RequestDao" %>
<%@ page import="com.model.WebsiteTemplate" %>
<%@ page import="com.model.WebsiteRequest" %>

<%
    Object admin = session.getAttribute("admin");

    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    TemplateDao templateDao = new TemplateDao();
    RequestDao requestDao = new RequestDao();

    List<WebsiteTemplate> templates = templateDao.getAllTemplates();
    List<WebsiteRequest> requests = requestDao.getAllRequests();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard | Buy Your Website</title>

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
/* BACKGROUND GLOW */
/* ========================= */

body::before {
    content: "";
    position: fixed;

    width: 450px;
    height: 450px;

    background: #00ffff;

    filter: blur(170px);

    opacity: 0.12;

    top: 50px;
    left: -200px;

    z-index: -1;
}

body::after {
    content: "";
    position: fixed;

    width: 450px;
    height: 450px;

    background: #ff00ff;

    filter: blur(170px);

    opacity: 0.12;

    right: -200px;
    bottom: 50px;

    z-index: -1;
}

/* ========================= */
/* NAVBAR */
/* ========================= */

.navbar {
    width: 100%;

    padding: 20px 6%;

    display: flex;
    justify-content: space-between;
    align-items: center;

    background: rgba(255,255,255,0.05);

    backdrop-filter: blur(20px);

    border-bottom:
        1px solid rgba(0,255,255,0.2);

    position: sticky;
    top: 0;

    z-index: 100;
}

.logo {
    font-size: 24px;

    font-weight: bold;

    color: #00ffff;

    text-shadow:
        0 0 10px #00ffff,
        0 0 20px #00ffff;
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 25px;
}

.admin-name {
    color: #ddd;
}

.logout-btn {
    padding: 10px 18px;

    border-radius: 8px;

    text-decoration: none;

    color: white;

    border: 1px solid #ff00ff;

    transition: 0.3s;
}

.logout-btn:hover {
    background: #ff00ff;

    color: black;

    box-shadow:
        0 0 15px #ff00ff;
}

/* ========================= */
/* MAIN */
/* ========================= */

.container {
    width: 90%;

    max-width: 1250px;

    margin: 40px auto;
}

/* ========================= */
/* HEADER */
/* ========================= */

.dashboard-header {
    margin-bottom: 35px;
}

.dashboard-header h1 {
    font-size: 36px;

    color: #00ffff;

    text-shadow:
        0 0 10px #00ffff,
        0 0 20px #00ffff;
}

.dashboard-header p {
    color: #999;

    margin-top: 8px;
}

/* ========================= */
/* STATS */
/* ========================= */

.stats {
    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 20px;

    margin-bottom: 40px;
}

.stat-card {
    padding: 25px;

    border-radius: 18px;

    background:
        rgba(255,255,255,0.06);

    border:
        1px solid rgba(255,255,255,0.1);

    backdrop-filter: blur(15px);

    transition: 0.3s;
}

.stat-card:hover {
    transform: translateY(-5px);

    border-color: #00ffff;

    box-shadow:
        0 0 20px rgba(0,255,255,0.2);
}

.stat-card h3 {
    color: #999;

    font-size: 15px;

    margin-bottom: 12px;
}

.stat-number {
    font-size: 32px;

    font-weight: bold;

    color: #00ffff;

    text-shadow:
        0 0 10px #00ffff;
}

/* ========================= */
/* SECTION */
/* ========================= */

.section {
    margin-top: 35px;
}

.section-title {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 20px;
}

.section-title h2 {
    color: #ff00ff;

    text-shadow:
        0 0 10px #ff00ff;
}

/* ========================= */
/* ADD TEMPLATE BUTTON */
/* ========================= */

.add-btn {
    padding: 11px 18px;

    border-radius: 8px;

    background:
        linear-gradient(
            90deg,
            #ff00ff,
            #00ffff
        );

    color: black;

    text-decoration: none;

    font-weight: bold;

    transition: 0.3s;
}

.add-btn:hover {
    box-shadow:
        0 0 15px #ff00ff,
        0 0 20px #00ffff;

    transform: translateY(-2px);
}

/* ========================= */
/* TEMPLATE GRID */
/* ========================= */

.template-grid {
    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 20px;
}

.template-card {
    padding: 20px;

    border-radius: 18px;

    background:
        rgba(255,255,255,0.06);

    border:
        1px solid rgba(255,255,255,0.1);

    backdrop-filter: blur(15px);

    transition: 0.3s;
}

.template-card:hover {
    border-color: #ff00ff;

    box-shadow:
        0 0 20px rgba(255,0,255,0.2);

    transform: translateY(-5px);
}

.template-image {
    width: 100%;

    height: 150px;

    object-fit: cover;

    border-radius: 12px;

    margin-bottom: 15px;

    background: #111;
}

.template-card h3 {
    color: #00ffff;

    margin-bottom: 8px;
}

.category {
    color: #ff00ff;

    font-size: 14px;

    margin-bottom: 8px;
}

.description {
    color: #aaa;

    font-size: 14px;

    min-height: 40px;

    margin-bottom: 12px;
}

.price {
    color: #00ffff;

    font-size: 20px;

    font-weight: bold;

    margin-bottom: 15px;
}

/* ========================= */
/* ACTION BUTTONS */
/* ========================= */

.actions {
    display: flex;

    gap: 10px;
}

.edit-btn,
.delete-btn {
    padding: 9px 14px;

    border-radius: 7px;

    text-decoration: none;

    font-size: 13px;
}

.edit-btn {
    color: #00ffff;

    border:
        1px solid #00ffff;
}

.edit-btn:hover {
    background: #00ffff;

    color: black;

    box-shadow:
        0 0 10px #00ffff;
}

.delete-btn {
    color: #ff4d6d;

    border:
        1px solid #ff4d6d;
}

.delete-btn:hover {
    background: #ff4d6d;

    color: black;

    box-shadow:
        0 0 10px #ff4d6d;
}

/* ========================= */
/* REQUEST TABLE */
/* ========================= */

.table-wrapper {
    overflow-x: auto;

    border-radius: 15px;
}

table {
    width: 100%;

    border-collapse: collapse;

    background:
        rgba(255,255,255,0.05);

    backdrop-filter: blur(15px);
}

th {
    padding: 15px;

    text-align: left;

    color: #00ffff;

    border-bottom:
        1px solid rgba(0,255,255,0.2);
}

td {
    padding: 15px;

    color: #ccc;

    border-bottom:
        1px solid rgba(255,255,255,0.08);
}

tr:hover {
    background:
        rgba(255,255,255,0.04);
}

/* ========================= */
/* REQUEST STATUS */
/* ========================= */

.status {
    padding: 6px 12px;

    border-radius: 20px;

    font-size: 12px;

    border:
        1px solid #00ffff;

    color: #00ffff;
}

/* ========================= */
/* MANAGE REQUEST */
/* ========================= */

.manage-btn {
    padding: 8px 12px;

    border-radius: 7px;

    text-decoration: none;

    color: #ff00ff;

    border:
        1px solid #ff00ff;
}

.manage-btn:hover {
    background: #ff00ff;

    color: black;

    box-shadow:
        0 0 10px #ff00ff;
}

/* ========================= */
/* EMPTY MESSAGE */
/* ========================= */

.empty {
    padding: 30px;

    text-align: center;

    color: #777;

    border:
        1px dashed rgba(255,255,255,0.2);

    border-radius: 15px;
}

/* ========================= */
/* FOOTER */
/* ========================= */

footer {
    margin-top: 60px;

    padding: 25px;

    text-align: center;

    color: #666;

    border-top:
        1px solid rgba(255,255,255,0.08);
}

/* ========================= */
/* RESPONSIVE */
/* ========================= */

@media(max-width: 900px) {

    .stats {
        grid-template-columns: 1fr;
    }

    .template-grid {
        grid-template-columns:
            repeat(2, 1fr);
    }
}

@media(max-width: 600px) {

    .navbar {
        padding: 18px 5%;
    }

    .logo {
        font-size: 18px;
    }

    .admin-name {
        display: none;
    }

    .container {
        width: 94%;
    }

    .dashboard-header h1 {
        font-size: 28px;
    }

    .template-grid {
        grid-template-columns: 1fr;
    }

    .section-title {
        gap: 15px;
        align-items: flex-start;
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

    <div class="nav-right">

        <span class="admin-name">
            Admin Panel
        </span>

        <a href="LogoutServlet"
           class="logout-btn">

            Logout

        </a>

    </div>

</nav>


<!-- ========================= -->
<!-- MAIN CONTAINER -->
<!-- ========================= -->

<div class="container">


    <!-- HEADER -->

    <div class="dashboard-header">

        <h1>
            Admin Dashboard
        </h1>

        <p>
            Manage website templates and customer requests
        </p>

    </div>



    <!-- ========================= -->
    <!-- STATISTICS -->
    <!-- ========================= -->

    <div class="stats">


        <div class="stat-card">

            <h3>
                Total Templates
            </h3>

            <div class="stat-number">

                <%= templates.size() %>

            </div>

        </div>



        <div class="stat-card">

            <h3>
                Total Requests
            </h3>

            <div class="stat-number">

                <%= requests.size() %>

            </div>

        </div>



        <div class="stat-card">

            <h3>
                Admin Status
            </h3>

            <div class="stat-number">

                ACTIVE

            </div>

        </div>


    </div>



    <!-- ========================= -->
    <!-- WEBSITE TEMPLATES -->
    <!-- ========================= -->

    <div class="section">


        <div class="section-title">

            <h2>
                Website Templates
            </h2>


            <a href="addTemplate.jsp"
               class="add-btn">

                + Add Template

            </a>

        </div>



        <%
            if (templates != null && !templates.isEmpty()) {
        %>


        <div class="template-grid">


            <%
                for (WebsiteTemplate template : templates) {
            %>


            <div class="template-card">


                <%
                    if (template.getDemoImage() != null
                        && !template.getDemoImage().isEmpty()) {
                %>

                    <img
                        src="<%= template.getDemoImage() %>"
                        class="template-image"
                        alt="Website Demo">

                <%
                    } else {
                %>

                    <div class="template-image"
                         style="display:flex;
                                align-items:center;
                                justify-content:center;
                                color:#777;">

                        No Preview

                    </div>

                <%
                    }
                %>


                <h3>

                    <%= template.getTemplateName() %>

                </h3>


                <div class="category">

                    <%= template.getCategory() %>

                </div>


                <div class="description">

                    <%= template.getDescription() %>

                </div>


                <div class="price">

                    ₹ <%= template.getPrice() %>

                </div>


                <div class="actions">


                    <a
                        href="updateTemplate.jsp?id=<%= template.getTemplateId() %>"
                        class="edit-btn">

                        Edit

                    </a>


                    <a
                        href="DeleteTemplateController?id=<%= template.getTemplateId() %>"
                        class="delete-btn"
                        onclick="return confirm('Are you sure you want to delete this template?');">

                        Delete

                    </a>


                </div>


            </div>


            <%
                }
            %>


        </div>


        <%
            } else {
        %>


        <div class="empty">

            No website templates available.

        </div>


        <%
            }
        %>


    </div>



    <!-- ========================= -->
    <!-- WEBSITE REQUESTS -->
    <!-- ========================= -->

    <div class="section">


        <div class="section-title">

            <h2>
                Customer Requests
            </h2>

        </div>



        <%
            if (requests != null && !requests.isEmpty()) {
        %>


        <div class="table-wrapper">


            <table>


                <thead>

                    <tr>

                        <th>
                            Request ID
                        </th>

                        <th>
                            User ID
                        </th>

                        <th>
                            Template ID
                        </th>

                        <th>
                            Requirements
                        </th>

                        <th>
                            Status
                        </th>

                        <th>
                            Action
                        </th>

                    </tr>

                </thead>


                <tbody>


                <%
                    for (WebsiteRequest req : requests) {
                %>


                    <tr>


                        <td>

                            <%= req.getRequestId() %>

                        </td>


                        <td>

                            <%= req.getUserId() %>

                        </td>


                        <td>

                            <%= req.getTemplateId() %>

                        </td>


                        <td>

                            <%= req.getRequirements() %>

                        </td>


                        <td>

                            <span class="status">

                                <%= req.getStatus() %>

                            </span>

                        </td>


                        <td>

                            <a
                                href="adminRequest.jsp?id=<%= req.getRequestId() %>"
                                class="manage-btn">

                                Manage

                            </a>

                        </td>


                    </tr>


                <%
                    }
                %>


                </tbody>


            </table>


        </div>


        <%
            } else {
        %>


        <div class="empty">

            No customer requests available.

        </div>


        <%
            }
        %>


    </div>


</div>


<!-- ========================= -->
<!-- FOOTER -->
<!-- ========================= -->

<footer>

    © 2026 Buy Your Website |
    Admin Dashboard

</footer>


</body>

</html>