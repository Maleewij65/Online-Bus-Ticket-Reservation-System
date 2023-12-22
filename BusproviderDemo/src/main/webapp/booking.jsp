
<%@page import="util.Constants"%>
<%
if ((session.getAttribute("user_role") == null)) {
	response.sendRedirect("index.jsp");
} else if (session.getAttribute("user_role").equals("ADMIN")) {
	response.sendRedirect("index.jsp");
}
String user_id = (String) session.getAttribute("user_id");
%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
Connection con = new DBConnection().getConnection();
Statement stmt = con.createStatement();
ResultSet busRs = stmt.executeQuery("SELECT * FROM buses");
%>
<!DOCTYPE html>
<html>
<head>
<title>Event Manager</title>
<jsp:include page="_header.jsp" />
</head>
<body id="booking">
	<jsp:include page="_navigation.jsp" />
	<div class="container-fluid pt-3">
		<div class="row">
			<div class="col-4 mx-auto">
				<div class="data-wrap p-3 d-block">

					<form action="booking" method="post" onsubmit="return validate()">
						<input type="hidden" name="id" value="null"> <input
							type="hidden" name="price" value="0" id="price"> <input
							type="hidden" name="userId" value="<%=user_id%>">
						<div class="mb-3">
							<label for="" class="form-label">Select a Bus</label> <select
								class="form-select" aria-label="" name="busId">
								<option selected>--SELECT--</option>
								<%
								while (busRs.next()) {
								%>
								<option value="<%=busRs.getString("id")%>">
									<%=busRs.getString("name")%>
								</option>
								<%
								}
								%>
							</select>
						</div>

						<div class="row mb-3">
							<div class="col">
								<label for="" class="form-label">Origin</label> <input
									type="text" class="form-control" id="origin" placeholder=""
									name="origin">
							</div>
							<div class="col">
								<label for="" class="form-label">Destination</label> <input
									type="text" class="form-control" id="destination"
									placeholder="" name="destination">
							</div>
						</div>

						<div class="row mb-3">
							<div class="col">
								<label for="" class="form-label">Adult Count</label> <input
									type="number" class="form-control" id="adult_count"
									placeholder="" name="adult_count" onchange="updateValue()"
									min="0" value="0">
							</div>
							<div class="col">
								<label for="" class="form-label">Child Count</label> <input
									type="number" class="form-control" id="child_count"
									placeholder="" name="child_count" onchange="updateValue()"
									min="0" value="0">
							</div>
						</div>
						<div class="row mb-3">
							<div class="col">
								<div class="mb-3">
									<label for="" class="form-label">Date</label> <input
										type="date" class="form-control" id="date" placeholder=""
										name="date">
								</div>
							</div>
							<div class="col">
								<label for="" class="form-label">Total Payment</label> <input
									type="number" class="form-control" id="total_payment"
									placeholder="" readonly>
							</div>
						</div>


						<div class="col d-flex align-items-end justify-content-end">
							<button class="btn btn-primary" type="submit">Submit</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function updateValue() {
			let priceV = document.getElementById('price');
			let totalPayment = document.getElementById('total_payment');
			let ad = document.getElementById('adult_count').value;
			let ch = document.getElementById('child_count').value;

			const adV =<%=Constants.ADULT_PRICE%>;
			const chV =<%=Constants.CHILD_PRICE%>;

			let total = (parseInt(ad) * parseInt(adV)) + (parseInt(ch) * parseInt(chV));
			priceV.value = total;
			totalPayment.value = total;

		}

		function validate() {
			let busId = document.querySelector("select[name='busId']").value;
			let origin = document.querySelector("input[name='origin']").value;
			let destination = document
					.querySelector("input[name='destination']").value;
			let adultCount = document
					.querySelector("input[name='adult_count']").value;
			let childCount = document
					.querySelector("input[name='child_count']").value;
			let date = document.querySelector("input[name='date']").value;

			if (busId === "--SELECT--") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please select a bus!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (origin.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter the origin!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (destination.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter the destination!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (adultCount < 1 || isNaN(adultCount)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter a valid number of adults!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (childCount < 0 || isNaN(childCount)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please enter a valid number of children!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (date.trim() === "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "Please select a date!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
		    var today = new Date().toISOString().slice(0, 10);
		    var selectedDate = date;

		    if (selectedDate < today) {
		        Swal.fire({
		            title: 'Invalid Date',
		            text: 'Please select a date today or onwards.',
		            icon: 'warning',
		            confirmButtonColor: '#3085d6',
		            confirmButtonText: 'OK'
		        });
		        return false;
		    }
			return true;
		}
	</script>
</body>
</html>