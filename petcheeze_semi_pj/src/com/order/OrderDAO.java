package com.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.member.MemberDTO;
import com.util.DBCPConn;

public class OrderDAO {
	
	public List<OrderDTO> listOrder(String email) {
		List<OrderDTO> list=new ArrayList<>();
		
		OrderDTO dto=null;
		PreparedStatement pstmt=null;
		StringBuffer sb=new StringBuffer();
		ResultSet rs=null;
		
		Connection conn=null;
		
		try {
			conn =DBCPConn.getConnection();
			
			sb.append("select o.ORDERCODE,TO_CHAR(ORDERDATE,'yyyy-MM-dd') ORDERDATE,od.PDCNT");
			sb.append(" ,os.ORDERSTATE,p.pdimage,p.pdname,p.pdcode,p.pdprice");
			sb.append("  ,(p.pdprice*od.PDCNT) totalprice");
			sb.append("			from ORDERBD o JOIN ORDERSTATE os  ON o.ORDERCODE=os.ORDERCODE");
			sb.append("			 JOIN ORDERDETAIL od ON o.ORDERCODE=od.ORDERCODE");
			sb.append("			 JOIN PD p ON od.pdcode=p.pdcode where o.email=?");
			sb.append("			ORDER BY ORDERDATE DESC");
			System.out.println(sb.toString());
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
	
			while(rs.next()) {
				dto=new OrderDTO();
				dto.setOrderCode(rs.getInt("ORDERCODE"));
				dto.setOrderDate(rs.getString("ORDERDATE"));
				dto.setPdCnt(rs.getInt("PDCNT"));
				dto.setOrederState(rs.getString("ORDERSTATE"));
				dto.setPdImage(rs.getString("pdimage"));
				dto.setPdName(rs.getString("pdname"));
				dto.setPdCode(rs.getInt("pdcode"));
				dto.setPdPrice(rs.getInt("pdprice"));
				dto.setTotalPrice(rs.getInt("totalprice"));
				
				
				list.add(dto);
			}
			
			rs.close();
			pstmt.close();
	
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return list;
	}
	
	public List<OrderDTO> listDateOrder(String email,String endday,String firstday) {
		List<OrderDTO> list=new ArrayList<>();
		
		OrderDTO dto=null;
		PreparedStatement pstmt=null;
		StringBuffer sb=new StringBuffer();
		ResultSet rs=null;
		
		Connection conn=null;
		
		try {
			conn =DBCPConn.getConnection();
			
			sb.append("select o.ORDERCODE,TO_CHAR(ORDERDATE,'yyyy-MM-dd') ORDERDATE,od.PDCNT");
			sb.append(" ,os.ORDERSTATE,p.pdimage,p.pdname,p.pdcode,p.pdprice");
			sb.append("  ,(p.pdprice*od.PDCNT) totalprice");
			sb.append("			from ORDERBD o JOIN ORDERSTATE os  ON o.ORDERCODE=os.ORDERCODE");
			sb.append("			 JOIN ORDERDETAIL od ON o.ORDERCODE=od.ORDERCODE");
			sb.append("			 JOIN PD p ON od.pdcode=p.pdcode  ");
			sb.append("        WHERE o.email=? AND TO_DATE(TO_CHAR(ORDERDATE, 'YYYY-MM-DD'))>=TO_DATE(?,'yyyy-mm-dd')");
			sb.append(" 		AND TO_DATE(TO_CHAR(ORDERDATE, 'YYYY-MM-DD'))<=TO_DATE(?,'yyyy-mm-dd')");
			sb.append("			ORDER BY ORDERDATE DESC");

			

			
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, email);
			pstmt.setString(2, firstday);
			pstmt.setString(3, endday);
			rs=pstmt.executeQuery();
	
			while(rs.next()) {
				dto=new OrderDTO();
				dto.setOrderCode(rs.getInt("ORDERCODE"));
				dto.setOrderDate(rs.getString("ORDERDATE"));
				dto.setPdCnt(rs.getInt("PDCNT"));
				dto.setOrederState(rs.getString("ORDERSTATE"));
				dto.setPdImage(rs.getString("pdimage"));
				dto.setPdName(rs.getString("pdname"));
				dto.setPdCode(rs.getInt("pdcode"));
				dto.setPdPrice(rs.getInt("pdprice"));
				dto.setTotalPrice(rs.getInt("totalprice"));
				
				
				list.add(dto);
			}
			
			rs.close();
			pstmt.close();
	
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return list;
	}
	
	
	public List<MemberDTO> listAddress(String userEmail) {
		List<MemberDTO> list=new ArrayList<>();

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
		
			while(rs.next()) {
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
				
				list.add(dto);
				
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
	
		return list;
	}

}
