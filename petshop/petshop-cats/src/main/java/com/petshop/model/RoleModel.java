package com.petshop.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class RoleModel {
	 private int roleId;
	 private String name;
	 private String code;
	 private Timestamp createddate;
	 private Timestamp modifieddate;
	 private String createdby;
	 private String modifiedby;
	 
	public RoleModel() {
		super();
	}
	public RoleModel(int roleId, String name, String code, Timestamp createddate, Timestamp modifieddate,
			String createdby, String modifiedby) {
		super();
		this.roleId = roleId;
		this.name = name;
		this.code = code;
		this.createddate = createddate;
		this.modifieddate = modifieddate;
		this.createdby = createdby;
		this.modifiedby = modifiedby;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Timestamp getCreateddate() {
		return createddate;
	}
	public void setCreateddate(Timestamp createddate) {
		this.createddate = createddate;
	}
	public Timestamp getModifieddate() {
		return modifieddate;
	}
	public void setModifieddate(Timestamp modifieddate) {
		this.modifieddate = modifieddate;
	}
	public String getCreatedby() {
		return createdby;
	}
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	public String getModifiedby() {
		return modifiedby;
	}
	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}
	 
	 
}
