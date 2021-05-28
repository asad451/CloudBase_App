<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

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
				class="w3-bar-item w3-button w3-hover-white">Home</a> <a
				href="#showcase" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">All Assignments</a> <a
				href="#services" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">Due This Week</a> <a
				href="#designers" onclick="w3_close()"
				class="w3-bar-item w3-button w3-hover-white">Done</a>
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

			<form action="index.jsp">
				<button
					class="w3-button w3-white w3-border w3-border-green w3-round-large login"
					style="float: right;">Log Out</button>
			</form>

			<br> <br>

			<p style="color: green;">WELCOME !</p>
			<h1 class="w3-jumbo">
				<b>Assignment Reminder</b>
			</h1>

			<h1 class="w3-xxxlarge w3-text-blue">
				<b>All Assignments</b>
			</h1>

			<button
				onclick="document.getElementById('id01').style.display='block'"
				class="w3-button w3-white w3-border w3-border-blue w3-round-large"
				style="float: right;">Add Assignment</button>
			<hr style="width: 50px; border: 5px solid lightblue" class="w3-round">
			<p><%=(request.getAttribute("error") == null)
					? ""
					: request.getAttribute("error")%></p>
		</div>



		<%
			String id = request.getParameter("idassignment");
			//String user_name = request.getParameter("userName");
		%>
		<%
			String driver = "com.mysql.jdbc.Driver";
			String URL = "jdbc:mysql://localhost:3306/";
			String db = "reminder";
			String user = "root";
			String password = "asad451";

			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
		%>

		<div class="w3-row-padding">
			<ul class="w3-ul w3-card-4" style="width: 50%">

				<%
				
				String usernam = (String)request.getSession().getAttribute("userName");
				System.out.println(usernam);
				
					try {
						connection = DriverManager.getConnection(
								URL + db, user, password);
						statement = connection.createStatement();
						//String sql = "SELECT * FROM assignment where unam="+usernam;
						PreparedStatement statement2 = connection.prepareStatement("select * from assignment where unam = ?");    
						statement2.setString(1, usernam);    
						ResultSet resultSet2 = statement2.executeQuery();
						

						//resultSet = statement.executeQuery(sql);
						while (resultSet2.next()) {
				%>


				<!-- All Assignments -->
				<li><a
					href="info.jsp?code=<%=resultSet2.getString("modulecode")%>&title=<%=resultSet2.getString("moduletitle")%>&date=<%=resultSet2.getString("duedate")%>&descr=<%=resultSet2.getString("assignmentdesc")%>"><%=resultSet2.getString("modulecode")%>:
						<%=resultSet2.getString("moduletitle")%></a></li>

				<%
					}

					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</ul>
		</div>

		<!-- Due This Week -->
		<div class="w3-container" id="services" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-blue">
				<b>Due This Week.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid lightblue" class="w3-round">
			<ul class="w3-ul w3-card-4" style="width: 50%">

				<%
					try {

						PreparedStatement statement3 = connection.prepareStatement("SELECT * FROM assignment WHERE unam = ? and duedate >= curdate() + INTERVAL DAYOFWEEK(curdate())-1 DAY AND duedate < curdate() + INTERVAL DAYOFWEEK(curdate())+6 DAY");
						statement3.setString(1, usernam);
						ResultSet resultSet3 = statement3.executeQuery();

						while (resultSet3.next()) {
				%>
				<li><a
					href="info.jsp?code=<%=resultSet3.getString("modulecode")%>&title=<%=resultSet3.getString("moduletitle")%>&date=<%=resultSet3.getString("duedate")%>&descr=<%=resultSet3.getString("assignmentdesc")%>"><%=resultSet3.getString("modulecode")%>:
						<%=resultSet3.getString("moduletitle")%></a></li>
				<%
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
			</ul>
		</div>



		<!-- Done -->
		<div class="w3-container" id="designers" style="margin-top: 75px">
			<h1 class="w3-xxxlarge w3-text-blue">
				<b>Done.</b>
			</h1>
			<hr style="width: 50px; border: 5px solid lightblue" class="w3-round">
			<ul class="w3-ul w3-card-4" style="width: 50%">
				<%
					try {
					
					
						PreparedStatement statement4 = connection.prepareStatement("SELECT * FROM assignment WHERE unam = ? and duedate < curdate() ");
						statement4.setString(1, usernam);
						ResultSet resultSet4 = statement4.executeQuery();

						//resultSet = statement.executeQuery(sql);
						while (resultSet4.next()) {
				%>
				<li><%=resultSet4.getString("modulecode")%>:<%=resultSet4.getString("moduletitle")%></li>

				<%
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		%>

			</ul>
		</div>

		<!-- Add Assingment Modal -->

		<div id="id01" class="w3-modal">
			<div class="w3-modal-content">
				<header class="w3-container w3-blue">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
					<h2>Add Assignment</h2>
				</header>

				<div class="w3-container">
					<form action="AddAssignment" name="form" method="post"
						class="w3-container w3-card-4">


						<input class="w3-input w3-animate-input" type="text"
							style="width: 135px" name="mcode" placeholder="Module Code"><br>
						<input class="w3-input w3-animate-input" type="text"
							style="width: 135px" name="mtitle" placeholder="Module Title"><br>
						<input class="w3-input w3-animate-input" type="text"
							style="width: 135px" name="desc" placeholder="Description"><br>
						<input type="text" hidden="true" name="un"
							value=<%= (String)request.getSession().getAttribute("userName") %>>


						<label>Due Date</label> <input type="datetime-local"
							id="meeting-time" name="date" value="2018-06-12 19:30"
							min="2018-06-07T00:00" max="2020-06-14T00:00"><br> <br>

						<button
							class="w3-button w3-white w3-border w3-border-green w3-round-large"
							style="margin-left: 21pc; margin-top: 1.4pc;">Submit</button>

					</form>

				</div>

			</div>
		</div>
		<!-- End Modal -->


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
<!-- This Javascript is part of the template -->
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
