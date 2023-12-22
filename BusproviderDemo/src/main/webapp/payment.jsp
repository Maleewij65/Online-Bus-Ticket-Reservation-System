
<%@page import="util.Constants"%>
<%
String price = "0";
String bookingId = "null";
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
Connection con = new DBConnection().getConnection();
Statement stmt = con.createStatement();

String user_id = (String) session.getAttribute("user_id");

String id = request.getParameter("id");
if (id != null && !id.isEmpty()) {
	ResultSet rs = stmt.executeQuery("SELECT * FROM booking WHERE id=" + id);
	if (rs.next()) {
		int ad = rs.getInt("adult_count");
		int ch = rs.getInt("child_count");
		int p = (Constants.ADULT_PRICE * ad) + (Constants.CHILD_PRICE * ch);
		price = String.valueOf(p);
		bookingId = rs.getString("id");
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
<body id="admin">
	<jsp:include page="_navigation.jsp" />
	<div class="container-fluid pt-3">
		<div class="row">
			<div class="col-4 mx-auto">
				<div class="data-wrap p-3 d-block">
					<form action="payment" method="post" onsubmit="return validate()">
						<input type="hidden" name="price" value="<%=price%>"> <input
							type="hidden" name="booking_id" value="<%=bookingId%>">
						<div class="mb-3">
							<label for="" class="form-label">Select Payment Method</label> <select
								class="form-select" aria-label="" name="busId">
								<option selected>--SELECT--</option>

								<option value="Visa">Visa</option>
								<option value="MasterCard">MasterCard</option>
							</select>
						</div>
						<div class="mb-3">
							<label class="form-label">Card Number</label> <input id="ele_2"
								type="text" class="form-control" placeholder="Card Number">
						</div>
						<div class="mb-3">
							<label class="form-label">Card Holder Name</label> <input
								id="ele_5" type="text" class="form-control"
								placeholder="Card Holder Name">
						</div>
						<div class="row mb-3">
							<div class="col">
								<label class="form-label">Expiry Date (Month/Year)</label> <input
								id="ele_3" type="text" class="form-control" placeholder="01/23">
							</div>
							<div class="col">
								<label class="form-label">CVV</label> <input id="ele_4"
								type="text" class="form-control" placeholder="***">
							</div>
						</div>
						<div class="col d-flex align-items-end justify-content-end">
							<button class="btn btn-primary" type="submit">Pay</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
function validate() {
    let paymentMethod = document.querySelector("select[name='busId']").value;
    let cardNumber = document.querySelector("input[id='ele_2']").value;
    let cardHolderName = document.querySelector("input[id='ele_5']").value;
    let expiryDate = document.querySelector("input[id='ele_3']").value;
    let cvv = document.querySelector("input[id='ele_4']").value;

    // Regular expressions for validating card number, expiry date, and CVV
    const cardNumberRegex = /^\d{16}$/; // 16-digit card number
    const expiryDateRegex = /^(0[1-9]|1[0-2])\/\d{2}$/; // MM/YY format
    const cvvRegex = /^\d{3}$/; // 3-digit CVV

    if (paymentMethod === "--SELECT--") {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "Please select a payment method!",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    if (!cardNumberRegex.test(cardNumber)) {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "Please enter a valid 16-digit card number!",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    if (cardHolderName.trim() === "") {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "Please enter the cardholder name!",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    if (!expiryDateRegex.test(expiryDate)) {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "Expiry date format is invalid! (e.g., 01/23)",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    if (!cvvRegex.test(cvv)) {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "Please enter a valid 3-digit CVV!",
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