package com.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.menu.MenuDTO;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.util.DBCPConn;

public class CartDAO {


	//회원: 장바구니 추가
	public int insertCart_Member(CartDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			sql="INSERT INTO cart (cartcode, cartcnt,pdcode,email) VALUES (cart_seq.NEXTVAL,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCartCnt());
			pstmt.setInt(2, dto.getPdcode());
			pstmt.setString(3, dto.getEmail());
			result=pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null) {
				DBCPConn.close(conn);
			}
		}
		
		
		return result;
	}
	
	//같은 물건을 장바구니에 담았는지 확인하기
	public CartDTO readCheckSamePd(int pdcode) {
		Connection conn=null;
		CartDTO dto=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			sql="SELECT cartcode, cartcnt, pdcode, email From cart WHERE pdcode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdcode);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new CartDTO();
				dto.setCartCode(rs.getInt("cartcode"));
				dto.setCartCnt(rs.getInt("cartcnt"));
				dto.setPdcode(rs.getInt("pdcode"));
				dto.setEmail(rs.getString("email"));
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		
		return dto;
		
	}
	
	
	//장바구니에 담긴 물건 갯수구하기
	public int dataCount(String email) {
		Connection conn=null;
		int result=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			sql="SELECT NVL(COUNT(email),0) cnt FROM cart WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("cnt");
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		
		return result;
	}
	//장바구니에 담긴  제품가격*구매갯수  의 총 합
	public int totPrice(String email) {
		int result=0;
		String sql;
		PreparedStatement pstmt=null;
		Connection conn=null;
		ResultSet rs=null;
		try {
			conn=DBCPConn.getConnection();
			sql="SELECT SUM(pdprice*cartcnt) totprice FROM pd  LEFT OUTER JOIN cart ON pd.pdcode=cart.pdcode WHERE email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("totprice");
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return result;
	}

	public List<CartDTO> listCart(String email){
		List<CartDTO> list=new ArrayList<CartDTO>();
		StringBuffer sb = new StringBuffer();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn=null;
	
		try {
			conn=DBCPConn.getConnection();
			sb.append("SELECT pd.pdcode pdcode, pdname, pdimage,pdmaker,pdprice, pdmil, cartcode, cartcnt,cartdate ");
			sb.append(" FROM pd");
			sb.append(" LEFT OUTER JOIN cart ON pd.pdcode=cart.pdcode");
			sb.append(" WHERE email=?");
			sb.append(" ORDER BY cartdate DESC ");
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, email);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setPdcode(rs.getInt("pdcode"));
				dto.setPdName(rs.getString("pdname"));
				dto.setImage(rs.getString("pdimage"));
				dto.setPdmaker(rs.getString("pdmaker"));
				dto.setPdPrice(rs.getInt("pdprice"));
				dto.setPdMil(rs.getInt("pdmil"));
				dto.setCartCode(rs.getInt("cartcode"));
				dto.setCartCnt(rs.getInt("cartcnt"));
				list.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		
		return list;
	}
	
	public int updatePdCount(CartDTO dto) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql=null;
		Connection conn=null;
		try {
			conn=DBCPConn.getConnection();
			sql="UPDATE cart SET cartcnt=? WHERE cartcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCartCnt());
			pstmt.setInt(2, dto.getCartCode());
			result=pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);				
		}
		
		return result;
	}
	
	public int deleteCart(int cartCode) { //한개 삭제
		int result=0;
		PreparedStatement pstmt=null;
		Connection conn=null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			sql="DELETE FROM cart WHERE cartcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cartCode);
			result=pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		
		return result;
	}
	
	public int deleteCartList(String[] cartCode) {
		int result=0;
		String sql;
		PreparedStatement pstmt =null;
		Connection conn =null;
		try {
			conn=DBCPConn.getConnection();
			sql="DELETE FROM cart WHERE cartcode IN ( ";
			
			for(int i=0;i<cartCode.length;i++) {
				sql+="?,";
			}
			sql=sql.substring(0, sql.length()-1);
			sql+=")";
			pstmt=conn.prepareStatement(sql);
			
			for(int i=0;i<cartCode.length;i++) {
				pstmt.setInt(i+1, Integer.parseInt(cartCode[i]));
			}
			result=pstmt.executeUpdate();
		
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		
		return result;
	}
	
	public int removeAllCart(String email) {
		int result=0;
		PreparedStatement pstmt=null;
		Connection conn=null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			sql="DELETE FROM cart WHERE email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			result=pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		
		return result;
	}
	
	public CartDTO readCartList(int pdcode) { //해당 pdcode의 상품 정보 불러오기
		CartDTO dto =null;
		String sql;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn=DBCPConn.getConnection();
			sql="SELECT pdcode, pdname,pdimage, pdmaker,pdprice, pdmil, pdcontent, pdkindcode FROM pd WHERE pdcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pdcode);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new CartDTO();
				dto.setPdcode(rs.getInt("pdcode"));
				dto.setPdName(rs.getString("pdname"));
				dto.setImage(rs.getString("pdimage"));
				dto.setMaker(rs.getString("pdmaker"));
				dto.setPdPrice(rs.getInt("pdprice"));
				dto.setPdMil(rs.getInt("pdmil"));
				dto.setContent(rs.getString("pdcontent"));
				dto.setKindcode(rs.getInt("pdkindcode"));
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		
		return dto;
	}

}
