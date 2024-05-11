package com.petshop.mapper;

import java.sql.ResultSet;

import com.petshop.model.ChiTietDonHangModel;

public class ChiTietDonHangMapper implements RowMapper<ChiTietDonHangModel>{

	@Override
	public ChiTietDonHangModel mapRow(ResultSet resultSet) {
		ChiTietDonHangModel ctdhModel ;
		try {
			ctdhModel = new ChiTietDonHangModel();
			ctdhModel.setMaDonHang(resultSet.getString("maDonHang"));
			ctdhModel.setIdDichVu(resultSet.getString("idDichVu"));
			ctdhModel.setIdBacSi(resultSet.getString("idBacSi"));
			ctdhModel.setIdNhanVien(resultSet.getString("idNhanVien"));
			ctdhModel.setSoLuong(resultSet.getInt("soLuong"));
			ctdhModel.setModifieddate(resultSet.getTimestamp("modifieddate"));
			ctdhModel.setCreateddate(resultSet.getTimestamp("createddate"));
			ctdhModel.setModifiedby(resultSet.getString("modifiedby"));
			ctdhModel.setCreatedby(resultSet.getString("createdby"));

			
			return ctdhModel;
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return null;
		
		
	}

}
