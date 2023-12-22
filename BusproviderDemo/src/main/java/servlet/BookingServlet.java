package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Constants;
import util.DBConnection;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  Connection con = new DBConnection().getConnection();
  PreparedStatement pst;
  ResultSet rs;
  int row;

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse rsp)
    throws IOException, ServletException {
    try {
      String id = req.getParameter("id");
      String busId = req.getParameter("busId");
      String origin = req.getParameter("origin");
      String destination = req.getParameter("destination");
      String adultCount = req.getParameter("adult_count");
      String childCount = req.getParameter("child_count");
      String date = req.getParameter("date");
      String userId = req.getParameter("userId");

      if (id.equals("null")) {
        pst = con.prepareStatement(Constants.INSERT_BOOKING, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, Integer.parseInt(busId));
        pst.setString(2, origin);
        pst.setString(3, destination);
        pst.setInt(4, Integer.parseInt(adultCount));
        pst.setInt(5, Integer.parseInt(childCount));
        pst.setString(6, date);
        pst.setInt(7, Integer.parseInt(userId));
      } else {
        pst = con.prepareStatement(Constants.UPDATE_BOOKING, Statement.RETURN_GENERATED_KEYS);
        pst.setInt(1, Integer.parseInt(busId));
        pst.setString(2, origin);
        pst.setString(3, destination);
        pst.setInt(4, Integer.parseInt(adultCount));
        pst.setInt(5, Integer.parseInt(childCount));
        pst.setString(6, date);
        pst.setInt(7, Integer.parseInt(userId));
        pst.setInt(8, Integer.parseInt(id));
      }
      int bookingId= 0;
      row = pst.executeUpdate();
      if (row > 0) {
        ResultSet generatedKeys = pst.getGeneratedKeys();
        bookingId = -1;
        if (generatedKeys.next()) {
          bookingId = generatedKeys.getInt(1);
        }
      }
      rsp.sendRedirect("payment.jsp?id="+String.valueOf(bookingId));
    } catch (SQLException ex) {
      System.err.print(ex.getMessage());
    }
  }
}
