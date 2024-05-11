package com.petshop.dao;

import java.util.List;

import com.petshop.model.ThuCungModel;
import com.petshop.paging.Pageble;

public interface IThuCungDAO { 

	List<ThuCungModel> findAllThuCung(Pageble pageble);
	int getTotalItemThuCung ();
	ThuCungModel findOneThuCung(String idThuCung);
	Long saveThuCung(ThuCungModel newModel);
	void updateThuCung(ThuCungModel updateModel);
	void deleteThuCung(String id);
	ThuCungModel findOneThuCung(Long newId);
	List<ThuCungModel> findAllThuCung();
	List<ThuCungModel> findAllThuCungByIdKH(String idUser);
}
