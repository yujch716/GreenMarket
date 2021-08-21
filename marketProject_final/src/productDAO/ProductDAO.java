package productDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import marketdbconn.MarketDBConn;
import productVO.ProductVO;

public class ProductDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ProductDAO() throws ClassNotFoundException, SQLException {
		con = new MarketDBConn().getConnection();
	}
	
	public ArrayList<ProductVO> viewCate(String cate) throws SQLException{
		ArrayList<ProductVO> pdArr = new ArrayList<ProductVO>();
		String sql = "SELECT * FROM product_table WHERE pro_cate = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, cate);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String pro_name = rs.getString("pro_name");
			int pro_price = rs.getInt("pro_price");
			String pro_dec = rs.getString("pro_dec");
			int pro_amount = rs.getInt("pro_amount");
			String pro_cate = rs.getString("pro_cate");
			String pro_uri = rs.getString("pro_uri");
			
			ProductVO pvo = new ProductVO(pro_name,pro_price,pro_dec,pro_amount,pro_cate,pro_uri);
			pdArr.add(pvo);
		}
		return pdArr;
	}
	
	public ArrayList<ProductVO> getAllInfo() throws SQLException{
		ArrayList<ProductVO> pdArr = new ArrayList<ProductVO>();
		String sql = "SELECT * FROM product_table ORDER BY pro_name";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String pro_name = rs.getString("pro_name");
			int pro_price = rs.getInt("pro_price");
			String pro_dec = rs.getString("pro_dec");
			int pro_amount = rs.getInt("pro_amount");
			String pro_cate = rs.getString("pro_cate");
			String pro_uri = rs.getString("pro_uri");
			
			ProductVO pvo = new ProductVO(pro_name,pro_price,pro_dec,pro_amount,pro_cate,pro_uri);
			pdArr.add(pvo);
		}
		
		return pdArr;
	}
	
	public void update_product(int amount , String name) {
		String sql = "UPDATE product_table SET pro_amount = ? WHERE pro_name = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setString(2, name);
			pstmt.execute();
		} catch (SQLException e) {
			System.out.println("update-error");
			
		}
		
	}
	
	public ArrayList<ProductVO> pro_search(String search_name) throws SQLException{
		ArrayList<ProductVO> pdArr = new ArrayList<ProductVO>();
		String sql = "SELECT * FROM product_table WHERE pro_name LIKE ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%"+search_name+"%");
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String pro_name = rs.getString("pro_name");
			int pro_price = rs.getInt("pro_price");
			String pro_dec = rs.getString("pro_dec");
			int pro_amount = rs.getInt("pro_amount");
			String pro_cate = rs.getString("pro_cate");
			String pro_uri = rs.getString("pro_uri");
			
			ProductVO pvo = new ProductVO(pro_name,pro_price,pro_dec,pro_amount,pro_cate,pro_uri);
			pdArr.add(pvo);
		}

		return pdArr;
	}
	
	public ProductVO pro_detail(String name) throws SQLException {
		String sql = "SELECT * FROM product_table where pro_name=?";
		ProductVO detail_pvo = null;
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String pro_name = rs.getString("pro_name");
			int pro_price = rs.getInt("pro_price");
			String pro_dec = rs.getString("pro_dec");
			int pro_amount = rs.getInt("pro_amount");
			String pro_cate = rs.getString("pro_cate");
			String pro_uri = rs.getString("pro_uri");
			detail_pvo = new ProductVO(pro_name,pro_price,pro_dec,pro_amount,pro_cate,pro_uri);
		}

		return detail_pvo;
	}
	//상품 삭제하기
	   public void delete_product(String name) throws SQLException{
	      String sql = "DELETE product_table where pro_name =?";
	      
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, name);
	      pstmt.executeUpdate();
	      
	   }
	   
	 //상품 등록하기
		public boolean insert_product(String add_name, int add_price, String add_dec, int add_amount, String add_cate, String add_uri) throws SQLException {
			String sql = "INSERT into product_table values(?,?,?,?,?,?)";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, add_name);
				pstmt.setInt(2, add_price);
				pstmt.setString(3, add_dec);
				pstmt.setInt(4, add_amount);
				pstmt.setString(5, add_cate);
				pstmt.setString(6, add_uri);
				pstmt.executeUpdate();
			}catch(SQLException e) {
				System.out.println("update Exception");		
				return false;
			}					
			return true;
		}   
	
	
}
