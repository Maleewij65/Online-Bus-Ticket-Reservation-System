
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
String id = null, name = "", start_location = "", destination = "", departure_time = "", license_info = "",
		registration_no = "", number_plate = "";
if (request.getParameter("id") != null) {
	id = request.getParameter("id");
	Connection con = new DBConnection().getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM buses WHERE id='" + id + "'");

	if (rs.next()) {
		id = rs.getString("id");
		name = rs.getString("name");
		start_location = rs.getString("start_location");
		destination = rs.getString("destination");
		departure_time = rs.getString("departure_time");
		license_info = rs.getString("license_info");
		registration_no = rs.getString("registration_no");
		number_plate = rs.getString("number_plate");
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
					<form method="POST" action="bus" onsubmit="return validate()">
						<input type="hidden" name="id" value="<%=id%>">
						<div class="mb-3">
							<label class="form-label">Bus Name</label> <input id="ele_1"
								type="text" class="form-control" value="<%=name%>" name="name"
								placeholder="Enter the bus name">
						</div>

						<div class="row mb-3">
							<div class="col">
								<label class="form-label">Start Location</label> <input
									id="ele_2" type="text" class="form-control"
									value="<%=start_location%>" name="start_location"
									placeholder="Enter the start location">
							</div>
							<div class="col">
								<label class="form-label">Destination</label> <input id="ele_3"
									type="text" class="form-control" value="<%=destination%>"
									name="destination" placeholder="Enter the destination">
							</div>
						</div>

						<div class="row mb-3">
							<div class="col">
								<label class="form-label">Departure Time</label> <input
									id="ele_4" type="time" class="form-control"
									value="<%=departure_time%>" name="departure_time"
									placeholder="Enter the departure time">
							</div>
							<div class="col">
								<label class="form-label">License Info</label> <input id="ele_5"
									type="text" class="form-control" value="<%=license_info%>"
									name="license_info" placeholder="Enter the license info">
							</div>
						</div>
						<div class="row mb-3">
							<div class="col">
								<label class="form-label">Registration No</label> <input
									id="ele_6" type="text" class="form-control"
									value="<%=registration_no%>" name="registration_no"
									placeholder="Enter the registration number">
							</div>
							<div class="col">
								<label class="form-label">Number Plate</label> <input id="ele_7"
									type="text" class="form-control" value="<%=number_plate%>"
									name="number_plate" placeholder="Enter the number plate">
							</div>
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
			let ele_5 = document.getElementById("ele_5").value;
			let ele_6 = document.getElementById("ele_6").value;
			let ele_7 = document.getElementById("ele_7").value;

			const licenseInfoRegex = /^[A-Z]{3}-\d{2}$/;
			const registrationNoRegex = /^\d{6}[A-Z]{2}$/;
			const numberPlateRegex = /^[A-Z]{3}-\d{4}$/;

			if (ele_1.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter the bus name!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (ele_2.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter the start location!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (ele_3.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter the destination!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (ele_4.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter the departure time!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (!licenseInfoRegex.test(ele_5)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "License Info format is invalid! (e.g., ABC-12)",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (!registrationNoRegex.test(ele_6)) {
				Swal
						.fire({
							title : 'Invalid or Empty Data',
							text : "Registration No format is invalid! (e.g., 123456AB)",
							icon : 'warning',
							confirmButtonColor : '#3085d6',
							confirmButtonText : 'OK'
						});
				return false;
			}
			if (!numberPlateRegex.test(ele_7)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Number Plate format is invalid! (e.g., ABC-1234)",
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
