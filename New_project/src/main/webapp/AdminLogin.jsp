<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Login | Buy Your Website</title>


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

    overflow-x: hidden;

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

    opacity: 0.15;

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

    opacity: 0.15;

    right: -150px;

    bottom: 50px;

    z-index: -1;

}


/* ============================= */
/* NAVBAR */
/* ============================= */

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
/* LOGIN CONTAINER */
/* ============================= */

.login-container {

    min-height: calc(100vh - 75px);

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 40px 20px;

}


/* ============================= */
/* LOGIN CARD */
/* ============================= */

.login-card {

    width: 400px;

    padding: 40px;

    background:
        rgba(255,255,255,0.07);

    border:
        1px solid rgba(255,0,255,0.3);

    border-radius: 20px;

    backdrop-filter: blur(20px);

    box-shadow:
        0 0 25px rgba(255,0,255,0.15),
        inset 0 0 20px rgba(255,255,255,0.03);

}


/* ============================= */
/* ADMIN ICON */
/* ============================= */

.admin-icon {

    width: 75px;

    height: 75px;

    margin: 0 auto 20px;

    border-radius: 50%;

    display: flex;

    justify-content: center;

    align-items: center;

    font-size: 32px;

    border: 2px solid #ff00ff;

    color: #ff00ff;

    box-shadow:
        0 0 15px #ff00ff,
        0 0 30px rgba(255,0,255,0.4);

}


/* ============================= */
/* TITLE */
/* ============================= */

.login-card h1 {

    text-align: center;

    margin-bottom: 10px;

    color: #ff00ff;

    text-shadow:
        0 0 10px #ff00ff,
        0 0 20px #ff00ff;

}


.login-card p {

    text-align: center;

    color: #999;

    margin-bottom: 30px;

}


/* ============================= */
/* FORM */
/* ============================= */

.form-group {

    margin-bottom: 20px;

}


.form-group label {

    display: block;

    margin-bottom: 8px;

    color: #ddd;

}


.form-group input {

    width: 100%;

    padding: 13px;

    border-radius: 10px;

    border:
        1px solid rgba(0,255,255,0.3);

    background:
        rgba(0,0,0,0.5);

    color: white;

    outline: none;

    font-size: 15px;

    transition: 0.3s;

}


.form-group input:focus {

    border-color: #ff00ff;

    box-shadow:
        0 0 12px rgba(255,0,255,0.5);

}


/* ============================= */
/* LOGIN BUTTON */
/* ============================= */

.login-btn {

    width: 100%;

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

    font-size: 16px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;

}


.login-btn:hover {

    transform: translateY(-2px);

    box-shadow:
        0 0 15px #ff00ff,
        0 0 25px #00ffff;

}


/* ============================= */
/* BACK LINK */
/* ============================= */

.back-link {

    text-align: center;

    margin-top: 25px;

}


.back-link a {

    color: #00ffff;

    text-decoration: none;

}


.back-link a:hover {

    text-shadow:
        0 0 10px #00ffff;

}


/* ============================= */
/* RESPONSIVE */
/* ============================= */

@media(max-width: 500px) {

    .login-card {

        width: 100%;

        padding: 30px 20px;

    }


    .navbar {

        padding: 18px 5%;

    }


    .nav-links a {

        margin-left: 10px;

        font-size: 14px;

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

        <a href="index.jsp">

            Home

        </a>


        <a href="login.jsp">

            User Login

        </a>


        <a href="register.jsp">

            Register

        </a>

    </div>

</nav>



<!-- ============================= -->
<!-- ADMIN LOGIN -->
<!-- ============================= -->

<div class="login-container">


    <div class="login-card">


        <!-- Admin Icon -->

        <div class="admin-icon">

            ⚡

        </div>


        <h1>

            Admin Login

        </h1>


        <p>

            Login to manage your website platform

        </p>



        <!-- Login Form -->

        <form
            action="AdminLoginController"
            method="post">


            <!-- Username -->

            <div class="form-group">

                <label>

                    Admin Username

                </label>


                <input
                    type="text"
                    name="username"
                    placeholder="Enter admin username"
                    required>

            </div>



            <!-- Password -->

            <div class="form-group">

                <label>

                    Admin Password

                </label>


                <input
                    type="password"
                    name="password"
                    placeholder="Enter admin password"
                    required>

            </div>



            <!-- Login -->

            <button
                type="submit"
                class="login-btn">

                ADMIN LOGIN

            </button>


        </form>



        <!-- Back -->

        <div class="back-link">

            <a href="index.jsp">

                ← Back to Website

            </a>

        </div>


    </div>

</div>


</body>

</html>