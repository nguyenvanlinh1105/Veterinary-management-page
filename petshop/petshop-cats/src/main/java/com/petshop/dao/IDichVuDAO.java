package com.petshop.dao;

import java.util.List;

import com.petshop.model.DichVuModel;
import com.petshop.paging.Pageble;

public interface IDichVuDAO {
	
	List<DichVuModel> findAllDichVu(Pageble pageble);
	int getToltalItemDichVu();
	DichVuModel findOneDichVu(String idDichVu);
	Long saveDichVu(DichVuModel newModel);
	DichVuModel findOneDichVuOut(Long newId);
	void updateDichVu(DichVuModel updateDV);
	void deleteDichVu(String id);
	List<DichVuModel> findAllDichVu();

}
