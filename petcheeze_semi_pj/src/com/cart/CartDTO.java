package com.cart;

public class CartDTO {
	
	private int cartCode, pdcode; //장바구니코드, 상품코드
	private String image, pdName; //이미지, 상품이름
	private int pdPrice, cartCnt, pdMil, delPay, totPay;
	// 상품가격, 상품수량, 상품마일리지, 배송비, 상품가격*수량
	private String email, cartdate;  //이메일(id), 저장일자
	private int totPdCount; //장바구니에 저장된 총 제품갯수
	
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
