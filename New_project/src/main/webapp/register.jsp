<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Register - Buy Your Website</title>

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
	padding: 30px 0;
}

/* Background Glow */
body::before {
	content: "";
	position: fixed;
	width: 350px;
	height: 350px;
	background: #00ffff;
	filter: blur(150px);
	opacity: 0.12;
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
	opacity: 0.12;
	bottom: -100px;
	right: -100px;
	z-index: -1;
}

/* Navbar */
nav {
	width: 90%;
	margin: 0 auto 30px;
	padding: 18px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: rgba(255, 255, 255, 0.07);
	border: 1px solid rgba(255, 255, 255, 0.15);
	border-radius: 20px;
	backdrop-filter: blur(15px);
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
}

nav a:hover {
	color: #00ffff;
	text-shadow: 0 0 10px #00ffff;
}

/* Register Box */
.container {
	width: 90%;
	max-width: 800px;
	margin: auto;
	padding: 35px;
	background: rgba(255, 255, 255, 0.06);
	border: 1px solid rgba(255, 255, 255, 0.15);
	border-radius: 25px;
	backdrop-filter: blur(20px);
	box-shadow: 0 0 30px rgba(0, 255, 255, 0.12), inset 0 0 20px
		rgba(255, 255, 255, 0.02);
}

h1 {
	text-align: center;
	color: #00ffff;
	text-shadow: 0 0 15px #00ffff;
	margin-bottom: 10px;
}

.subtitle {
	text-align: center;
	color: #aaa;
	margin-bottom: 30px;
}

/* Form */
.form-row {
	display: flex;
	gap: 20px;
}

.form-group {
	flex: 1;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #ddd;
}

input {
	width: 100%;
	padding: 13px 15px;
	background: rgba(0, 0, 0, 0.35);
	color: white;
	border: 1px solid rgba(0, 255, 255, 0.3);
	border-radius: 10px;
	outline: none;
}

input:focus {
	border-color: #00ffff;
	box-shadow: 0 0 12px rgba(0, 255, 255, 0.4);
}

.error {
	display: block;
	color: #ff4d6d;
	font-size: 13px;
	margin-top: 6px;
	min-height: 16px;
}

