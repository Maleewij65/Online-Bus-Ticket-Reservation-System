package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    public void doGet(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        session.invalidate();
        rsp.sendRedirect("index.jsp");
    }
}
