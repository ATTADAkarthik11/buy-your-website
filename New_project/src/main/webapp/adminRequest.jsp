<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.dao.RequestDao" %>
<%@ page import="com.model.WebsiteRequest" %>

<%
    Object admin = session.getAttribute("admin");

    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    String id = request.getParameter("id");

    WebsiteRequest selectedRequest = null;

    if (id != null) {

        try {

            int requestId = Integer.parseInt(id);

            RequestDao dao = new RequestDao();

            List<WebsiteRequest> requests = dao.getAllRequests();

            for (WebsiteRequest req : requests) {

                if (req.getRequestId() == requestId) {

                    selectedRequest = req;

                    break;
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

        }
    }

    if (selectedRequest == null) {

        response.sendRedirect("AdminHome.jsp");

        return;
    }
%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Request | Buy Your Website</title>


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

    background:
        rgba(255,255,255,0.05);

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

    max-width: 750px;

    margin: 50px auto;
}


/* ========================= */
/* CARD */
/* ========================= */

.request-card {

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

.request-card h1 {

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
/* DETAILS */
/* ========================= */

.details {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 15px;

    margin-bottom: 25px;
}


.detail-box {

    padding: 15px;

    border-radius: 10px;

    background:
        rgba(0,0,0,0.35);

    border:
        1px solid rgba(0,255,255,0.15);
}


.detail-box span {

    display: block;

    color: #777;

    font-size: 13px;

    margin-bottom: 6px;
}


.detail-box strong {

    color: #00ffff;

    font-size: 16px;
}


/* ========================= */
/* REQUIREMENTS */
/* ========================= */

.requirements {

    padding: 20px;

    border-radius: 12px;

    background:
        rgba(0,0,0,0.4);

    border:
        1px solid rgba(255,0,255,0.2);

    margin-bottom: 25px;
}


.requirements h3 {

    color: #ff00ff;

    margin-bottom: 12px;
}


.requirements p {

    color: #ccc;

    line-height: 1.6;

    white-space: pre-wrap;
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


.form-group textarea {

    width: 100%;

    min-height: 110px;

    padding: 13px;

    border-radius: 10px;

    border:
        1px solid rgba(0,255,255,0.25);

    background:
        rgba(0,0,0,0.5);

    color: white;

    outline: none;

    resize: vertical;

    font-size: 15px;
}


.form-group textarea:focus {

    border-color: #ff00ff;

    box-shadow:
        0 0 12px rgba(255,0,255,0.4);
}


/* ========================= */
/* BUTTONS */
/* ========================= */

.buttons {

    display: flex;

    gap: 15px;
}


.accept-btn,
.reject-btn {

    flex: 1;

    padding: 14px;

    border-radius: 10px;

    font-weight: bold;

    cursor: pointer;

    font-size: 14px;

    transition: 0.3s;
}


.accept-btn {

    border:
        1px solid #00ff99;

    background:
        rgba(0,255,153,0.08);

    color: #00ff99;
}


.accept-btn:hover {

    background: #00ff99;

    color: black;

    box-shadow:
        0 0 15px #00ff99;
}


.reject-btn {

    border:
        1px solid #ff4d6d;

    background:
        rgba(255,77,109,0.08);

    color: #ff4d6d;
}


.reject-btn:hover {

    background: #ff4d6d;

    color: black;

    box-shadow:
        0 0 15px #ff4d6d;
}


/* ========================= */
/* CANCEL */
/* ========================= */

.cancel {

    display: block;

    text-align: center;

    margin-top: 25px;

    color: #888;

    text-decoration: none;
}


.cancel:hover {

    color: #00ffff;

}


/* ========================= */
/* RESPONSIVE */
/* ========================= */

@media(max-width: 600px) {

    .container {

        width: 94%;

        margin: 30px auto;
    }


    .request-card {

        padding: 25px 20px;
    }


    .details {

        grid-template-columns: 1fr;
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
<!-- MAIN -->
<!-- ========================= -->

<div class="container">


    <div class="request-card">


        <h1>

            Manage Website Request

        </h1>


        <p class="subtitle">

            Review customer requirements and update request status

        </p>



        <!-- ========================= -->
        <!-- REQUEST DETAILS -->
        <!-- ========================= -->

        <div class="details">


            <div class="detail-box">

                <span>
                    Request ID
                </span>

                <strong>
                    <%= selectedRequest.getRequestId() %>
                </strong>

            </div>


            <div class="detail-box">

                <span>
                    User ID
                </span>

                <strong>
                    <%= selectedRequest.getUserId() %>
                </strong>

            </div>


            <div class="detail-box">

                <span>
                    Template ID
                </span>

                <strong>
                    <%= selectedRequest.getTemplateId() %>
                </strong>

            </div>


            <div class="detail-box">

                <span>
                    Current Status
                </span>

                <strong>
                    <%= selectedRequest.getStatus() %>
                </strong>

            </div>


        </div>



        <!-- ========================= -->
        <!-- REQUIREMENTS -->
        <!-- ========================= -->

        <div class="requirements">

            <h3>
                Customer Requirements
            </h3>

            <p>
<%= selectedRequest.getRequirements() %>
            </p>

        </div>



        <!-- ========================= -->
        <!-- UPDATE FORM -->
        <!-- ========================= -->

        <form
            action="AdminRequestController"
            method="post">


            <input
                type="hidden"
                name="requestId"
                value="<%= selectedRequest.getRequestId() %>">



            <!-- Admin Message -->

            <div class="form-group">

                <label>

                    Admin Message

                </label>


                <textarea
                    name="adminMessage"
                    placeholder="Enter message for customer..."><%= selectedRequest.getAdminMessage() == null ? "" : selectedRequest.getAdminMessage() %></textarea>

            </div>



            <!-- Buttons -->

            <div class="buttons">


                <button
                    type="submit"
                    name="status"
                    value="ACCEPTED"
                    class="accept-btn">

                    ✓ ACCEPT REQUEST

                </button>


                <button
                    type="submit"
                    name="status"
                    value="REJECTED"
                    class="reject-btn">

                    ✕ REJECT REQUEST

                </button>


            </div>


        </form>



        <a
            href="AdminHome.jsp"
            class="cancel">

            ← Back to Dashboard

        </a>


    </div>

</div>


</body>

</html>