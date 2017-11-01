package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBCPConn;

public class MemberDAO {
		

	public MemberDTO readMember(String userEmail) {
		MemberDTO dto = null;
		PreparedStatement pstmt= null;
		StringBuffer sb= new StringBuffer();
		ResultSet rs = null;
		
		Connection conn=null;
		System.out.println(userEmail);
		try {
			
			conn=DBCPConn.getConnection();
			
			sb.append("SELECT m1.email email, name, addr0,addr1,addr2,tel");
			sb.append("       ,pwd,birth,pname");
			sb.append(" FROM member1 m1");
			sb.append(" LEFT OUTER JOIN member2 m2 ");
			sb.append(" ON m1.email=m2.email");
			sb.append(" WHERE m1.email=?");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, userEmail);
			rs=pstmt.executeQuery();
		
			if(rs.next()) {
				dto=new MemberDTO();
				dto.setUserEmail(rs.getString("email"));
				if(dto.getUserEmail()!=null) {
					String []ss= dto.getUserEmail().split("@");
					dto.setEmail1(ss[0]);
					dto.setEmail2(ss[1]);
				}
				
				dto.setUserName(rs.getString("name"));
				dto.setUserPwd(rs.getString("pwd"));
				dto.setBirth(rs.getString("birth"));
				dto.setPname(rs.getString("pname"));
				dto.setTel(rs.getString("tel"));
				if(dto.getTel()!=null) {
					String[] ss= dto.getTel().split("-");
					dto.setTel1(ss[0]);
					dto.setTel2(ss[1]);
					dto.setTel3(ss[2]);
				}
				dto.setAddr0(rs.getString("addr0"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				
			}
			rs.close();
			pstmt.close();
			pstmt=null;
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
	
		return dto;
	}
	
	public int insertMember(MemberDTO dto) {
		
		int result=0;
		
		PreparedStatement pstmt=null;
		Connection conn=null;
		StringBuffer sb=new StringBuffer();
		System.out.println("sd");
		
		try {
			conn=DBCPConn.getConnection();
			
			sb.append("INSERT INTO member1 (email,name,addr0,addr1,addr2,tel)");
			sb.append("		VALUES (?,?,?,?,?,?)");
			
			pstmt=conn.prepareStatement(sb.toString());
			
			
			pstmt.setString(1, dto.getUserEmail());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getAddr0());
			pstmt.setString(4, dto.getAddr1());
			pstmt.setString(5, dto.getAddr2());
			pstmt.setString(6, dto.getTel());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			sb=new StringBuffer();
			
			sb.append("INSERT INTO member2 (email,pwd,birth,pname)");
			sb.append("		VALUES (?,?,?,?)");
			
			pstmt=conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, dto.getUserEmail());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getBirth());
			pstmt.setString(4, dto.getPname());
			
			result=pstmt.executeUpdate();
			

			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public int updateMember(MemberDTO dto) {
		
		int result=0;
		
		PreparedStatement pstmt=null;
		Connection conn=null;
		StringBuffer sb=new StringBuffer();
		System.out.println("sd");
		
		try {
			conn=DBCPConn.getConnection();
			
			sb.append("UPDATE member1 SET name=?,addr0=?,addr1=?");
			sb.append("		,addr2=?,tel=? where email=?");
			
			pstmt=conn.prepareStatement(sb.toString());
			
			
			pstmt.setString(1, dto.getUserName());
			pstmt.setString(2, dto.getAddr0());
			pstmt.setString(3, dto.getAddr1());
			pstmt.setString(4, dto.getAddr2());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getUserEmail());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			sb=new StringBuffer();
			
			sb.append("UPDATE member2 SET pwd=?,birth=?");
			sb.append("		,pname=? where email=?");
			
			pstmt=conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, dto.getUserPwd());
			pstmt.setString(2, dto.getBirth());
			pstmt.setString(3, dto.getPname());
			pstmt.setString(4, dto.getUserEmail());
			
			result=pstmt.executeUpdate();
			

			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	
}
