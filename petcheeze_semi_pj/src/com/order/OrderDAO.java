package com.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

}
