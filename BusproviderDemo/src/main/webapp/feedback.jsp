
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
String id = null, feedback_id = null, comment = "", user_id = "", created_at = "";
if (request.getParameter("id") != null) {
	id = request.getParameter("id");
	user_id = request.getParameter("id");
	Connection con = new DBConnection().getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM feedback WHERE user_id='" + id + "'");

	if (rs.next()) {
		id = rs.getString("id");
		feedback_id = rs.getString("id");
		comment = rs.getString("comment");
		user_id = rs.getString("user_id");
		created_at = rs.getString("created_at");
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
<body id="feedback">
	<jsp:include page="_navigation.jsp" />
	<div class="container-fluid pt-3">
		<div class="row">
			<div class="col-4 mx-auto">
				<div class="data-wrap p-3">
					<form method="POST" action="feedback" onsubmit="return validate()">
						<input type="hidden" name="id" value="<%=feedback_id%>"> <input
							type="hidden" name="user_id" value="<%=user_id%>">
						<div class="mb-3">
							<label for="comment" class="form-label">Feedback Comment</label>
							<textarea class="form-control" id="comment" name="comment"
								rows="5" placeholder="Enter your feedback comment"><%=comment%></textarea>
						</div>
						<div class="col-12 d-flex justify-content-end ">
							<button type="submit" class="btn btn-primary">Save</button>
							<button type="button" class="btn btn-danger ms-3"
								onclick="deleteFeedback(<%=feedback_id%>)">Delete</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	function validate() {
	    let comment = document.getElementById("comment").value;

	    if (comment.trim() === "") {
	        Swal.fire({
	            title: 'Invalid or Empty Data',
	            text: "Please enter your feedback comment!",
	            icon: 'warning',
	            confirmButtonColor: '#3085d6',
	            confirmButtonText: 'OK'
	        });
	        return false;
	    }

	    return true;
	}
            function deleteFeedback(x) {
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
                        document.location.href = "feedback-delete?id=" + x;
                    }
                })
            }

        </script>
</body>
</html>
