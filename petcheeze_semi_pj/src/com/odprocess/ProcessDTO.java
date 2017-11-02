package com.odprocess;

public class ProcessDTO {

	private int cartCode, cartCnt, pdmil;

	private int orderdicode, pdcnt, pdcode;  
	
	private int usemil, realprice;
	private String paymethod;
	
	private String taker, tel, addr0, addr1, addr2, memo,pdimage;
	private int ordercode, totprice,pdprice;
	private String orderdate, email,pdname;
	private String payState;//결제상태
	


	public String getPayState() {
		return payState;
	}

	public void setPayState(String payState) {
		this.payState = payState;
	}

	public String getPdimage() {
		return pdimage;
	}

	public void setPdimage(String pdimage) {
		this.pdimage = pdimage;
	}

	public int getPdmil() {
		return pdmil;
	}

	public void setPdmil(int pdmil) {
		this.pdmil = pdmil;
	}

	
	public int getPdprice() {
		return pdprice;
	}

	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}

	
	
	public String getPdname() {
		return pdname;
	}

	public void setPdname(String pdname) {
		this.pdname = pdname;
	}


	public int getCartCnt() {
		return cartCnt;
	}

	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	
	public int getCartCode() {
		return cartCode;
	}

	public void setCartCode(int cartCode) {
		this.cartCode = cartCode;
	}
	public int getOrdercode() {
		return ordercode;
	}

	public void setOrdercode(int ordercode) {
		this.ordercode = ordercode;
	}

	public int getTotprice() {
		return totprice;
	}

	public void setTotprice(int totprice) {
		this.totprice = totprice;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getOrderdicode() {
		return orderdicode;
	}

	public void setOrderdicode(int orderdicode) {
		this.orderdicode = orderdicode;
	}

	public int getPdcnt() {
		return pdcnt;
	}

	public void setPdcnt(int pdcnt) {
		this.pdcnt = pdcnt;
	}

	public int getPdcode() {
		return pdcode;
	}

	public void setPdcode(int pdcode) {
		this.pdcode = pdcode;
	}

	public int getUsemil() {
		return usemil;
	}

	public void setUsemil(int usemil) {
		this.usemil = usemil;
	}

	public int getRealprice() {
		return realprice;
	}

	public void setRealprice(int realprice) {
		this.realprice = realprice;
	}

	public String getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}

	public String getTaker() {
		return taker;
	}

	public void setTaker(String taker) {
		this.taker = taker;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr0() {
		return addr0;
	}

	public void setAddr0(String addr0) {
		this.addr0 = addr0;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	

}
