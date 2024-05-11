package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.TheModel;

public class TheMapper implements RowMapper<TheModel> {

	@Override
	public TheModel mapRow(ResultSet resultSet) {
		TheModel the;
		try {
			the = new TheModel();
			the.setIdThuCung(resultSet.getString("idThuCung"));
			the.setIdKhachHang(resultSet.getString("idKhachHang"));

				the.setModifieddate(resultSet.getTimestamp("modifieddate"));
				the.setCreateddate(resultSet.getTimestamp("createddate"));
				the.setModifiedby(resultSet.getString("modifiedby"));
				the.setCreatedby(resultSet.getString("createdby"));
			
			return the;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
