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
import javax.servlet.http.HttpSession;
import util.DBConnection;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            Statement stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM admin WHERE email='" + email + "' AND password='" + password + "'");
            rs.last();
            int rowCount = rs.getRow();
            rs.first();

            if (rowCount == 1) {
                HttpSession session = req.getSession();
                session.setAttribute("user_email", rs.getString("email"));
                session.setAttribute("user_name", "Administrator");
                session.setAttribute("user_id", rs.getString("id"));
                session.setAttribute("user_role", "ADMIN");
            }
            rsp.sendRedirect("index.jsp");

        } catch (SQLException ex) {
        	System.err.print(ex.getMessage());
        }

    }
}
