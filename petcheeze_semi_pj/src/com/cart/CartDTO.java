package com.cart;

public class CartDTO {
	
	private int cartCode, pdcode; //��ٱ����ڵ�, ��ǰ�ڵ�
	private String image, pdName; //�̹���, ��ǰ�̸�
	private int pdPrice, cartCnt, pdMil, delPay, totPay;
	// ��ǰ����, ��ǰ����, ��ǰ���ϸ���, ��ۺ�, ��ǰ����*����
	private String email, cartdate;  //�̸���(id), ��������
	private int totPdCount; //��ٱ��Ͽ� ����� �� ��ǰ����
	
	public int getTotPdCount() {
		return totPdCount;
	}
	public void setTotPdCount(int totPdCount) {
		this.totPdCount = totPdCount;
	}
	public int getCartCode() {
		return cartCode;
	}
	public void setCartCode(int cartCode) {
		this.cartCode = cartCode;
	}
	public int getPdcode() {
		return pdcode;
	}
	public void setPdcode(int pdcode) {
		this.pdcode = pdcode;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	public int getCartCnt() {
		return cartCnt;
	}
	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	public int getPdMil() {
		return pdMil;
	}
	public void setPdMil(int pdMil) {
		this.pdMil = pdMil;
	}
	public int getDelPay() {
		return delPay;
	}
	public void setDelPay(int delPay) {
		this.delPay = delPay;
	}
	public int getTotPay() {
		return totPay;
	}
	public void setTotPay(int totPay) {
		this.totPay = totPay;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCartdate() {
		return cartdate;
	}
	public void setCartdate(String cartdate) {
		this.cartdate = cartdate;
	}
	
	
	
}