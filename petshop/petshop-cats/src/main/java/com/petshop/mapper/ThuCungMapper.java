package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.DichVuModel;
import com.petshop.model.ThuCungModel;

public class ThuCungMapper implements RowMapper<ThuCungModel> {

	@Override
	public ThuCungModel mapRow(ResultSet resultSet) {
		ThuCungModel thuCung;
		try {
			thuCung = new ThuCungModel();
			thuCung.setIdThuCung(resultSet.getString("idThuCung"));
			thuCung.setTenThuCung(resultSet.getString("tenThuCung"));
			thuCung.setGioiTinh(resultSet.getString("gioiTinh"));
			thuCung.setLoaiThuCung(resultSet.getString("loaiThuCung"));
			thuCung.setTuoi(resultSet.getInt("tuoi"));

				thuCung.setModifieddate(resultSet.getTimestamp("modifieddate"));{
				thuCung.setCreateddate(resultSet.getTimestamp("createddate"));
				thuCung.setModifiedby(resultSet.getString("modifiedby"));
				thuCung.setCreatedby(resultSet.getString("createdby"));
			}
			
			return thuCung;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
