package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.RoleModel;
import com.petshop.model.UserModel;

public class UserMapper implements RowMapper<UserModel>{

	@Override
	public UserModel mapRow(ResultSet resultSet) {
		UserModel users;
		try {
			users = new UserModel();
			users.setIdUser(resultSet.getString("idUser"));
			users.setUserName(resultSet.getString("userName"));
			users.setTenuser(resultSet.getString("tenuser"));
			users.setPassword(resultSet.getString("password"));
			users.setLoaiuser(resultSet.getString("loaiuser"));
			users.setGioiTinh(resultSet.getString("gioiTinh"));
			users.setNgaySinh(resultSet.getDate("ngaySinh"));
			users.setSoDienThoai(resultSet.getString("soDienThoai"));
			users.setEmail(resultSet.getString("email"));
			users.setThongTinUser(resultSet.getString("thongTinUser"));
		
				users.setModifieddate(resultSet.getTimestamp("modifieddate"));
				users.setCreateddate(resultSet.getTimestamp("createddate"));
			
				users.setModifiedby(resultSet.getString("modifiedby"));
				users.setCreatedby(resultSet.getString("createdby"));

			users.setStatus(resultSet.getInt("status"));
			try {
				RoleModel role = new RoleModel();
				role.setCode(resultSet.getString("code"));
				role.setName(resultSet.getString("name"));
				users.setRole(role);
			}catch(Exception e) {
				System.out.print(e.getMessage());
			}
			
			return users;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
