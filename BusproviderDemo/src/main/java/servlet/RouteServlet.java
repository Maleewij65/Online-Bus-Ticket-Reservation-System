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

@WebServlet("/route")
public class RouteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Connection con = new DBConnection().getConnection();
	PreparedStatement pst;
	ResultSet rs;
	int row;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
		try {
			String id = req.getParameter("id");
			String departure = req.getParameter("departure");
			String arrival = req.getParameter("arrival");
			double price = Double.parseDouble(req.getParameter("price"));
			String duration = req.getParameter("duration");

			if (id.equals("null")) {
				pst = con.prepareStatement(Constants.INSERT_ROUTE);
				pst.setString(1, departure);
				pst.setString(2, arrival);
				pst.setDouble(3, price);
				pst.setString(4, duration);
			} else {
				pst = con.prepareStatement(Constants.UPDATE_ROUTE);
				pst.setString(1, departure);
				pst.setString(2, arrival);
				pst.setDouble(3, price);
				pst.setString(4, duration);
				pst.setString(5, id);
			}

			row = pst.executeUpdate();
			rsp.sendRedirect("route.jsp"); // Redirect to the appropriate page
		} catch (SQLException ex) {
			System.err.print(ex.getMessage());
		}
	}
}
