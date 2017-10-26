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
					dto.setEmail2(ss[0]);
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
	
}
