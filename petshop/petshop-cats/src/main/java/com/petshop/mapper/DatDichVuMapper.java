package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.DatDichVuModel;
import com.petshop.model.DichVuModel;

public class DatDichVuMapper implements RowMapper<DatDichVuModel> {

	@Override
	public DatDichVuModel mapRow(ResultSet resultSet) {
		DatDichVuModel datDichVu;
		try {
			datDichVu = new DatDichVuModel();
			datDichVu.setIdDichVu(resultSet.getString("idDichVu"));
			datDichVu.setIdKhachHang(resultSet.getString("idKhachHang"));
			datDichVu.setSdtGiaoHang(resultSet.getString("sdtGiaoHang"));
			datDichVu.setDiaChiGiaoHang(resultSet.getString("diaChiGiaoHang"));
			datDichVu.setPhThucThanhToan(resultSet.getString("phThucThanhToan"));
			datDichVu.setSoLuong(resultSet.getInt("soLuong"));
			datDichVu.setModifieddate(resultSet.getTimestamp("modifieddate"));
			datDichVu.setCreateddate(resultSet.getTimestamp("createddate"));		
			datDichVu.setModifiedby(resultSet.getString("modifiedby"));
			datDichVu.setCreatedby(resultSet.getString("createdby"));

			return datDichVu;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
