
<%
if ((session.getAttribute("user_role") == null)) {
	response.sendRedirect("index.jsp");
} else if (session.getAttribute("user_role").equals("ADMIN")) {
	response.sendRedirect("index.jsp");
}
%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
String id = null, first_name = "", last_name = "", mobile = "", email = "", password = "";
if (request.getParameter("id") != null) {
	id = request.getParameter("id");
	Connection con = new DBConnection().getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE id='" + id + "'");

	if (rs.next()) {
		id = rs.getString("id");
		first_name = rs.getString("first_name");
		last_name = rs.getString("last_name");
		mobile = rs.getString("mobile");
		email = rs.getString("email");
	}
} else {
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Event Manager</title>
<jsp:include page="_header.jsp" />
</head>
<body id="edit-user">
	<jsp:include page="_navigation.jsp" />
	<div class="container-fluid pt-3">
		<div class="row">
			<div class="col-4">
				<div class="data-wrap p-3 d-block">
					<form method="POST" action="user" onsubmit="return validate()"
						class="mx-auto mt-3 mb-3">
						<input type="hidden" name="id" value="<%=id%>"> <input
							type="hidden" name="password" value="">
						<div class="mb-3">
							<label for="first_name" class="form-label">First Name</label> <input
								type="text" class="form-control" id="first_name"
								name="first_name" placeholder="Enter first name"
								value="<%=first_name%>">
						</div>
						<div class="mb-3">
							<label for="last_name" class="form-label">Last Name</label> <input
								type="text" class="form-control" id="last_name" name="last_name"
								placeholder="Enter last name" value="<%=last_name%>">
						</div>
						<div class="mb-3">
							<label for="mobile" class="form-label">Mobile Number</label> <input
								type="text" class="form-control" id="mobile" name="mobile"
								placeholder="Enter mobile number" value="<%=mobile%>">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="Enter email" value="<%=email%>" readonly>
						</div>

						<div class="col-12 d-flex justify-content-end ">

							<button type="submit" class="btn btn-primary me-3">Save</button>
							<button class="btn btn-danger" onclick="deleteUser(<%=id%>)">Delete
								Account</button>
						</div>
					</form>
				</div>

			</div>
			<div class="col-8">
				<div class="table-wrap">
					<table class="table table-hover">
						<tr>
							<th>Booking Id</th>
							<th>Booked Date</th>
							<th>Adults</th>
							<th>Children</th>
							<th>Bus Id</th>
							<th>Paid State</th>
							<th>Action</th>
						</tr>
						<%
						Connection con = new DBConnection().getConnection();
						Statement stmt = con.createStatement();
						String user_id = (String) session.getAttribute("user_id");
						ResultSet rs = stmt.executeQuery(
								"SELECT a.id,a.date,a.adult_count,a.child_count,a.busId,b.paid_date FROM booking a LEFT JOIN payment b ON a.id=b.booking_id WHERE a.userId="
								+ user_id);

						while (rs.next()) {
							String pay = (rs.getString(6) == null ? "Not Paid" : "Paid");
							String cancel = "<button class=\"btn btn-danger py-0\" onclick=\"deleteBooking(" + rs.getString(1)
							+ ")\">Cancel Booking</button>";
							String paid = "<a class=\"btn btn-warning ms-3 py-0\" href=\"payment.jsp?id=" + rs.getString(1) + "\">Pay</a>";

							out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
							+ "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td><td>" + pay + "</td><td>"
							+ (pay.equals("Not Paid") ? cancel + paid : "") + "</td></tr>");
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
	<script>
	function validate() {
	    let ele_1 = document.getElementById("first_name").value;
	    let ele_2 = document.getElementById("last_name").value;
	    let ele_3 = document.getElementById("mobile").value;
	    
	    const nameRegex = /^([A-Za-z]{1,200})$/;
	    const phoneRegex = /^([0-9]{10})/;
	    
	    if (!nameRegex.test(ele_1)) {
	        Swal.fire({
	            title: 'Invalid or Empty Data',
	            text: "The first name you entered is invalid or empty!",
	            icon: 'warning',
	            confirmButtonColor: '#3085d6',
	            confirmButtonText: 'OK'
	        });
	        return false;
	    }
	    if (!nameRegex.test(ele_2)) {
	        Swal.fire({
	            title: 'Invalid or Empty Data',
	            text: "The last name you entered is invalid or empty!",
	            icon: 'warning',
	            confirmButtonColor: '#3085d6',
	            confirmButtonText: 'OK'
	        });
	        return false;
	    }
	    if (!phoneRegex.test(ele_3)) {
	        Swal.fire({
	            title: 'Invalid or Empty Data',
	            text: "The mobile you entered is invalid or empty!",
	            icon: 'warning',
	            confirmButtonColor: '#3085d6',
	            confirmButtonText: 'OK'
	        });
	        return false;
	    }
	    return true;
	}
	
            function deleteBooking(x) {
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
                        document.location.href = "booking-delete?id=" + x;
                    }
                })
            }

        </script>
</body>
</html>
