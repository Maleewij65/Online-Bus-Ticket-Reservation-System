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

@WebServlet("/bus")
public class BusServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Connection con = new DBConnection().getConnection();
	PreparedStatement pst;
	ResultSet rs;
	int row;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
		try {
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String startLocation = req.getParameter("start_location");
			String destination = req.getParameter("destination");
			String departureTime = req.getParameter("departure_time");
			String licenseInfo = req.getParameter("license_info");
			String registrationNo = req.getParameter("registration_no");
			String numberPlate = req.getParameter("number_plate");

			if (id.equals("null")) {
				pst = con.prepareStatement(Constants.INSERT_BUS);
				pst.setString(1, name);
				pst.setString(2, startLocation);
				pst.setString(3, destination);
				pst.setString(4, departureTime);
				pst.setString(5, licenseInfo);
				pst.setString(6, registrationNo);
				pst.setString(7, numberPlate);
			} else {
				pst = con.prepareStatement(Constants.UPDATE_BUS);
				pst.setString(1, name);
				pst.setString(2, startLocation);
				pst.setString(3, destination);
				pst.setString(4, departureTime);
				pst.setString(5, licenseInfo);
				pst.setString(6, registrationNo);
				pst.setString(7, numberPlate);
				pst.setString(8, id);
			}

			row = pst.executeUpdate();
			rsp.sendRedirect("bus.jsp");
		} catch (SQLException ex) {
			System.err.print(ex.getMessage());
		}
	}

}
