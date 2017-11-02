package com.odprocess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBCPConn;

public class ProcessDAO {
	
	/*��ȸ�� �������� �Է��ϱ�*/
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
	/*ȸ�� �ֹ����̺� �� �ֱ�*/
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
	/*ȸ�� �ֹ��� ���̺� �� �ֱ�*/
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
	/*ȸ�� ����ּҷϿ� �� �ֱ�*/
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
	/*ȸ�� �����󼼿� �� �ֱ�*/
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
	
	/*ȸ�� �ֹ����� ���̺� �� �ֱ�*/
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
	
	/*ȸ�� �ֹ��ڵ� �������������� */
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
	
	/*ȸ�� ��ٱ��Ͽ��� �����Ѱ� ��������*/
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
	
	/*ȸ�� ��ٱ��Ͽ��� ��ٱ��Ͽ� ��� ���� ��������*/
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
	
	/*ȸ�� ��ٱ��Ͽ��� �ֹ��� ��ǰ���� �ѱݾ�*/
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
	
	public ProcessDTO readPdCode(int pdcode) {  //pdcode�� �´� ��ǰ ������������
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
	
	public List<ProcessDTO> readPayComList(int ordercode) {  //�����Ϸ�
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
	
	
	
	
			//�ֹ��󼼿� �ֱ�
			//�����󼼿� �ֱ�
			//����ּҷϿ� �ֱ�
	
	
}




