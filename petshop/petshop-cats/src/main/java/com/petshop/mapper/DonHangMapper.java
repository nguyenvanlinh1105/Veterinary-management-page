package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.DichVuModel;
import com.petshop.model.DonHangModel;

public class DonHangMapper   implements RowMapper<DonHangModel> {

	@Override
	public DonHangModel mapRow(ResultSet resultSet) {
		DonHangModel donHang;
		try {
			donHang = new DonHangModel();
			donHang.setMaDonHang(resultSet.getString("maDonHang"));
			donHang.setIdKhachHang(resultSet.getString("idKhachHang"));
			donHang.setSdtGiaoHang(resultSet.getString("sdtGiaoHang"));
			donHang.setDiaChiGiaoHang(resultSet.getString("diaChiGiaoHang"));
			donHang.setNgayGiaoHang(resultSet.getDate("ngayGiaoHang"));
			donHang.setPhThucThanhToan(resultSet.getString("phThucThanhToan"));
			donHang.setNgayThanhToan(resultSet.getTimestamp("ngayThanhToan"));
			donHang.setTrangThai(resultSet.getString("trangThai"));

			
				donHang.setModifieddate(resultSet.getTimestamp("modifieddate"));
				donHang.setCreateddate(resultSet.getTimestamp("createddate"));

				donHang.setModifiedby(resultSet.getString("modifiedby"));

				donHang.setCreatedby(resultSet.getString("createdby"));
			
			return donHang;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
