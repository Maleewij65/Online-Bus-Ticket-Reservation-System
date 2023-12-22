
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
<title>Route Manager</title>
<jsp:include page="_header.jsp" />
</head>
<body id="admin">
	<jsp:include page="_navigation.jsp" />
	<div class="container mt-5">
		<div class="row">
			<div class="col-12">
	<div class="data-table-wrap">
		<a class="btn btn-primary mb-3" href="manageRoute.jsp">Add New
			Route</a>
		<div class="table-wrap">
			<table class="table table-hover">
				<tr>
					<th>ID</th>
					<th>Departure</th>
					<th>Arrival</th>
					<th>Price</th>
					<th>Duration</th>
					<th>Action</th>
				</tr>
				<%
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM routes");

				while (rs.next()) {
					out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("departure") + "</td><td>"
					+ rs.getString("arrival") + "</td><td>" + rs.getString("price") + "</td><td>"
					+ rs.getString("duration") + "</td><td><a class=\"btn btn-warning me-3 py-0\" href=\"manageRoute.jsp?id=" + rs.getString("id")
					+ "\">Edit</a><button class=\"btn btn-danger py-0\" onclick=\"deleteRoute(" + rs.getString("id")
					+ ")\">Delete</a></td></tr>");
				}

				rs.close();
				stmt.close();
				con.close();
				%>
			</table>
		</div></div></div></div>
	</div>
	<script>
            function deleteRoute(x) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.location.href = "route-delete?id=" + x;
                    }
                })
            }

        </script>

</body>
</html>
