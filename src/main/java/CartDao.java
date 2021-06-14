
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class CartDao {

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
	
	public String addToCart(String username, String item_id, String item_name, float item_price) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Success";
		
		String sql = "insert into cart(username, item_id, item_name, item_price) values(?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, item_id);
			ps.setString(3, item_name);
			ps.setFloat(4, item_price);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Failed";
		}
		
		
		return result;
	}
	
	public float getPrice(String item_id) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		float result = 0;
		
		
		String sql = "select price from item where id=" + item_id;
		
		java.sql.Statement statement;
		try {
			statement = con.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			rs.next();
			result = rs.getFloat(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public String removeItem(String username, String item_id) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "sucessful delete";
		
		String sql = "delete from cart where cart.username=? and cart.item_id=?";
		
		PreparedStatement statement;
		try {
			statement = con.prepareStatement(sql);
			statement.setString(1,username);
			statement.setString(2, item_id);
			statement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "failed operation";
		}
		return result;
		
	}

	public int updateCart(String username) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "select count(*) from cart where username='" + username + "'"; 
		Statement statement;
		int items_in_cart = 0;
		try {
			statement = con.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			rs.next();
			items_in_cart = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return items_in_cart;
	}

	public String getName(String item_id) {
		// TODO Auto-generated method stub
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "select name from item where id='" + item_id + "'";
		Statement statement;
		String item_name = "";
		try {
			statement = con.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			rs.next();
			item_name = rs.getString(1);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return item_name;
	}
	
	
	
	
}