
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
			<div class="col-12">

				<div class="data-table-wrap">
					<a class="btn btn-primary mb-3" href="manageBus.jsp">Add New
						Bus</a>
					<div class="table-wrap">
						<table class="table table-hover">
							<tr>
								<th>ID</th>
								<th>Bus Name</th>
								<th>Start Location</th>
								<th>Destination</th>
								<th>Departure Time</th>
								<th>License Info</th>
								<th>Registration No</th>
								<th>Number Plate</th>
								<th>Action</th>
							</tr>
							<%
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT * FROM buses");

							while (rs.next()) {
								out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("name") + "</td><td>"
								+ rs.getString("start_location") + "</td><td>" + rs.getString("destination") + "</td><td>"
								+ rs.getString("departure_time") + "</td><td>" + rs.getString("license_info") + "</td><td>"
								+ rs.getString("registration_no") + "</td><td>" + rs.getString("number_plate")
								+ "</td><td><a class=\"btn btn-warning me-3 py-0\" href=\"manageBus.jsp?id=" + rs.getString("id")
								+ "\">Edit</a><button class=\"btn btn-danger py-0\" onclick=\"deleteBus(" + rs.getString("id")
								+ ")\">Delete</a></td></tr>");
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
	<script>
            function deleteBus(x) {
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
                        document.location.href = "bus-delete?id=" + x;
                    }
                })
            }

        </script>

</body>
</html>
