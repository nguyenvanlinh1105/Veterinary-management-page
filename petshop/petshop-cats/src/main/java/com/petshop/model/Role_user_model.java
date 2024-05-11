package com.petshop.model;

public class Role_user_model {
	private String roleId ;
	private String idUser ;
	
	
	public Role_user_model() {
		super();
	}
	public Role_user_model(String roleId, String idUser) {
		super();
		this.roleId = roleId;
		this.idUser = idUser;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
	
}
