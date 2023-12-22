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

@WebServlet("/route-delete")
public class RouteDeleteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Connection con = new DBConnection().getConnection();
	PreparedStatement pst;
	ResultSet rs;
	int row;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
		try {
			String id = req.getParameter("id");

			if (!id.equals("null")) {
				pst = con.prepareStatement(Constants.DELETE_ROUTE);
				pst.setString(1, id);
				row = pst.executeUpdate();
			}

			rsp.sendRedirect("route.jsp"); // Redirect to the appropriate page
		} catch (SQLException ex) {
			System.err.print(ex.getMessage());
		}
	}
}
