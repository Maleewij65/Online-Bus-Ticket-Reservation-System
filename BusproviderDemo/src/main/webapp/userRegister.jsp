
<%
if ((session.getAttribute("user_email") != null)) {
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Event Manager</title>
<jsp:include page="_header.jsp" />
</head>
<body id="login-page">
	<jsp:include page="_navigation.jsp" />

	<div class="login-wrap">
		<form action="user-register" method="POST"
			onsubmit="return validate()">
			<div class="title">Register</div>
			<div class="form-floating mb-3">
				<input type="email" class="form-control" name="email"
					placeholder="name@example.com" id="email"> <label
					for="floatingInput">Email address</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" name="password"
					placeholder="Password" id="password"> <label
					for="floatingPassword">Password</label>
			</div>
			<div class="form-floating mb-3">
				<input id="first_name" type="text" class="form-control"
					name="first_name" placeholder="First Name"> <label
					for="floatinPassword">First Name</label>
			</div>
			<div class="form-floating mb-3">
				<input id="last_name" type="text" class="form-control"
					name="last_name" placeholder="Last Name"> <label
					for="">Last Name</label>
			</div>
			<div class="form-floating mb-3">
				<input id="mobile" type="text" class="form-control" name="mobile"
					placeholder="Mobile"> <label for="floatingPassword">Mobile</label>
			</div>
			<div class="col-12 d-flex justify-content-center ">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
			<div class="col-12 d-flex justify-content-center mt-2 a">
				Already registered ? &nbsp;<a href="userLogin.jsp">Log In</a>
			</div>
		</form>

	</div>
	<script>
		function validate() {
			let ele_1 = document.getElementById("email").value;
			let ele_2 = document.getElementById("password").value;
			let ele_3 = document.getElementById("first_name").value;
			let ele_4 = document.getElementById("last_name").value;
			let ele_5 = document.getElementById("mobile").value;

			const nameRegex = /^([A-Z a-z]{1,200})$/;
			const phoneRegex = /^([0-9]{10})$/;
			const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

			if (!emailRegex.test(ele_1)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "The email you entered is invalid or empty!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (ele_2 == "") {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "You must enter a password to continue!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (!nameRegex.test(ele_3)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "The first name you entered is invalid or empty!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (!nameRegex.test(ele_4)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "The last name you entered is invalid or empty!",
					icon : 'warning',
					confirmButtonColor : '#3085d6',
					confirmButtonText : 'OK'
				});
				return false;
			}
			if (!phoneRegex.test(ele_5)) {
				Swal.fire({
					title : 'Invalid or Empty Data',
					text : "The mobile you entered is invalid or empty!",
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
