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

@WebServlet("/user")
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Connection con = new DBConnection().getConnection();
	PreparedStatement pst;
	ResultSet rs;
	int row;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
		try {
			String id = req.getParameter("id");
			String firstName = req.getParameter("first_name");
			String lastName = req.getParameter("last_name");
			String mobile = req.getParameter("mobile");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if (id.equals("null")) {
				pst = con.prepareStatement(Constants.INSERT_USER);
				pst.setString(1, firstName);
				pst.setString(2, lastName);
				pst.setString(3, mobile);
				pst.setString(4, email);
				pst.setString(5, password);
			} else {
				pst = con.prepareStatement(Constants.UPDATE_USER_NO_PASSWORD);
				pst.setString(1, firstName);
				pst.setString(2, lastName);
				pst.setString(3, mobile);
				pst.setString(4, id);
			}

			row = pst.executeUpdate();
			rsp.sendRedirect("userEdit.jsp?id=" + id);
		} catch (SQLException ex) {
			System.err.print(ex.getMessage());
		}
	}
}
