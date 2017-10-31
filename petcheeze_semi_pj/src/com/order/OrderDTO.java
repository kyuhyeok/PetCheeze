package com.order;

public class OrderDTO {
	int orderCode,totalPrice,pdCnt;
	String orderDate,orederState,email,pdImage,pdName;
	
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdImage() {
		return pdImage;
	}
	public void setPdImage(String pdImage) {
		this.pdImage = pdImage;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPdCnt() {
		return pdCnt;
	}
	public void setPdCnt(int pdCnt) {
		this.pdCnt = pdCnt;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrederState() {
		return orederState;
	}
	public void setOrederState(String orederState) {
		this.orederState = orederState;
	}
	
	

}
