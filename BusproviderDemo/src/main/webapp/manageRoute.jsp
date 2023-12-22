
<%
if ((session.getAttribute("user_role") == null)) {
	response.sendRedirect("index.jsp");
} else if (session.getAttribute("user_role").equals("USER")) {
	response.sendRedirect("index.jsp");
}
%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
String id = null, departure = "", arrival = "", price = "", duration = "";
if (request.getParameter("id") != null) {
	id = request.getParameter("id");
	Connection con = new DBConnection().getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM routes WHERE id='" + id + "'");

	if (rs.next()) {
		id = rs.getString("id");
		departure = rs.getString("departure");
		arrival = rs.getString("arrival");
		price = rs.getString("price");
		duration = rs.getString("duration");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Event Manager</title>
<jsp:include page="_header.jsp" />
</head>
<body id="admin">
	<jsp:include page="_navigation.jsp" />
	<div class="container mt-5">
		<div class="row">
			<div class="col-7 mx-auto">
				<div class="data-wrap p-3">
					<form method="POST" action="route" onsubmit="return validate()">
						<input type="hidden" name="id" value="<%=id%>">
						<div class="mb-3">
							<label class="form-label">Departure</label> <input id="ele_1"
								type="text" class="form-control" value="<%=departure%>"
								name="departure" placeholder="Enter the departure location">
						</div>
						<div class="mb-3">
							<label class="form-label">Arrival</label> <input id="ele_2"
								type="text" class="form-control" value="<%=arrival%>"
								name="arrival" placeholder="Enter the arrival location">
						</div>
						<div class="mb-3">
							<label class="form-label">Price</label> <input id="ele_3"
								type="text" class="form-control" value="<%=price%>" name="price"
								placeholder="Enter the price">
						</div>
						<div class="mb-3">
							<label class="form-label">Duration (Hours)</label> <input
								id="ele_4" type="number" class="form-control"
								value="<%=duration%>" name="duration"
								placeholder="Enter the duration">
						</div>

						<div class="col-12 d-flex justify-content-end ">
							<button type="submit" class="btn btn-primary">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validate() {
			let ele_1 = document.getElementById("ele_1").value;
			let ele_2 = document.getElementById("ele_2").value;
			let ele_3 = document.getElementById("ele_3").value;
			let ele_4 = document.getElementById("ele_4").value;

			// Regular expressions for validating price and duration
			const priceRegex = /^\d+(\.\d{1,2})?$/; // Allows for whole numbers and up to 2 decimal places
			const durationRegex = /^\d+(\.\d{1,2})?$/; // Allows for whole numbers and up to 2 decimal places

			if (ele_1.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter the departure location!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (ele_2.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter the arrival location!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (!priceRegex.test(ele_3)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Price format is invalid! (e.g., 123.45)",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (!durationRegex.test(ele_4)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Duration format is invalid! (e.g., 5.5)",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			return true;
		}
	</script>

</body>
</html>
