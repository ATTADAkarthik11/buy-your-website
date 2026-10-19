<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login | Buy Your Website</title>

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
    overflow-x: hidden;
}

/* Neon background */

body::before {
    content: "";
    position: fixed;
    width: 350px;
    height: 350px;
    background: #00ffff;
    filter: blur(150px);
    opacity: 0.18;
    top: 80px;
    left: -100px;
    z-index: -1;
}

body::after {
    content: "";
    position: fixed;
    width: 350px;
    height: 350px;
    background: #ff00ff;
    filter: blur(150px);
    opacity: 0.18;
    bottom: 50px;
    right: -100px;
    z-index: -1;
}

/* Navbar */

.navbar {
    width: 100%;
    padding: 20px 7%;
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
    text-shadow: 0 0 15px #00ffff;
}

.navbar a {
    color: white;
    text-decoration: none;
    margin-left: 25px;
    transition: 0.3s;
}

.navbar a:hover {
    color: #00ffff;
    text-shadow: 0 0 10px #00ffff;
}

/* Login section */

.login-container {
    min-height: calc(100vh - 75px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
}

/* Glass card */

.login-card {
    width: 400px;
    padding: 40px;
    background: rgba(255,255,255,0.07);
    border: 1px solid rgba(0,255,255,0.3);
    border-radius: 20px;
    backdrop-filter: blur(20px);
    box-shadow:
        0 0 25px rgba(0,255,255,0.15),
        inset 0 0 20px rgba(255,255,255,0.03);
}

.login-card h1 {
    text-align: center;
    margin-bottom: 10px;
    color: #00ffff;
    text-shadow: 0 0 15px #00ffff;
}

.login-card p {
    text-align: center;
    color: #aaa;
    margin-bottom: 30px;
}

/* Input */

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
    border: 1px solid rgba(0,255,255,0.3);
    background: rgba(0,0,0,0.5);
    color: white;
    outline: none;
    font-size: 15px;
    transition: 0.3s;
}

.form-group input:focus {
    border-color: #00ffff;
    box-shadow: 0 0 12px rgba(0,255,255,0.5);
}

/* Login button */

.login-btn {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(90deg, #00ffff, #ff00ff);
    color: black;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.login-btn:hover {
    transform: translateY(-2px);
    box-shadow:
        0 0 15px #00ffff,
        0 0 25px #ff00ff;
}

/* Register link */

.register-link {
    text-align: center;
    margin-top: 25px;
    color: #aaa;
}

.register-link a {
    color: #00ffff;
    text-decoration: none;
}

.register-link a:hover {
    text-shadow: 0 0 10px #00ffff;
}

/* Responsive */

@media(max-width: 500px) {

    .login-card {
        width: 100%;
        padding: 30px 20px;
    }

    .navbar {
        padding: 18px 5%;
    }

    .navbar a {
        margin-left: 10px;
        font-size: 14px;
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

    <div>
        <a href="index.jsp">Home</a>
        <a href="register.jsp">Register</a>
        <a href="Contact.jsp">Contact</a>
    </div>

</nav>


<!-- Login -->

<div class="login-container">

    <div class="login-card">

        <h1>Welcome Back</h1>

        <p>Login to continue your website journey</p>


        <form action="LoginController" method="post">

            <div class="form-group">

                <label>Username</label>

                <input
                    type="text"
                    name="username"
                    placeholder="Enter username"
                    required>

            </div>


            <div class="form-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter password"
                    required>

            </div>


            <button type="submit" class="login-btn">
                LOGIN
            </button>

        </form>


        <div class="register-link">

            Don't have an account?

            <a href="register.jsp">
                Register Now
            </a>

        </div>

    </div>

</div>

</body>
</html>