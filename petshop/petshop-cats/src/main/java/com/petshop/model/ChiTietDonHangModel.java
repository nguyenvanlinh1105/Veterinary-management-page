package com.petshop.model;

public class ChiTietDonHangModel extends AbstractModel<ChiTietDonHangModel>{
	private String maDonHang ;
	private String idDichVu;
	private String idBacSi ;
	private String idNhanVien ;
	private int soLuong ;
	public String getMaDonHang() {
		return maDonHang;
	}
	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}
	public String getIdDichVu() {
		return idDichVu;
	}
	public void setIdDichVu(String idDichVu) {
		this.idDichVu = idDichVu;
	}
	public String getIdBacSi() {
		return idBacSi;
	}
	public void setIdBacSi(String idBacSi) {
		this.idBacSi = idBacSi;
	}
	public String getIdNhanVien() {
		return idNhanVien;
	}
	public void setIdNhanVien(String idNhanVien) {
		this.idNhanVien = idNhanVien;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public ChiTietDonHangModel(String maDonHang, String idDichVu, String idBacSi, String idNhanVien, int soLuong) {
		super();
		this.maDonHang = maDonHang;
		this.idDichVu = idDichVu;
		this.idBacSi = idBacSi;
		this.idNhanVien = idNhanVien;
		this.soLuong = soLuong;
	}
	public ChiTietDonHangModel() {
		super();
	}
	
}