/* Button */
button {
	width: 100%;
	padding: 14px;
	border: none;
	border-radius: 25px;
	background: linear-gradient(90deg, #00ffff, #7b00ff);
	color: white;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	box-shadow: 0 0 25px #00ffff;
	transform: translateY(-2px);
}

.login-link {
	text-align: center;
	margin-top: 20px;
	color: #aaa;
}

.login-link a {
	color: #00ffff;
	text-decoration: none;
}

@media ( max-width : 650px) {
	.form-row {
		flex-direction: column;
		gap: 0;
	}
	nav {
		width: 95%;
		padding: 15px;
	}
	nav a {
		margin-left: 8px;
		font-size: 13px;
	}
	.container {
		width: 95%;
		padding: 25px;
	}
}
</style>

<script>
	function validateRegister() {

		let valid = true;

		/* Name */

		let firstname = document.getElementById("firstname").value.trim();

		if (!/^[A-Za-z ]+$/.test(firstname)) {
			document.getElementById("firstnameError").innerHTML = "First name should contain only letters";
			valid = false;
		} else {
			document.getElementById("firstnameError").innerHTML = "";
		}

		/* Last Name */

		let lastname = document.getElementById("lastname").value.trim();

		if (lastname !== "" && !/^[A-Za-z ]+$/.test(lastname)) {

			document.getElementById("lastnameError").innerHTML = "Last name should contain only letters";

			valid = false;

		} else {

			document.getElementById("lastnameError").innerHTML = "";
		}

		/* Mobile */

		let mobile = document.getElementById("mobile").value.trim();

		if (!/^[0-9]{10}$/.test(mobile)) {

			document.getElementById("mobileError").innerHTML = "Mobile number must contain exactly 10 digits";

			valid = false;

		} else {

			document.getElementById("mobileError").innerHTML = "";
		}

		/* Aadhaar */

		let aadhaar = document.getElementById("aadhaar").value.trim();

		if (aadhaar !== "" && !/^[0-9]{12}$/.test(aadhaar)) {

			document.getElementById("aadhaarError").innerHTML = "Aadhaar must contain exactly 12 digits";

			valid = false;

		} else {

			document.getElementById("aadhaarError").innerHTML = "";
		}

		/* PAN */

		let pan = document.getElementById("pan").value.trim();

		if (pan !== "" && !/^[A-Z]{5}[0-9]{4}[A-Z]{1}$/.test(pan)) {

			document.getElementById("panError").innerHTML = "Enter a valid PAN number";

			valid = false;

		} else {

			document.getElementById("panError").innerHTML = "";
		}

		/* Email */

		let email = document.getElementById("email").value.trim();

		if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {

			document.getElementById("emailError").innerHTML = "Enter a valid email address";

			valid = false;

		} else {

			document.getElementById("emailError").innerHTML = "";
		}

		/* Password */

		let password = document.getElementById("password").value;

		if (password.length < 6) {

			document.getElementById("passwordError").innerHTML = "Password must contain at least 6 characters";

			valid = false;

		} else {

			document.getElementById("passwordError").innerHTML = "";
		}

		/* Confirm Password */

		let confirmPassword = document.getElementById("confirmPassword").value;

		if (password !== confirmPassword) {

			document.getElementById("confirmPasswordError").innerHTML = "Passwords do not match";

			valid = false;

		} else {

			document.getElementById("confirmPasswordError").innerHTML = "";
		}

		return valid;
	}
</script>

</head>

<body>

	<nav>

		<div class="logo">BuyYourWebsite</div>

		<div>
			<a href="index.jsp">Home</a> 
			<a href="login.jsp">Login</a> 
			<a href="Contact.jsp">Contact</a>

		</div>

	</nav>


	<div class="container">

		<h1>Create Account</h1>

		<p class="subtitle">Register and start building your dream website
		</p>


		<form action="RegisterController" method="post">


			<!-- Username -->

			<div class="form-group">

				<label>Username</label> <input type="text" name="username"
					id="username" placeholder="Enter username" required>

			</div>


			<!-- First + Last Name -->

			<div class="form-row">

				<div class="form-group">

					<label>First Name</label> <input type="text" name="firstname"
						id="firstname" placeholder="Enter first name" required> <span
						class="error" id="firstnameError"></span>

				</div>


				<div class="form-group">

					<label>Last Name</label> <input type="text" name="lastname"
						id="lastname" placeholder="Enter last name"> <span
						class="error" id="lastnameError"></span>

				</div>

			</div>


			<!-- Email -->

			<div class="form-group">

				<label>Email</label> <input type="text" name="email" id="email"
					placeholder="Enter email" required> <span class="error"
					id="emailError"></span>

			</div>


			<!-- Mobile -->

			<div class="form-group">

				<label>Mobile Number</label> <input type="text" name="mobile"
					id="mobile" placeholder="Enter 10 digit mobile number"
					maxlength="10" required> <span class="error"
					id="mobileError"></span>

			</div>


			<!-- Aadhaar + PAN -->

			<div class="form-row">

				<div class="form-group">

					<label>Aadhaar</label> <input type="text" name="aadhaar"
						id="aadhaar" placeholder="12 digit Aadhaar" maxlength="12">

					<span class="error" id="aadhaarError"></span>

				</div>


				<div class="form-group">

					<label>PAN</label> <input type="text" name="pan" id="pan"
						placeholder="ABCDE1234F" maxlength="10"> <span
						class="error" id="panError"></span>

				</div>

			</div>


			<!-- Password -->

			<div class="form-row">

				<div class="form-group">

					<label>Password</label> <input type="password" name="password"
						id="password" placeholder="Enter password" required> <span
						class="error" id="passwordError"></span>

				</div>


				<div class="form-group">

					<label>Confirm Password</label> <input type="password"
						id="confirmPassword" placeholder="Confirm password" required>

					<span class="error" id="confirmPasswordError"></span>

				</div>

			</div>


			<button type="submit">Create Account</button>

		</form>


		<div class="login-link">

			Already have an account? <a href="login.jsp"> Login here </a>

		</div>

	</div>

</body>
</html>