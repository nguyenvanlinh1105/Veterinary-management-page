package com.petshop.model;

public class PhieuNhapModel extends AbstractModel<PhieuNhapModel>{
	private String maPN;
	private String maNCC;
	
	
	
	public PhieuNhapModel() {
		super();
	}
	public PhieuNhapModel(String maPN, String maNCC) {
		super();
		this.maPN = maPN;
		this.maNCC = maNCC;
	}
	public String getMaPN() {
		return maPN;
	}
	public void setMaPN(String maPN) {
		this.maPN = maPN;
	}
	public String getMaNCC() {
		return maNCC;
	}
	public void setMaNCC(String maNCC) {
		this.maNCC = maNCC;
	}
	
	
}
