package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.DichVuModel;
import com.petshop.model.RoleModel;
import com.petshop.model.UserModel;

public class DichVuMapper implements RowMapper<DichVuModel> {

	@Override
	public DichVuModel mapRow(ResultSet resultSet) {
		DichVuModel dichVu;
		try {
			dichVu = new DichVuModel();
			dichVu.setIdDichVu(resultSet.getString("idDichVu"));
			dichVu.setTenDichVu(resultSet.getString("tenDichVu"));
			dichVu.setDonGia(resultSet.getFloat("donGia"));
			dichVu.setThuongHieu(resultSet.getString("thuongHieu"));
			dichVu.setLoaiSanPham(resultSet.getString("loaiSanPham"));
			dichVu.setSoLuongHienCon(resultSet.getInt("soLuongHienCon"));
			dichVu.setSoLuongDaBan(resultSet.getInt("soLuongDaBan"));
			dichVu.setDonViTinh(resultSet.getString("donViTinh"));

			
				dichVu.setModifieddate(resultSet.getTimestamp("modifieddate"));
				dichVu.setCreateddate(resultSet.getTimestamp("createddate"));		
				dichVu.setModifiedby(resultSet.getString("modifiedby"));
				dichVu.setCreatedby(resultSet.getString("createdby"));

			return dichVu;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
