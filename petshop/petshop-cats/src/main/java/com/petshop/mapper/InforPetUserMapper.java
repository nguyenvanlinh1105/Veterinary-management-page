package com.petshop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.InforPetUserModel;

public class InforPetUserMapper implements RowMapper<InforPetUserModel>{

	@Override
	public InforPetUserModel mapRow(ResultSet resultSet) {

		InforPetUserModel InforPetUser;
		try {
			InforPetUser = new InforPetUserModel();
			InforPetUser.setIdKhachHang(resultSet.getString("idKhachHang"));
			InforPetUser.setIdThuCung(resultSet.getString("idThuCung"));
			InforPetUser.setTenThuCung(resultSet.getString("tenThuCung"));
			InforPetUser.setGioiTinh(resultSet.getString("gioiTinh"));
			InforPetUser.setLoaiThuCung(resultSet.getString("loaiThuCung"));
			InforPetUser.setTuoi(resultSet.getInt("tuoi"));

			InforPetUser.setModifieddate(resultSet.getTimestamp("modifieddate"));{
				InforPetUser.setCreateddate(resultSet.getTimestamp("createddate"));
				InforPetUser.setModifiedby(resultSet.getString("modifiedby"));
				InforPetUser.setCreatedby(resultSet.getString("createdby"));
			}
			
			return InforPetUser;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}

}