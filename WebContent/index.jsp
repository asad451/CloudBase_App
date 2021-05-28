<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<title>Assignment Reminder</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">

<style>
body,h1,h2,h3,h4,h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}

.login {
	margin-top: -40px;
}

a {
	text-decoration: none;
}
</style>

<body>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding"
		style="z-index: 3; width: 300px; font-weight: bold;" id="mySidebar">
		<br> <a href="javascript:void(0)" onclick="w3_close()"
			class="w3-button w3-hide-large w3-display-topleft"
			style="width: 100%; font-size: 22px">Close Menu</a>
		<div class="w3-container">
			<h3 class="w3-padding-64">
				<b>Assignment<br>Reminder
				</b>
			</h3>
		</div>
		<div class="w3-bar-block">
			<a href="#" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">Home</a>
		</div>
	</nav>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-blue w3-xlarge w3-padding">
		<a href="javascript:void(0)" class="w3-button w3-red w3-margin-right"
			onclick="w3_open()">☰</a> <span>Assignment Reminder</span>
	</header>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 340px; margin-right: 40px">

		<!-- Header -->
		<div class="w3-container" style="margin-top: 80px" id="showcase">
			<button
				onclick="document.getElementById('id03').style.display='block'"
				class="w3-button w3-white w3-border w3-border-red w3-round-large login"
				style="float: right; margin-left: 20px;">Sign Up</button>
			<button
				onclick="document.getElementById('id02').style.display='block'"
				class="w3-button w3-white w3-border w3-border-green w3-round-large login"
				style="float: right;">Login</button>
			<br> <br>

			<h1 class="w3-jumbo">
				<b>Assignment Reminder</b>
			</h1>
			<h1 class="w3-xxlarge w3-text-blue">
				<b>Log In to Manage your Assignments</b>
			</h1>

			<hr style="width: 50px; border: 5px solid lightblue" class="w3-round">
			<p style="color: red;"><%=(request.getAttribute("error") == null)
					? ""
					: request.getAttribute("error")%></p>
			<p style="color: red;"><%=(request.getAttribute("message") == null) ? "" : request
					.getAttribute("message")%></p>
		</div>

		<div class="w3-container"
			style="background-image: url('bg1.jpg'); height: 470px;"></div>



		<!-- Login Modal -->

		<div id="id02" class="w3-modal">
			<div class="w3-modal-content">
				<header class="w3-container w3-blue">
					<span
						onclick="document.getElementById('id02').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
					<h2>Login</h2>
				</header>

				<div class="w3-container">
					<form action="LoginServlet" name="form" method="post"
						class="w3-container">

						<p style="margin-left: 15pc;">
							<input class="w3-input" type="text" name="uname"
								placeholder="username" style="width: 50%">
						</p>
						<p style="margin-left: 15pc;">
							<input class="w3-input" type="password" name="password"
								placeholder="password" style="width: 50%">
						</p>
						<button
							class="w3-button w3-white w3-border w3-border-green w3-round-large"
							style="margin: 1.4pc 0 1.5pc 21pc;">Submit</button>

					</form>

				</div>

			</div>
		</div>

		<!-- end modal -->



		<!-- Sign Up Modal -->

		<div id="id03" class="w3-modal">
			<div class="w3-modal-content">
				<header class="w3-container w3-blue">
					<span
						onclick="document.getElementById('id03').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
					<h2>Login</h2>
				</header>

				<div class="w3-container">
					<form action="RegisterUserServlet" name="form" method="post"
						class="w3-container">

						<p style="margin-left: 15pc;">
							<input class="w3-input" type="text" required="true" name="name"
								placeholder="name" style="width: 50%">
						</p>
						<p style="margin-left: 15pc;">
							<input class="w3-input" type="text" required="true" name="uname"
								placeholder="username" style="width: 50%">
						</p>
						<p style="margin-left: 15pc;">
							<input class="w3-input" type="password" required="true"
								name="password" placeholder="password" style="width: 50%">
						</p>
						<button
							class="w3-button w3-white w3-border w3-border-green w3-round-large"
							style="margin: 1.4pc 0 1.5pc 21pc;">Submit</button>

					</form>

				</div>

			</div>
		</div>

		<!-- end modal -->



		<!-- End page content -->
	</div>

	<!-- W3.CSS Container -->
	<div class="w3-light-grey w3-container w3-padding-32"
		style="margin-top: 75px; padding-right: 58px">
		<p class="w3-right">
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a>
		</p>
	</div>

	<!--This Javascript is part of the template -->
	<script>
		// Script to open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}

		// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		}
	</script>

</body>
</html>
