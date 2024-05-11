package com.petshop.model;

import java.sql.Date;
import java.sql.Timestamp;

public class DonHangModel extends AbstractModel<DonHangModel>{
	private String maDonHang;
	private String idKhachHang ;
	private String sdtGiaoHang;
	private String diaChiGiaoHang;
	private Date ngayGiaoHang ;
	private String phThucThanhToan;
	private Timestamp ngayThanhToan ;
	private String trangThai ;
	
	public DonHangModel(String maDonHang, String idKhachHang, String sdtGiaoHang, Date ngayGiaoHang,
			String phThucThanhToan, Timestamp ngayThanhToan, String trangThai) {
		super();
		this.maDonHang = maDonHang;
		this.idKhachHang = idKhachHang;
		this.sdtGiaoHang = sdtGiaoHang;
		this.ngayGiaoHang = ngayGiaoHang;
		this.phThucThanhToan = phThucThanhToan;
		this.ngayThanhToan = ngayThanhToan;
		this.trangThai = trangThai;
	}
	public DonHangModel() {
		super();
	}
	public String getMaDonHang() {
		return maDonHang;
	}
	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}
	public String getIdKhachHang() {
		return idKhachHang;
	}
	public void setIdKhachHang(String idKhachHang) {
		this.idKhachHang = idKhachHang;
	}
	public String getDiaChiGiaoHang() {
		return diaChiGiaoHang;
	}
	public void setDiaChiGiaoHang(String diaChiGiaoHang) {
		this.diaChiGiaoHang = diaChiGiaoHang;
	}
	public String getSdtGiaoHang() {
		return sdtGiaoHang;
	}
	public void setSdtGiaoHang(String sdtGiaoHang) {
		this.sdtGiaoHang = sdtGiaoHang;
	}
	public Date getNgayGiaoHang() {
		return ngayGiaoHang;
	}
	public void setNgayGiaoHang(Date ngayGiaoHang) {
		this.ngayGiaoHang = ngayGiaoHang;
	}
	public String getPhThucThanhToan() {
		return phThucThanhToan;
	}
	public void setPhThucThanhToan(String phThucThanhToan) {
		this.phThucThanhToan = phThucThanhToan;
	}
	public Timestamp getNgayThanhToan() {
		return ngayThanhToan;
	}
	public void setNgayThanhToan(Timestamp ngayThanhToan) {
		this.ngayThanhToan = ngayThanhToan;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	
}
