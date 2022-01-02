package mvc.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DBConnectionMysql;
import database.DBUtil;
import mvc.member.model.MemberDTO;

public class MemberDAO {
	private static MemberDAO instance;
	private void MemberDAO() {}
	public static MemberDAO getInstance() {
		if(instance==null) instance=new MemberDAO();
		return instance;
	}
	
	//id로 정보 가져오기
	public MemberDTO selectedById(String id) {
		MemberDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql="select * from member where id=?";
		try {
			conn=DBConnectionMysql.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString(1));
				dto.setPassword(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setPhone(rs.getString(5));
				dto.setZipcode(rs.getString(6));
				dto.setRoadAddress(rs.getString(7));
				dto.setJibunAddress(rs.getString(8));
				dto.setDetailAddress(rs.getString(9));
				dto.setExtraAddress(rs.getString(10));
			}
		}catch(Exception e) {
			System.out.println("에러:"+e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return dto;
	}
	
	//id와 password로 로그인
	public MemberDTO loginCheck(String id, String password) {
		MemberDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql="select * from member where id=? and password=?";
		try {
			conn=DBConnectionMysql.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString(1));
				dto.setPassword(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setPhone(rs.getString(5));
				dto.setZipcode(rs.getString(6));
				dto.setRoadAddress(rs.getString(7));
				dto.setJibunAddress(rs.getString(8));
				dto.setDetailAddress(rs.getString(9));
				dto.setExtraAddress(rs.getString(10));
			}
		}catch(Exception e) {
			System.out.println("에러:"+e.getMessage());
		}finally {
			try {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
				DBUtil.close(conn);
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return dto;
	}//selectedById() 끝 
	
	//회원가입 
	public void insert(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn=DBConnectionMysql.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getRoadAddress());
			pstmt.setString(8, dto.getJibunAddress());
			pstmt.setString(9, dto.getDetailAddress());
			pstmt.setString(10, dto.getExtraAddress());
			pstmt.setTimestamp(11, dto.getRegister_day());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("에러:"+e.getMessage());
		}finally {
			try {
				DBUtil.close(pstmt);
				DBUtil.close(conn);
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}//insert() 끝 
	
	//회원수정 입력
	public void updateMember(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		String sql = "update member set password=?, name=?, email=?, phone=?, zipcode=?, roadAddress=?, jibunAddress=?, detailAddress=?, extraAddress=? "
				+ " where id=? ";
		try {
			conn=DBConnectionMysql.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getZipcode());
			pstmt.setString(6, dto.getRoadAddress());
			pstmt.setString(7, dto.getJibunAddress());
			pstmt.setString(8, dto.getDetailAddress());
			pstmt.setString(9, dto.getExtraAddress());
			pstmt.setString(10, dto.getId());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("에러:"+e.getMessage());
		}finally {
			try {
				DBUtil.close(pstmt);
				DBUtil.close(conn);
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
	
}
