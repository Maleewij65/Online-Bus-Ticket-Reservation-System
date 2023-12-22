
<%
if ((session.getAttribute("user_email") != null)) {
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
<jsp:include page="_header.jsp" />
</head>
<body id="login-page">
	<jsp:include page="_navigation.jsp" />

	<div class="login-wrap">
		<form action="user-login" method="POST" autocomplete="off">
 <input autocomplete="false" name="hidden" type="text" style="display:none;">
			<div class="title">LOGIN</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" name="email"
					placeholder="name@example.com" id="email"> <label
					for="floatingInput" autocomplete="off">Email address</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" name="password"
					placeholder="Password" id="password"> <label
					for="floatingPassword">Password</label>
			</div>
			<div class="col-12 d-flex justify-content-center ">
				<button type="submit" class="btn btn-primary">Login</button>
			</div>
			<div class="col-12 d-flex justify-content-center mt-2 a">
				Still haven' an account ? &nbsp;<a href="userRegister.jsp"> Sign Up</a>
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
