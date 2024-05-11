package com.petshop.model;

import java.util.Currency;

public class DichVuModel extends AbstractModel<DichVuModel>{
	private String idDichVu;
	private String tenDichVu;
	private Float donGia ;
	private String thuongHieu;
	private String loaiSanPham;
	private int soLuongHienCon;
	private int soLuongDaBan ;
	private String donViTinh ;
	
	
	public DichVuModel() {
		super();
	}
	public DichVuModel(String idDichVu, String tenDichVu, Float donGia, String thuongHieu, String loaiSanPham,
			int soLuongHienCon, int soLuongDaBan, String donViTinh) {
		super();
		this.idDichVu = idDichVu;
		this.tenDichVu = tenDichVu;
		this.donGia = donGia;
		this.thuongHieu = thuongHieu;
		this.loaiSanPham = loaiSanPham;
		this.soLuongHienCon = soLuongHienCon;
		this.soLuongDaBan = soLuongDaBan;
		this.donViTinh = donViTinh;
	}
	public String getIdDichVu() {
		return idDichVu;
	}
	public void setIdDichVu(String idDichVu) {
		this.idDichVu = idDichVu;
	}
	public String getTenDichVu() {
		return tenDichVu;
	}
	public void setTenDichVu(String tenDichVu) {
		this.tenDichVu = tenDichVu;
	}
	public Float getDonGia() {
		return donGia;
	}
	public void setDonGia(Float donGia) {
		this.donGia = donGia;
	}
	public String getThuongHieu() {
		return thuongHieu;
	}
	public void setThuongHieu(String thuongHieu) {
		this.thuongHieu = thuongHieu;
	}
	public String getLoaiSanPham() {
		return loaiSanPham;
	}
	public void setLoaiSanPham(String loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}
	public int getSoLuongHienCon() {
		return soLuongHienCon;
	}
	public void setSoLuongHienCon(int soLuongHienCon) {
		this.soLuongHienCon = soLuongHienCon;
	}
	public int getSoLuongDaBan() {
		return soLuongDaBan;
	}
	public void setSoLuongDaBan(int soLuongDaBan) {
		this.soLuongDaBan = soLuongDaBan;
	}
	public String getDonViTinh() {
		return donViTinh;
	}
	public void setDonViTinh(String donViTinh) {
		this.donViTinh = donViTinh;
	}
	
	
}
