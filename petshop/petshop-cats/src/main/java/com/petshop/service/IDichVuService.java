package com.petshop.service;

import java.util.List;

import com.petshop.model.DichVuModel;
import com.petshop.model.UserModel;
import com.petshop.paging.Pageble;

public interface IDichVuService {
	List<DichVuModel> findAllDichVu(Pageble pageble);
	int getTotalItemDichVu();
	DichVuModel findOneDichVu(String idDichVu);
	DichVuModel saveDichVu(DichVuModel newModel);
	void deleteDichVu(String[] ids);
	DichVuModel updateDichVu(DichVuModel updateDV);
	List<DichVuModel>  findAllDichVu();
}
