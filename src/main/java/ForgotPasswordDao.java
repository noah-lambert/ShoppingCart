import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ForgotPasswordDao {

	private String dbUrl = "jdbc:mysql://localhost:3306/dbShoppingCart";
	private String dbUsername = "root";
	private String dbPassword = "password";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public String changePassword(String username, String email, String password) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "operation failed";
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery("select * from member where username='" + username + "' and email='" + email + "'");
			while(rs.next()) {
				statement.executeUpdate("update member set password='" + password + "' where email='" + email + "'" );
			}
			result = "password successful updated";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		return result;
		
	}
}
