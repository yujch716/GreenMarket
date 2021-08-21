package orderDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import marketdbconn.MarketDBConn;
import orderVO.OrderVO;

public class OrderDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public OrderDAO() throws ClassNotFoundException, SQLException{
		con = new MarketDBConn().getConnection();
	}
	
	public ArrayList<OrderVO> getAllInfo() throws SQLException{
		ArrayList<OrderVO> orArr = new ArrayList<OrderVO>();
		String sql = "SELECT * FROM order_table ORDER BY d";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String id = rs.getString("id");
			String order = rs.getString("order1");
			int total = rs.getInt("total");
			Date d = rs.getDate("d");
			int process = rs.getInt("process");
			
			OrderVO odv = new OrderVO(id,order,total,d,process);
			orArr.add(odv);
			
		}
		rs.close();pstmt.close();con.close();
		
		return orArr;
	}
	
	public boolean insert_order(String id, String order , int total) throws SQLException {
		String sql = "INSERT into order_table(id,order1,total) values(?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, order);
		pstmt.setInt(3, total);
		
		pstmt.executeUpdate();
		return true;
	}
	
	public ArrayList<OrderVO> search_order(String oriId) throws SQLException {
		ArrayList<OrderVO> orArr = new ArrayList<OrderVO>();
		OrderVO ov = null;
		String sql = "SELECT * FROM order_table WHERE id = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, oriId);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String id = rs.getString("id");
			String order = rs.getString("order1");
			int total = rs.getInt("total");
			Date d = rs.getDate("d");
			int process = rs.getInt("process");
			
			ov = new OrderVO(id,order,total,d,process);
			orArr.add(ov);
		}
		rs.close();pstmt.close();con.close();
		return orArr;
	}
	
	public void update_order(String id) {
		String sql = "UPDATE order_table SET process = 1 WHERE id = ? AND process = 0";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("error-update");
		}
	}
	
	
}
