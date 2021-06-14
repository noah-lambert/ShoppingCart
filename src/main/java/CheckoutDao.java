import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CheckoutDao {

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
	
	public String checkout(String username, String card, String address, String city, String state, String zip_code) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		PreparedStatement ps1;
		PreparedStatement ps2;
		String result = "success";
		String sql1 = "update member set card_number=?, address=?, city=?, state=?, zip_code=? where username=?";
		String sql2 = "delete from cart where username=?";
		
		try {
			
			ps1 = con.prepareStatement(sql1);
			ps1.setString(1, card);
			ps1.setString(2, address);
			ps1.setString(3, city);
			ps1.setString(4, state);
			ps1.setString(5, zip_code);
			ps1.setString(6, username);
			ps1.executeUpdate();
			
			ps2 = con.prepareStatement(sql2);
			ps2.setString(1, username);
			ps2.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = "checkout failed";
			e.printStackTrace();
		}
		
		return result;
		
		
	}
}
