
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
		<form action="admin-login" method="POST" onsubmit="return validate()">
			<div class="title">LOGIN</div>
			<div class="form-floating mb-3">
				<input type="email" class="form-control" name="email" id="email"
					placeholder="name@example.com"> <label for="floatingInput">Email
					address</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" name="password" id="password"
					placeholder="Password"> <label for="floatingPassword">Password</label>
			</div>
			<div class="col-12 d-flex justify-content-center ">
				<button type="submit" class="btn btn-primary">Login</button>
			</div>

		</form>

	</div>

	<script>
		function validate() {
			let ele_1 = document.getElementById("email").value;
			let ele_2 = document.getElementById("password").value;

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

			return true;
		}
	</script>
</body>
</html>
