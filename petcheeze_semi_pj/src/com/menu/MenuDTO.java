package com.menu;

//CREATE TABLE pd (
//		pdcode NUMBER NOT NULL, /* ��ǰ�ڵ� */
//		pdname VARCHAR2(50) NOT NULL, /* ��ǰ�� */
//		pdimage VARCHAR2(50), /* �̹��� */
//		pdmaker VARCHAR2(50), /* ������ */
//		pdprice NUMBER NOT NULL, /* ���� */
//		pdmil NUMBER, /* ���ϸ����ۼ�Ʈ */
//		pdcontent VARCHAR2(2000) NOT NULL, /* ���� */
//		pdtotcnt NUMBER NOT NULL, /* ������ */
//		pdkindcode NUMBER NOT NULL /* ��ǰ�з��ڵ� */
//	);
//CREATE TABLE pdkind (
//		pdkindcode NUMBER /* ��ǰ�з��ڵ� */
//		, pdkind VARCHAR2(50) NOT NULL /* ��ǰ�з��� */
//		, CONSTRAINT PK_pdkind PRIMARY KEY(pdkindcode)
//	);

public class MenuDTO {
	private String pdName, pdImage, pdMaker, pdContent, pdNew;
	private int pdCode, pdPrice, pdMil, pdTotcnt, pdKindcode, pdKind;
	
	public String getPdNew() {
		return pdNew;
	}
	public void setPdNew(String pdNew) {
		this.pdNew = pdNew;
	}
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
	public String getPdMaker() {
		return pdMaker;
	}
	public void setPdMaker(String pdMaker) {
		this.pdMaker = pdMaker;
	}
	public String getPdContent() {
		return pdContent;
	}
	public void setPdContent(String pdContent) {
		this.pdContent = pdContent;
	}
	public int getPdCode() {
		return pdCode;
	}
	public void setPdCode(int pdCode) {
		this.pdCode = pdCode;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	public int getPdMil() {
		return pdMil;
	}
	public void setPdMil(int pdMil) {
		this.pdMil = pdMil;
	}
	public int getPdTotcnt() {
		return pdTotcnt;
	}
	public void setPdTotcnt(int pdTotcnt) {
		this.pdTotcnt = pdTotcnt;
	}
	public int getPdKindcode() {
		return pdKindcode;
	}
	public void setPdKindcode(int pdKindcode) {
		this.pdKindcode = pdKindcode;
	}
	public int getPdKind() {
		return pdKind;
	}
	public void setPdKind(int pdKind) {
		this.pdKind = pdKind;
	}
	
}
