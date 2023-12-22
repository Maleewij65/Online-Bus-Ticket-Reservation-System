
<%
if ((session.getAttribute("user_role") == null)) {
	response.sendRedirect("index.jsp");
} else if (session.getAttribute("user_role").equals("USER")) {
	response.sendRedirect("index.jsp");
}
%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
Connection con = new DBConnection().getConnection();
%>
<!DOCTYPE html>
<html>
<head>
<title>Bus Manager</title>
<jsp:include page="_header.jsp" />
</head>
<body id="admin">
	<jsp:include page="_navigation.jsp" />
	<div class="container mt-5">
		<div class="row">
			<div class="col-12 mx-auto">
				<div class="data-table-wrap">

					<div class="table-wrap">
						<table class="table table-hover">
							<tr>
								<th>ID</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email Address</th>
								<th>Mobile</th>
							</tr>
							<%
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT * FROM users");

							while (rs.next()) {
								out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
								+ "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td></tr>");
							}

							rs.close();
							stmt.close();
							con.close();
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
