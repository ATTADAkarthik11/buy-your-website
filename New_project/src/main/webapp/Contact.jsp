<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Karthik Attada | Connect</title>

<!-- Font Awesome -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {

    min-height: 100vh;

    font-family: "Segoe UI", Arial, sans-serif;

    color: white;

    background:
        radial-gradient(
            circle at 15% 20%,
            rgba(0,255,255,0.10),
            transparent 30%
        ),
        radial-gradient(
            circle at 85% 80%,
            rgba(180,0,255,0.10),
            transparent 30%
        ),
        #05050d;

    overflow-x: hidden;
}


/* ================= NAVBAR ================= */

nav {

    width: 92%;

    margin: 25px auto;

    padding: 18px 25px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    border: 1px solid rgba(0,255,255,0.22);

    border-radius: 18px;

    background: rgba(255,255,255,0.045);

    backdrop-filter: blur(15px);

    box-shadow:
        0 0 20px rgba(0,255,255,0.06);
}


.logo {

    font-size: 25px;

    font-weight: 700;

    color: #00f6ff;

    text-shadow:
        0 0 8px rgba(0,246,255,0.6);
}


nav a {

    color: #ddd;

    text-decoration: none;

    margin-left: 25px;

    font-size: 14px;

    transition: 0.3s;
}


nav a:hover {

    color: #00f6ff;

    text-shadow:
        0 0 10px rgba(0,246,255,0.7);
}


/* ================= MAIN ================= */

.contact-container {

    width: 90%;

    max-width: 1000px;

    margin: 55px auto;

    display: flex;

    justify-content: center;

    align-items: center;
}


/* ================= CARD ================= */

.contact-card {

    width: 100%;

    max-width: 850px;

    padding: 45px 45px;

    text-align: center;

    background: rgba(255,255,255,0.045);

    border: 1px solid rgba(0,255,255,0.20);

    border-radius: 28px;

    backdrop-filter: blur(18px);

    box-shadow:
        0 0 25px rgba(0,255,255,0.07),
        0 0 60px rgba(150,0,255,0.06);
}


/* ================= PROFILE PHOTO ================= */

.profile-wrapper {

    width: 170px;

    height: 170px;

    margin: 0 auto 25px;

    padding: 4px;

    border-radius: 50%;

    background: linear-gradient(
        135deg,
        #00f6ff,
        #6c5cff,
        #ff00d4
    );

    box-shadow:
        0 0 18px rgba(0,246,255,0.35);

    transition: 0.4s;
}


.profile-wrapper:hover {

    transform: scale(1.04);

    box-shadow:
        0 0 25px rgba(0,246,255,0.55);
}


.profile-image {

    width: 100%;

    height: 100%;

    display: block;

    object-fit: cover;

    border-radius: 50%;

    border: 5px solid #0b0c13;

    background: #0b0c13;
}


/* ================= NAME ================= */

.name {

    font-size: 42px;

    font-weight: 700;

    letter-spacing: 5px;

    text-transform: uppercase;

    margin-bottom: 12px;

    color: #ffffff;

    text-shadow:
        0 0 8px rgba(0,246,255,0.35);
}


/* Small cyan line below name */

.name::after {

    content: "";

    display: block;

    width: 70px;

    height: 2px;

    margin: 12px auto 0;

    background: #00f6ff;

    box-shadow:
        0 0 8px #00f6ff;

    border-radius: 10px;
}


/* ================= SUBTITLE ================= */

.subtitle {

    font-size: 14px;

    color: #aaa;

    letter-spacing: 2px;

    margin-top: 20px;

    margin-bottom: 38px;
}


.subtitle span {

    color: #00eaff;

    font-weight: 500;

    text-shadow:
        0 0 6px rgba(0,246,255,0.5);
}


/* ================= CONTACT GRID ================= */

.contact-grid {

    display: grid;

    grid-template-columns: repeat(2, 1fr);

    gap: 15px;

    margin-bottom: 35px;
}


.contact-item {

    padding: 18px;

    border-radius: 16px;

    background: rgba(255,255,255,0.035);

    border: 1px solid rgba(255,255,255,0.09);

    transition: 0.3s;

    text-decoration: none;

    color: white;

    display: flex;

    align-items: center;

    text-align: left;
}


.contact-item:hover {

    transform: translateY(-3px);

    border-color: rgba(0,246,255,0.6);

    box-shadow:
        0 0 15px rgba(0,246,255,0.15);
}


/* ================= ICON ================= */

.contact-icon {

    width: 48px;

    height: 48px;

    min-width: 48px;

    display: flex;

    align-items: center;

    justify-content: center;

    border-radius: 50%;

    margin-right: 14px;

    font-size: 19px;

    color: #00f6ff;

    border: 1px solid rgba(0,246,255,0.6);

    background: rgba(0,246,255,0.04);

    box-shadow:
        0 0 8px rgba(0,246,255,0.15);
}


.contact-text small {

    display: block;

    color: #777;

    font-size: 12px;

    margin-bottom: 4px;
}


