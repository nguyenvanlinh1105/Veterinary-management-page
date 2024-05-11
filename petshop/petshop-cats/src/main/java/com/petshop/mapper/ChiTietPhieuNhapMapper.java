package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.ChiTietPhieuNhapModel;

public class ChiTietPhieuNhapMapper implements RowMapper<ChiTietPhieuNhapModel> {

	@Override
	public ChiTietPhieuNhapModel mapRow(ResultSet resultSet) {
		ChiTietPhieuNhapModel chiTietPhieuNhap;
		try {
			chiTietPhieuNhap = new ChiTietPhieuNhapModel();
			chiTietPhieuNhap.setMaPN(resultSet.getString("maPN"));
			chiTietPhieuNhap.setIdDichVu(resultSet.getString("idDichVu"));
			chiTietPhieuNhap.setSoLuongNhap(resultSet.getInt("soLuongNhap"));
			chiTietPhieuNhap.setGiaNhap(resultSet.getFloat("giaNhap"));

			chiTietPhieuNhap.setModifieddate(resultSet.getTimestamp("modifieddate"));{
			chiTietPhieuNhap.setCreateddate(resultSet.getTimestamp("createddate"));
			chiTietPhieuNhap.setModifiedby(resultSet.getString("modifiedby"));
			chiTietPhieuNhap.setCreatedby(resultSet.getString("createdby"));
			}
			
			return chiTietPhieuNhap;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
