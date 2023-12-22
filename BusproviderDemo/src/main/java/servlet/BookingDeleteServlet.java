package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Constants;
import util.DBConnection;

@WebServlet("/booking-delete")
public class BookingDeleteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        Connection con = new DBConnection().getConnection();
        PreparedStatement pst = null;

        try {
            String bookingId = req.getParameter("id");

            if (bookingId != null) {
                int bookingIdInt = Integer.parseInt(bookingId);
                pst = con.prepareStatement(Constants.DELETE_BOOKING);
                pst.setInt(1, bookingIdInt);
                pst.executeUpdate();
            }
            HttpSession session = req.getSession();
            String user = (String)  session.getAttribute("user_id");
            rsp.sendRedirect("userEdit.jsp?id="+ user);
        } catch (SQLException | NumberFormatException ex) {
            // Handle exceptions (e.g., log or display an error message)
            ex.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
