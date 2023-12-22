package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Constants;
import util.DBConnection;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Connection con = new DBConnection().getConnection();
	PreparedStatement pst;
	ResultSet rs;
	int row;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
		try {
			String id = req.getParameter("id");
			String comment = req.getParameter("comment");
			String userId = req.getParameter("user_id");

			if (id.equals("null")) {
				pst = con.prepareStatement(Constants.INSERT_FEEDBACK);
				pst.setString(1, comment);
				pst.setString(2, userId);
			} else {
				pst = con.prepareStatement(Constants.UPDATE_FEEDBACK);
				pst.setString(1, comment);
				pst.setString(2, userId);
				pst.setString(3, id);
			}

			row = pst.executeUpdate();
			rsp.sendRedirect("feedback.jsp?id=" + userId); // Redirect to the appropriate page
		} catch (SQLException ex) {
			System.err.print(ex.getMessage());
		}
	}
}