.contact-text span {

    font-size: 14px;

    color: #ddd;

    word-break: break-word;
}


/* ================= SOCIAL ================= */

.social-title {

    font-size: 13px;

    color: #777;

    letter-spacing: 3px;

    margin-bottom: 18px;
}


.social-links {

    display: flex;

    justify-content: center;

    gap: 18px;
}


.social {

    width: 52px;

    height: 52px;

    display: flex;

    justify-content: center;

    align-items: center;

    border-radius: 50%;

    color: #ccc;

    font-size: 21px;

    text-decoration: none;

    border: 1px solid rgba(255,255,255,0.15);

    background: rgba(255,255,255,0.04);

    transition: 0.3s;
}


.social:hover {

    transform: translateY(-5px);

    color: #00f6ff;

    border-color: #00f6ff;

    box-shadow:
        0 0 15px rgba(0,246,255,0.35);
}


/* ================= FOOTER ================= */

footer {

    text-align: center;

    padding: 25px;

    color: #666;

    font-size: 12px;
}


footer span {

    color: #00f6ff;
}


/* ================= MOBILE ================= */

@media(max-width:700px) {

    nav {

        flex-direction: column;

        gap: 15px;
    }

    nav a {

        margin: 0 7px;

        font-size: 13px;
    }

    .contact-card {

        padding: 35px 18px;
    }

    .profile-wrapper {

        width: 145px;

        height: 145px;
    }

    .name {

        font-size: 20px;

        letter-spacing: 3px;
    }

    .subtitle {

        font-size: 12px;

        letter-spacing: 1px;

        line-height: 2;
    }

    .contact-grid {

        grid-template-columns: 1fr;
    }

}


/* ================= END ================= */

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav>

    <div class="logo">
        BuyYourWebsite
    </div>

    <div>

        <a href="index.jsp">Home</a>

        <a href="login.jsp">Login</a>

        <a href="register.jsp">Register</a>

        <a href="Contact.jsp">Contact</a>

    </div>

</nav>



<!-- ================= CONTACT ================= -->

<div class="contact-container">

    <div class="contact-card">


        <!-- PROFILE PHOTO -->

        <div class="profile-wrapper">

            <img
                src="${pageContext.request.contextPath}/img/profile.jpg"
                alt="Karthik Attada"
                class="profile-image">

        </div>



        <!-- NAME -->

        <h1 class="name">
            KARTHIK ATTADA
        </h1>



        <!-- ROLE -->

        <div class="subtitle">

            <span>JAVA</span>

           

            <span>WEB DEVELOPER</span>


        </div>



        <!-- ================= CONTACT DETAILS ================= -->

        <div class="contact-grid">


            <!-- PHONE -->

            <a href="tel:7207224014"
               class="contact-item">

                <div class="contact-icon">

                    <i class="fa-solid fa-phone"></i>

                </div>

                <div class="contact-text">

                    <small>PHONE</small>

                    <span>
                        7207224014
                    </span>

                </div>

            </a>



            <!-- EMAIL -->

            <a href="mailto:karthikattada014@gmail.com"
               class="contact-item">

                <div class="contact-icon">

                    <i class="fa-solid fa-envelope"></i>

                </div>

                <div class="contact-text">

                    <small>EMAIL</small>

                    <span>
                        karthikattada014@gmail.com
                    </span>

                </div>

            </a>



            <!-- INSTITUTE -->

            <div class="contact-item">

                <div class="contact-icon">

                    <i class="fa-solid fa-graduation-cap"></i>

                </div>

                <div class="contact-text">

                    <small>INSTITUTE</small>

                    <span>
                        KIET
                    </span>

                </div>

            </div>



            <!-- LOCATION -->

            <div class="contact-item">

                <div class="contact-icon">

                    <i class="fa-solid fa-location-dot"></i>

                </div>

                <div class="contact-text">

                    <small>LOCATION</small>

                    <span>
                        Srikakulam
                    </span>

                </div>

            </div>


        </div>



        <!-- ================= SOCIAL ================= -->

        <div class="social-title">
            CONNECT WITH ME
        </div>


        <div class="social-links">


            <!-- LINKEDIN -->

            <a
                href="https://www.linkedin.com/in/attada-karthik-03656b2ba/"
                target="_blank"
                class="social"
                title="LinkedIn">

                <i class="fa-brands fa-linkedin-in"></i>

            </a>



            <!-- GITHUB -->

            <a
                href="https://github.com/ATTADAkarthik11"
                target="_blank"
                class="social"
                title="GitHub">

                <i class="fa-brands fa-github"></i>

            </a>



            <!-- INSTAGRAM -->

            <a
                href="https://www.instagram.com/jax__.11/"
                target="_blank"
                class="social"
                title="Instagram">

                <i class="fa-brands fa-instagram"></i>

            </a>


        </div>


    </div>

</div>



<!-- ================= FOOTER ================= -->

<footer>

    &copy; 2026

    <span>
        Karthik Attada
    </span>

    | BuyYourWebsite

</footer>


</body>

</html>