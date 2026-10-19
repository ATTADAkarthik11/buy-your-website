<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buy Your Website</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            background: #050510;
            color: white;
            overflow-x: hidden;
        }

        body::before {
            content: "";
            position: fixed;
            width: 350px;
            height: 350px;
            background: #00ffff;
            filter: blur(150px);
            opacity: 0.15;
            top: -100px;
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
            opacity: 0.15;
            bottom: -100px;
            right: -100px;
            z-index: -1;
        }

        nav {
            width: 90%;
            margin: 20px auto;
            padding: 18px 30px;

            display: flex;
            justify-content: space-between;
            align-items: center;

            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 20px;

            backdrop-filter: blur(15px);
            box-shadow: 0 0 25px rgba(0, 255, 255, 0.15);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #00ffff;
            text-shadow: 0 0 15px #00ffff;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 25px;
            transition: 0.3s;
        }

        nav a:hover {
            color: #00ffff;
            text-shadow: 0 0 10px #00ffff;
        }

        .hero {
            min-height: 75vh;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

            text-align: center;
            padding: 40px 20px;
        }

        .hero h1 {
            font-size: 60px;
            margin-bottom: 20px;

            background: linear-gradient(
                90deg,
                #00ffff,
                #ff00ff,
                #00ffff
            );

            background-size: 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;

            animation: glowText 4s linear infinite;
        }

        @keyframes glowText {
            0% {
                background-position: 0%;
            }

            100% {
                background-position: 200%;
            }
        }

        .hero p {
            max-width: 700px;
            font-size: 18px;
            color: #cccccc;
            line-height: 1.7;
            margin-bottom: 35px;
        }

        .buttons {
            display: flex;
            gap: 20px;
        }

        .btn {
            padding: 14px 30px;
            border-radius: 30px;
            text-decoration: none;
            color: white;
            border: 1px solid #00ffff;
            transition: 0.3s;
        }

        .btn:hover {
            background: #00ffff;
            color: #000;
            box-shadow: 0 0 25px #00ffff;
        }

        .primary {
            background: linear-gradient(90deg, #00ffff, #7b00ff);
            border: none;
        }

        .primary:hover {
            color: white;
            box-shadow: 0 0 30px #7b00ff;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #888;
        }

        @media(max-width: 700px) {

            .hero h1 {
                font-size: 40px;
            }

            nav {
                width: 95%;
                padding: 15px;
            }

            nav a {
                margin-left: 10px;
                font-size: 14px;
            }

            .buttons {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

    <nav>

        <div class="logo">
            BuyYourWebsite
        </div>

        <div>
            <a href="index.jsp">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
            <a href="Contact.jsp">Contact</a>
            <a href="AdminLogin.jsp">Admin</a>
        </div>

    </nav>


    <section class="hero">

        <h1>Build Your Digital Future</h1>

        <p>
            Choose a professional website template,
            customize it with your requirements,
            and get your website built for your business,
            portfolio or startup.
        </p>

        <div class="buttons">

            <a href="login.jsp" class="btn primary">
                Get Started
            </a>

            <a href="register.jsp" class="btn">
                Create Account
            </a>

        </div>

    </section>


    <footer>

        © 2026 karthik attada 

    </footer>

</body>
</html>