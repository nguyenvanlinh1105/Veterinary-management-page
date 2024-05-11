package com.petshop.model;

import java.sql.Timestamp;

public class TheModel  extends AbstractModel<TheModel> {
	private String idThuCung;
	private String idKhachHang;
	
	public TheModel() {
		super();
	}
	public TheModel(String idThuCung, String idKhachHang) {
		super();
		this.idThuCung = idThuCung;
		this.idKhachHang = idKhachHang;
	}
	public String getIdThuCung() {
		return idThuCung;
	}
	public void setIdThuCung(String idThuCung) {
		this.idThuCung = idThuCung;
	}
	public String getIdKhachHang() {
		return idKhachHang;
	}
	public void setIdKhachHang(String idKhachHang) {
		this.idKhachHang = idKhachHang;
	}

	
}
