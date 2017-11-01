package com.menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBCPConn;

public class MenuDAO {
	
	public int insertMenu(MenuDTO dto) {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			
			sql="INSERT INTO pd(pdcode, pdcontent, pdimage, pdmaker, pdmil, pdname, pdprice, pdkindcode) VALUES(?,?,?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPdCode());
			pstmt.setString(2, dto.getPdContent());
			pstmt.setString(3, dto.getPdImage());
			pstmt.setString(4, dto.getPdMaker());
			pstmt.setInt(5, dto.getPdMil());
			pstmt.setString(6, dto.getPdName());
			pstmt.setInt(7, dto.getPdPrice());
			pstmt.setInt(8, dto.getPdKindcode());
			result=pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return result;
	}
	
	public int updateMenu(MenuDTO dto) {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			
			sql="UPDATE pd SET pdcontent, pdimage, pdmaker, pdmil, pdname, pdprice, pdkindcode WHERE pdcode=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPdContent());
			pstmt.setString(2, dto.getPdImage());
			pstmt.setString(3, dto.getPdMaker());
			pstmt.setInt(4, dto.getPdMil());
			pstmt.setString(5, dto.getPdName());
			pstmt.setInt(6, dto.getPdPrice());
			pstmt.setInt(7, dto.getPdKindcode());
			pstmt.setInt(8, dto.getPdCode());
			result=pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return result;
	}
	
	public int deleteMenu(int pdCode) {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			
			sql="DELETE FROM pd WHERE pdcode=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pdCode);
			result=pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return result;
	}
	
	public MenuDTO readMenu(int pdCode) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MenuDTO dto=null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			
			sql="DELETE FROM pdcode, pdcontent, pdimage, pdmaker, pdmil, pdname, pdprice, pdtotcnt, pdkindcode WHERE pdcode=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pdCode);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new MenuDTO();
				dto.setPdCode(rs.getInt("pdcode"));
				dto.setPdContent(rs.getString("pdcontent"));
				dto.setPdImage(rs.getString("pdimage"));
				dto.setPdMaker(rs.getString("pdmaker"));
				dto.setPdMil(rs.getInt("pdmil"));
				dto.setPdName(rs.getString("pdname"));
				dto.setPdPrice(rs.getInt("pdprice"));
				dto.setPdTotcnt(rs.getInt("pdtotcnt"));
				dto.setPdKindcode(rs.getInt("pdkindcode"));
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return dto;
	}
	
	public int dataCount() {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			
			sql="SELECT NVL(COUNT(*), 0) FROM pd";
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				result=rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return result;
	}
	
	public List<MenuDTO> listMenuPage(int start, int end, int pdKindcode){
		Connection conn=null;
		List<MenuDTO> list=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			conn=DBCPConn.getConnection();
			
			sb.append("SELECT * FROM (");
			sb.append("SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("SELECT pdName, pdImage, pdMaker, pdContent, pdCode, pdPrice, pdMil, pdTotcnt");
			sb.append(" FROM pd WHERE pdkindcode=? ORDER BY pdcode DESC");
			sb.append(") tb WHERE ROWNUM<=?");
			sb.append(") WHERE rnum>=?");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pdKindcode);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MenuDTO dto=new MenuDTO();
				dto.setPdCode(rs.getInt("pdcode"));
				dto.setPdImage(rs.getString("pdimage"));
				dto.setPdMaker(rs.getString("pdmaker"));
				dto.setPdName(rs.getString("pdname"));
				dto.setPdPrice(rs.getInt("pdprice"));
				
				list.add(dto);
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println(e.toString());
		} finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return list;
	}
}
