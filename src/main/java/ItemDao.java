import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ItemDao {

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
	
	public String addItem(Item item) {
		
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Item Success";
		
		String sql = "insert into item values(?,?,?,?,?,?)";
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, item.getId());
			ps.setString(2, item.getName());
			ps.setFloat(3, item.getPrice());
			ps.setString(4, item.getCategory());
			ps.setInt(5,item.getQuantity());
			ps.setBoolean(6, item.isInStock());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = "Item Failed";
			e.printStackTrace();
		}
		
		return result;
	}
	
}
