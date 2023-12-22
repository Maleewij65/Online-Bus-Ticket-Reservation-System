
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
								<th>Bus Id</th>
								<th>Origin</th>
								<th>Destination</th>
								<th>Adults</th>
								<th>Children</th>
								<th>Date</th>
								<th>User Id</th>
								<th>Payment Id</th>
								<th>Price</th>
								<th>Paid Date</th>
							</tr>
							<%
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery(
									"SELECT a.*,b.id AS payment_id,b.price,b.paid_date FROM booking a LEFT JOIN payment b ON a.id = booking_id");

							while (rs.next()) {
								out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
								+ "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td><td>" + rs.getString(6)
								+ "</td><td>" + rs.getString(7) + "</td><td>" + rs.getString(8) + "</td><td>" + rs.getString(9)
								+ "</td><td>" + rs.getString(10) + "</td><td>" + rs.getString(11) + "</td></tr>");
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
