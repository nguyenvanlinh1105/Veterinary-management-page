package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.PhieuNhapModel;

public class PhieuNhapMapper implements RowMapper<PhieuNhapModel> {

	@Override
	public PhieuNhapModel mapRow(ResultSet resultSet) {
		PhieuNhapModel phieuNhap;
		try {
			phieuNhap = new PhieuNhapModel();
			phieuNhap.setMaNCC(resultSet.getString("maNCC"));
			phieuNhap.setMaPN(resultSet.getString("maPN"));

			phieuNhap.setModifieddate(resultSet.getTimestamp("modifieddate"));{
			phieuNhap.setCreateddate(resultSet.getTimestamp("createddate"));
			phieuNhap.setModifiedby(resultSet.getString("modifiedby"));
			phieuNhap.setCreatedby(resultSet.getString("createdby"));
			}
			
			return phieuNhap;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
