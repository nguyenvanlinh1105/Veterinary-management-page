package com.petshop.model;

public class ThuCungModel extends AbstractModel<ThuCungModel> {
	private String idThuCung;
	private String tenThuCung;
	private String gioiTinh ;
	private String loaiThuCung ;
	private int tuoi ;
	
	
	public ThuCungModel() {
		super();
	}
	public ThuCungModel(String idThuCung, String tenThuCung, String gioiTinh, String loaiThuCung, int tuoi) {
		super();
		this.idThuCung = idThuCung;
		this.tenThuCung = tenThuCung;
		this.gioiTinh = gioiTinh;
		this.loaiThuCung = loaiThuCung;
		this.tuoi = tuoi;
	}
	public String getIdThuCung() {
		return idThuCung;
	}
	public void setIdThuCung(String idThuCung) {
		this.idThuCung = idThuCung;
	}
	public String getTenThuCung() {
		return tenThuCung;
	}
	public void setTenThuCung(String tenThuCung) {
		this.tenThuCung = tenThuCung;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getLoaiThuCung() {
		return loaiThuCung;
	}
	public void setLoaiThuCung(String loaiThuCung) {
		this.loaiThuCung = loaiThuCung;
	}
	public int getTuoi() {
		return tuoi;
	}
	public void setTuoi(int tuoi) {
		this.tuoi = tuoi;
	}
	
	
}
