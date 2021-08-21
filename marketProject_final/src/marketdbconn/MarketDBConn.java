package marketdbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MarketDBConn {
	private Connection con;
	
	public Connection getConnection() {
		return con;
	}
	
	public MarketDBConn() throws ClassNotFoundException, SQLException {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "1234");
	}
}