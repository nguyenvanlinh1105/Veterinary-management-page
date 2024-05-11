package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.NhaCungCapModel;


public class NhaCungCapMapper implements RowMapper<NhaCungCapModel> {

	@Override
	public NhaCungCapModel mapRow(ResultSet resultSet) {
		NhaCungCapModel nhaCungCap;
		try {
			nhaCungCap = new NhaCungCapModel();
			nhaCungCap.setMaNCC(resultSet.getString("maNCC"));
			nhaCungCap.setTenNCC(resultSet.getString("tenNCC"));
			nhaCungCap.setDiaChiNCC(resultSet.getString("diaChiNCC"));
			nhaCungCap.setSDT(resultSet.getString("SDT"));
			nhaCungCap.setNhanVienLienHe(resultSet.getString("nhanVienLienHe"));
			
			nhaCungCap.setModifieddate(resultSet.getTimestamp("modifieddate"));
				nhaCungCap.setCreateddate(resultSet.getTimestamp("createddate"));
				nhaCungCap.setModifiedby(resultSet.getString("modifiedby"));
				nhaCungCap.setCreatedby(resultSet.getString("createdby"));
	
			return nhaCungCap;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
