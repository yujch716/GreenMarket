package memberDAO;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import marketdbconn.MarketDBConn;
import memberVO.MemberVO;


public class MemberDAO {
	
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public MemberDAO() throws ClassNotFoundException, SQLException {
		con = new MarketDBConn().getConnection();
	}
	
	//아이디 중복 체크
	public int isID(String infom_id) throws SQLException {
		String sql = "select count(*) from member_table where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, infom_id);
		rs = pstmt.executeQuery();
		if(rs.next())
			return rs.getInt(1);//1이면 이미 있음  , 0이면 없음!!
		return -1;//에러시 -1..
	}	
	
	
	//회원가입
		public boolean join_member(String jo_id, String jo_pw, String jo_name, String jo_tel, String jo_addr) throws SQLException {
			String sql = "INSERT into member_table values(?,?,?,?,?)";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, jo_id);
				pstmt.setString(2, jo_pw);
				pstmt.setString(3, jo_name);
				pstmt.setString(4, jo_tel);
				pstmt.setString(5, jo_addr);
				pstmt.executeUpdate();
			}catch(SQLException e) {
				System.out.println("update Exception");
				return false;
			}			
				return true;
		}     
		
		
	
	//회원정보수정 (이름을 확인하고 전화번호,주소,비밀번호 수정)
	 public boolean update_member(String up_pw, String up_tel,String up_addr, String up_sname)
            throws SQLException {
		 String sql="update member_table set pw=?, tel=?, "
				 + " addr=? where name=?";
		 try {	
			 pstmt = con.prepareStatement(sql);

			 pstmt.setString(1,up_pw);
			 pstmt.setString(2, up_tel);
			 pstmt.setString(3, up_addr);//링크로 넘어온 이름
			 pstmt.setString(4, up_sname);

			 pstmt.executeUpdate();
		 }catch(SQLException e) {
			 System.out.println("update Exception");
			 return false;
		 }

		 return true;
	 }

	
	//회원탈퇴
	public boolean delete_member(String id) throws SQLException {
		String sql = "DELETE member_table WHERE id = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		return true;
	}
	
	
	
	//회원정보 전체출력
	public ArrayList<MemberVO> getAllInfo() throws SQLException{
		ArrayList<MemberVO> mem_array = new ArrayList<MemberVO>();
		String sql = "select * from member_table";
			
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String tel = rs.getString("tel");
			String addr = rs.getString("addr");				
				
			MemberVO mvo = new MemberVO(id,pw,name,tel,addr);
			mem_array.add(mvo);
				
		}
		rs.close();
		pstmt.close();
		con.close();
		return mem_array;
	}
	
	
	//한명의 회원정보 보기
		public MemberVO getInfo_mem(String infom_name) throws SQLException {
			MemberVO mtv = null;
			String sql = "select * from member_table where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, infom_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String tel = rs.getString(4);
				String addr = rs.getString(5);
				mtv = new MemberVO(id,pw,name,tel,addr);
			}else {
			mtv = null;
				}
			return mtv;
		}	

	
	//로그인
	public int login(String id, String pw) {
		String sql = "select pw from member_table where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1; //로그인 성공
				}else
					return 0; //비밀번호 틀림
			}
			return -1; //아이디 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //오류
	}
		
	

	//아이디 찾기 (이름과 전화번호로 아이디 찾기)
		public String search_id(String name, String tel) throws SQLException{
			String id = null; //찾을 아이디
			String sql ="SELECT id FROM member_table where name=? and tel=?";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,name);
				pstmt.setString(2,tel);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					id=rs.getString("id");
				}
			}catch(Exception e) {
				System.out.println(e);
			}
			return id;
		}

		
	//비밀번호 찾기 (아이디와 이름으로 비밀번호 찾기)
		public String search_pw(String id, String name) throws SQLException{
			String pw = null; //찾을 비밀번호
			String sql ="SELECT pw FROM member_table where id=? and name=?";
					
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setString(2,name);
						
				rs = pstmt.executeQuery();
				while(rs.next()) {
					pw=rs.getString("pw");
				}
			}catch(Exception e) {
				System.out.println(e);
			}
			return pw;
		}
		
}