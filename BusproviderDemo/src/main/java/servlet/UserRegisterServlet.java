package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import util.Constants;
import util.DBConnection;

@WebServlet("/user-register")
public class UserRegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String first_name = req.getParameter("first_name");
            String last_name = req.getParameter("last_name");
            String mobile = req.getParameter("mobile");

            Statement stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
            rs.last();
            int rowCount = rs.getRow();
            rs.first();

            if (rowCount == 1) {
                rsp.sendRedirect("register.jsp?e=1");
            } else {
                pst = con.prepareStatement(Constants.INSERT_USER);
                pst.setString(1, first_name);
                pst.setString(2, last_name);
                pst.setString(3, mobile);
                pst.setString(4, email);
                pst.setString(5, password);
                row = pst.executeUpdate();
                rs = stmt.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
                rs.last();
                rowCount = rs.getRow();
                rs.first();
                if (rowCount == 1) {
                    HttpSession session = req.getSession();
                    session.setAttribute("user_email", rs.getString("email"));
                    session.setAttribute("user_name", rs.getString("first_name"));
                    session.setAttribute("user_id", rs.getString("id"));
                    session.setAttribute("user_role", "USER");
                    rsp.sendRedirect("index.jsp");
                } else {
                    rsp.sendRedirect("register.jsp?e=2");
                }
            }

        } catch (SQLException ex) {
            rsp.setContentType("text/html");
            PrintWriter out = rsp.getWriter();
            out.println(ex.getMessage());
        }

    }
}
