
<%
boolean isLogged = false;
String user = "NULL";
String user_id = "NULL";
if (session.getAttribute("user_role") != null) {
	isLogged = true;
	if (session.getAttribute("user_role").equals("ADMIN")) {
		user = "ADMIN";
	} else {
		user = "USER";
		user_id = (String) session.getAttribute("user_id");
	}
}
%>
<nav class="navbar navbar-expand-lg fixed-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i class="bi bi-bus-front"></i> Neon Bus</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<%
				if (user.equals("ADMIN")) {
				%>
				<li class="nav-item"><a class="nav-link" href="bus.jsp">Manage
						Bus</a></li>
				<li class="nav-item"><a class="nav-link" href="route.jsp">Manage
						Route</a></li>
				<li class="nav-item"><a class="nav-link" href="bookings.jsp">View Bookings
						</a></li>
				<li class="nav-item"><a class="nav-link" href="user.jsp">View Users
						</a></li>
				<%
				} else if (user.equals("USER")) {
				%>
				<li class="nav-item"><a class="nav-link" href="booking.jsp">Book
						Ticket</a></li>
				<li class="nav-item"><a class="nav-link"
					href="userEdit.jsp?id=<%=user_id%>">My Account</a></li>
				<li class="nav-item"><a class="nav-link"
					href="feedback.jsp?id=<%=user_id%>">My Feedback</a></li>
				<%
				}
				%>
			</ul>
			<div class="d-flex">
				<%
				if (isLogged == true) {
				%>
				<a href="logout" class="btn btn-login">Logout</a>
				<%
				} else {
				%>
				<a href="userLogin.jsp" class="btn btn-login">User Login</a> <a
					href="adminLogin.jsp" class="btn btn-login ms-2">Admin Login</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
</nav>