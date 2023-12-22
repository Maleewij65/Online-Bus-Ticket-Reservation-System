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
import javax.servlet.http.HttpSession;

import util.Constants;
import util.DBConnection;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Connection con = new DBConnection().getConnection();
	PreparedStatement pst;
	ResultSet rs;
	int row;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse rsp) throws ServletException, IOException {
		try {
			String price = req.getParameter("price");
			String bookingId = req.getParameter("booking_id");

			pst = con.prepareStatement(Constants.INSERT_PAYMENT);
			pst.setDouble(1, Double.parseDouble(price));
			pst.setInt(2, Integer.parseInt(bookingId));

			row = pst.executeUpdate();
			HttpSession session = req.getSession();
            String user = (String)  session.getAttribute("user_id");
            rsp.sendRedirect("userEdit.jsp?id="+ user);
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}
