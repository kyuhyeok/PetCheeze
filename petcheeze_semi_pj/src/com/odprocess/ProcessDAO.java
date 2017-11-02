package com.odprocess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBCPConn;

public class ProcessDAO {
	
	/*비회원 고객정보에 입력하기*/
	public int insertMember1(ProcessDTO dto) {
		int result=0;
		String sql;
		PreparedStatement pstmt = null;
		Connection conn=null;
		
		try {
			conn=DBCPConn.getConnection();
			sql="INSERT INTO member1 (email, name, addr0, addr1,addr2, tel) values (?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getTaker());
			pstmt.setString(3, dto.getAddr0());
			pstmt.setString(4, dto.getAddr1());
			pstmt.setString(5, dto.getAddr2());
			pstmt.setString(6, dto.getTel());
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
	/*회원 주문테이블에 값 넣기*/
	public int insertOrderBoard(ProcessDTO dto) {
		int result=0;
		String sql;
		PreparedStatement pstmt = null;
		Connection conn=null;
		
		try {
			conn=DBCPConn.getConnection();
			sql="INSERT INTO orderbd (ordercode, totprice, email) values (orderbd_seq.NEXTVAL,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getTotprice());
			pstmt.setString(2, dto.getEmail());
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
	/*회원 주문상세 테이블에 값 넣기*/
	public int insertOrderDetail(ProcessDTO dto) {
		int result=0;
		String sql;
		PreparedStatement pstmt=null;
		Connection conn=null;
		
		try {
			conn=DBCPConn.getConnection();
			sql="INSERT INTO orderdetail(orderdicode, pdcnt, pdcode, ordercode) VALUES (orderdetail_seq.NEXTVAL,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPdcnt());
			pstmt.setInt(2, dto.getPdcode());
			pstmt.setInt(3, dto.getOrdercode());
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
	/*회원 배송주소록에 값 넣기*/
	public int insertDelivery(ProcessDTO dto) {
		int result = 0;
		String sql;
		PreparedStatement pstmt=null;
		Connection conn=null;
		
		try {
			conn=DBCPConn.getConnection();
			sql="INSERT INTO delivery (ordercode, taker, tel, addr0, addr1, addr2, memo)";
			sql+=" VALUES (?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getOrdercode());
			pstmt.setString(2, dto.getTaker());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getAddr0());
			pstmt.setString(5, dto.getAddr1());
			pstmt.setString(6, dto.getAddr2());
			pstmt.setString(7, dto.getMemo());
			
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
	/*회원 결제상세에 값 넣기*/
	public int insertPayDetail(ProcessDTO	dto) {
		int result = 0;
		String sql;
		PreparedStatement pstmt=null;
		Connection conn=null;
		
		try {
			conn=DBCPConn.getConnection();
			sql="INSERT INTO paydetail (ordercode, usemil, realprice,paymethod)";
			sql+=" VALUES (?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getOrdercode());
			pstmt.setInt(2, dto.getUsemil());
			pstmt.setInt(3, dto.getTotprice());
			pstmt.setString(4, dto.getPaymethod());
			
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
	
	/*회원 주문상태 테이블에 값 넣기*/
	public int insertPayState(ProcessDTO dto) {
		int result = 0;
		String sql;
		PreparedStatement pstmt=null;
		Connection conn=null;
		
		try {
			conn=DBCPConn.getConnection();
			sql="INSERT INTO orderstate (ordercode, orderstate)";
			sql+=" VALUES (?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getOrdercode());
			pstmt.setString(2, dto.getPayState());
			
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
	
	/*회원 주문코드 시퀀스가져오기 */
	public int readPdSeq() {
		int odcode=0;
		String sql;
		PreparedStatement pstmt=null;
		Connection conn=null;
		ResultSet rs = null;
		
		try {
			conn=DBCPConn.getConnection();
			sql="SELECT orderbd_seq.CURRVAL seq FROM dual";
			pstmt=conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				odcode=rs.getInt("seq");
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			if(conn!=null)
				DBCPConn.close(conn);
		}
		
		return odcode;
	}
	
/*------------------------------------------------*/
	
	/*회원 장바구니에서 선택한것 가져오기*/
	public List<ProcessDTO> getCartListOdProcess(String []cartCode) {
		List<ProcessDTO> list= new ArrayList<>();
		
		ProcessDTO dto =null;
		
		for(int i=0;i<cartCode.length;i++) {
			dto=readCart(Integer.parseInt(cartCode[i]));
			if(dto!=null) {
				
				list.add(dto);
			
			}
		}
		System.out.println(list.size());
		
		return list;
	}
	
	/*회원 장바구니에서 장바구니에 담긴 정보 가져오기*/
	public ProcessDTO readCart(int cartCode) {
		StringBuffer sb = new StringBuffer();
		PreparedStatement pstmt= null;
		Connection conn = null;
		ProcessDTO dto = null;
		ResultSet rs = null;
		try {
			conn=DBCPConn.getConnection();
			sb.append("SELECT cartcode, cartcnt, pd.pdcode pdcode, email, cartdate,");
			sb.append("        pdname, pdprice,pdmil,pdimage,pdmaker ");
			sb.append(" FROM cart LEFT OUTER JOIN pd ON cart.pdcode=pd.pdcode");
			sb.append(" WHERE cartcode=?");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, cartCode);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new ProcessDTO();
				dto.setPdcode(rs.getInt("pdcode"));
				dto.setCartCode(rs.getInt("cartcode"));
				dto.setCartCnt(rs.getInt("cartcnt"));
				dto.setEmail(rs.getString("email"));
				dto.setPdname(rs.getString("pdname"));
				dto.setPdprice(rs.getInt("pdprice"));
				dto.setPdmil(rs.getInt("pdmil"));
				dto.setPdimage(rs.getString("pdimage"));
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
	
	/*회원 장바구니에서 주문할 상품들의 총금액*/
	public int getTotPrice(String []cartCode) {
		int totPrice=0;
		
		ProcessDTO dto = null;
		
		for(int i=0;i<cartCode.length;i++) {
			dto=readCart(Integer.parseInt(cartCode[i]));
			if(dto!=null) {
				totPrice+=dto.getPdprice()*dto.getCartCnt();
			}	
		}
		
		return totPrice;
	}
	
	public ProcessDTO readPdCode(int pdcode) {  //pdcode에 맞는 상품 정보가져오기
		ProcessDTO dto =null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Connection conn=null;
		String sql;
		
		try {
			conn=DBCPConn.getConnection();
			sql="SELECT pdcode, pdname, pdimage, pdprice, pdmil FROM pd WHERE pdcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pdcode);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new ProcessDTO();
				dto.setPdcode(rs.getInt("pdcode"));
				dto.setPdname(rs.getString("pdname"));
				dto.setPdimage(rs.getString("pdimage"));
				dto.setPdprice(rs.getInt("pdprice"));
				dto.setPdmil(rs.getInt("pdmil"));
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
	
	public List<ProcessDTO> readPayComList(int ordercode) {  //결제완료
		ProcessDTO dto =null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Connection conn=null;
		StringBuffer sb = new StringBuffer();
		List<ProcessDTO> list = new ArrayList<>();
		
		try {
			conn=DBCPConn.getConnection();
			sb.append("select orderdetail.ordercode ordercode, orderdate, totprice, email, orderdicode, pdcnt, pd.pdcode pdcode ");
			sb.append(" , pdname, pdimage, pdprice,pdmil ");
			sb.append(" FROM orderdetail LEFT OUTER JOIN orderbd on orderdetail.ordercode=orderbd.ordercode");
			sb.append(" LEFT OUTER JOIN pd ON pd.pdcode=orderdetail.pdcode ");
			sb.append(" where orderbd.ordercode =?");
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, ordercode);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				dto=new ProcessDTO();
				dto.setOrdercode(rs.getInt("ordercode"));
				dto.setOrderdate(rs.getString("orderdate"));
				dto.setTotprice(rs.getInt("totprice"));
				dto.setEmail(rs.getString("email"));
				dto.setOrderdicode(rs.getInt("orderdicode"));
				dto.setCartCnt(rs.getInt("pdcnt"));
				dto.setPdcode(rs.getInt("pdcode"));
				dto.setPdname(rs.getString("pdname"));
				dto.setPdimage(rs.getString("pdimage"));
				dto.setPdprice(rs.getInt("pdprice"));
				dto.setPdmil(rs.getInt("pdmil"));
				
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
	
	
	
	
			//주문상세에 넣기
			//결제상세에 넣기
			//배송주소록에 넣기
	
	
}




