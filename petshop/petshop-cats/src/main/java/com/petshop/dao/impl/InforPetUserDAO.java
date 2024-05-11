package com.petshop.dao.impl;

import java.util.List;

import com.petshop.dao.IInforPetUserDAO;
import com.petshop.mapper.InforPetUserMapper;
import com.petshop.model.InforPetUserModel;

public class InforPetUserDAO extends AbstractDAO<InforPetUserDAO> implements IInforPetUserDAO {

	@Override
	public void savePetUser(InforPetUserModel newModel) {
		 String sql = "{CALL ThemThuCungUser(?, ?, ?, ?, ?, ?, ?)}";
		 insertDichVu(sql, newModel.getIdKhachHang(),
		    		newModel.getTenThuCung(), newModel.getTuoi(), newModel.getGioiTinh(),
		    		newModel.getLoaiThuCung(),newModel.getCreateddate(), newModel.getCreatedby());
		
	}

	@Override
	public InforPetUserModel findOnePetUserId() {
		String sql =  "{CALL LayThongTinThuCungByIdKhachHang(?)}";;
		List<InforPetUserModel> DDVList = query(sql, new InforPetUserMapper(),"KH001");
		    if (!DDVList.isEmpty()) {
		        return DDVList.get(0);
		    }
		    return null; 
	}

}
