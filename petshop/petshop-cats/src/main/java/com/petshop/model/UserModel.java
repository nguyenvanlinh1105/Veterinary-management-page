package com.petshop.model;

import java.sql.Date;
import java.sql.Timestamp;

public class UserModel extends AbstractModel<UserModel>{
	private String idUser;
	private String userName ;
	private String password;
	private String tenuser ;
	private String loaiuser ;
	private String gioiTinh; 
	private Date ngaySinh ;
	private String soDienThoai ;
	private String email ;
	private String thongTinUser ;
	private int status ;
	private RoleModel role =new RoleModel();
	
	public RoleModel getRole() {
		return role;
	}
	public void setRole(RoleModel role) {
		this.role = role;
	}
	public UserModel() {
		super();
	}
	public UserModel(String idUser, String userName, String password, String tenuser, String loaiuser, String gioiTinh,
			Date ngaySinh, String soDienThoai, String email, String thongTinUser, int status) {
		super();
		this.idUser = idUser;
		this.userName = userName;
		this.password = password;
		this.tenuser = tenuser;
		this.loaiuser = loaiuser;
		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.thongTinUser = thongTinUser;
		this.status = status;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTenuser() {
		return tenuser;
	}
	public void setTenuser(String tenuser) {
		this.tenuser = tenuser;
	}
	public String getLoaiuser() {
		return loaiuser;
	}
	public void setLoaiuser(String loaiuser) {
		this.loaiuser = loaiuser;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getThongTinUser() {
		return thongTinUser;
	}
	public void setThongTinUser(String thongTinUser) {
		this.thongTinUser = thongTinUser;
	}
	
}
