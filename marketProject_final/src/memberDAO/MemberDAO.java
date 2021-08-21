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
	
	//���̵� �ߺ� üũ
	public int isID(String infom_id) throws SQLException {
		String sql = "select count(*) from member_table where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, infom_id);
		rs = pstmt.executeQuery();
		if(rs.next())
			return rs.getInt(1);//1�̸� �̹� ����  , 0�̸� ����!!
		return -1;//������ -1..
	}	
	
	
	//ȸ������
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
		
		
	
	//ȸ���������� (�̸��� Ȯ���ϰ� ��ȭ��ȣ,�ּ�,��й�ȣ ����)
	 public boolean update_member(String up_pw, String up_tel,String up_addr, String up_sname)
            throws SQLException {
		 String sql="update member_table set pw=?, tel=?, "
				 + " addr=? where name=?";
		 try {	
			 pstmt = con.prepareStatement(sql);

			 pstmt.setString(1,up_pw);
			 pstmt.setString(2, up_tel);
			 pstmt.setString(3, up_addr);//��ũ�� �Ѿ�� �̸�
			 pstmt.setString(4, up_sname);

			 pstmt.executeUpdate();
		 }catch(SQLException e) {
			 System.out.println("update Exception");
			 return false;
		 }

		 return true;
	 }

	
	//ȸ��Ż��
	public boolean delete_member(String id) throws SQLException {
		String sql = "DELETE member_table WHERE id = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		return true;
	}
	
	
	
	//ȸ������ ��ü���
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
	
	
	//�Ѹ��� ȸ������ ����
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

	
	//�α���
	public int login(String id, String pw) {
		String sql = "select pw from member_table where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1; //�α��� ����
				}else
					return 0; //��й�ȣ Ʋ��
			}
			return -1; //���̵� ����
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //����
	}
		
	

	//���̵� ã�� (�̸��� ��ȭ��ȣ�� ���̵� ã��)
		public String search_id(String name, String tel) throws SQLException{
			String id = null; //ã�� ���̵�
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

		
	//��й�ȣ ã�� (���̵�� �̸����� ��й�ȣ ã��)
		public String search_pw(String id, String name) throws SQLException{
			String pw = null; //ã�� ��й�ȣ
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