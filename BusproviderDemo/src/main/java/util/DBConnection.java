package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private String username = "root";
	private String hostname = "localhost";
	private String password = "Bus*01ticket";
	private String database = "onlinebus";

	public Connection getConnection() {
		Connection con = null;
		try {
			String url = "jdbc:mysql://" + hostname + "/" + database + "?autoReconnect=false&useSSL=false";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException | SQLException e) {
			System.err.print(e.getMessage());
		}
		return con;
	}

}
