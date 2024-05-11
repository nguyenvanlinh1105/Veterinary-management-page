package com.petshop.service;

import java.util.List;

import com.petshop.model.ThuCungModel;
import com.petshop.paging.Pageble;

public interface IThuCungService {

	List<ThuCungModel> findAllThuCung(Pageble pageble);

	Integer getTotalItemThuCung();

	ThuCungModel findOneThuCung(String idThuCung);

	ThuCungModel saveThuCung(ThuCungModel newModel);

	ThuCungModel updateThuCung(ThuCungModel updateModel);

	void deleteThuCung(String[] ids);

	List<ThuCungModel> findAllThuCung();

	List<ThuCungModel> findAllThuCungByIdKH(String idUser);


}
