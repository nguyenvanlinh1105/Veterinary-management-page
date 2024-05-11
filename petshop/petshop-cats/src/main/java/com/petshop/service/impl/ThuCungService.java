package com.petshop.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.petshop.dao.IThuCungDAO;
import com.petshop.model.ThuCungModel;
import com.petshop.paging.Pageble;
import com.petshop.service.IThuCungService;

public class ThuCungService implements IThuCungService {
	
	@Inject 
	private IThuCungDAO thuCungDAO;
	@Override
	public List<ThuCungModel> findAllThuCung(Pageble pageble) {
		
		return thuCungDAO.findAllThuCung( pageble);
	}

	@Override
	public Integer getTotalItemThuCung() {
		return thuCungDAO.getTotalItemThuCung();
	}

	@Override
	public ThuCungModel findOneThuCung(String idThuCung) {
		return thuCungDAO.findOneThuCung(idThuCung);
	}

	@Override
	public ThuCungModel saveThuCung(ThuCungModel newModel) {
		newModel.setCreateddate(new Timestamp(System.currentTimeMillis()));
		Long newId= thuCungDAO.saveThuCung(newModel);
		return thuCungDAO.findOneThuCung(newId);
	}

	@Override
	public ThuCungModel updateThuCung(ThuCungModel updateModel) {
		updateModel.setModifieddate(new Timestamp(System.currentTimeMillis()));
		thuCungDAO.updateThuCung(updateModel);
	     return thuCungDAO.findOneThuCung(updateModel.getIdThuCung());
	}

	@Override
	public void deleteThuCung(String[] ids) {
		for(String id : ids) {
			thuCungDAO.deleteThuCung(id);
		}
		
	}

	@Override
	public List<ThuCungModel> findAllThuCung() {
		return thuCungDAO.findAllThuCung();
	}

	@Override
	public List<ThuCungModel> findAllThuCungByIdKH(String idUser) {
		return thuCungDAO.findAllThuCungByIdKH( idUser);
	}

}
