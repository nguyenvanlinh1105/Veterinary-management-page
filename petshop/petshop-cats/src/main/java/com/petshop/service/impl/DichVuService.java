package com.petshop.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.petshop.dao.IDichVuDAO;
import com.petshop.model.DichVuModel;
import com.petshop.paging.Pageble;
import com.petshop.service.IDichVuService;

public class DichVuService implements IDichVuService {

	@Inject 
	private IDichVuDAO DichVuDAO;
	@Override
	public List<DichVuModel> findAllDichVu(Pageble pageble) {		
		return DichVuDAO.findAllDichVu(pageble);
	}

	@Override
	public int getTotalItemDichVu() {
		return DichVuDAO.getToltalItemDichVu();
	}

	@Override
	public DichVuModel findOneDichVu(String idDichVu) {
		return DichVuDAO.findOneDichVu(idDichVu);
	}

	@Override
	public DichVuModel saveDichVu(DichVuModel newModel) {
		newModel.setCreateddate(new Timestamp(System.currentTimeMillis()));
		Long newId= DichVuDAO.saveDichVu(newModel);
		return DichVuDAO.findOneDichVuOut(newId);
	}

	@Override
	public DichVuModel updateDichVu(DichVuModel updateDV) {
		DichVuModel oldNew = DichVuDAO.findOneDichVu(updateDV.getIdDichVu());
		updateDV.setCreateddate(oldNew.getCreateddate());
		updateDV.setCreatedby(oldNew.getCreatedby());
		updateDV.setModifieddate(new Timestamp(System.currentTimeMillis()));
		
		DichVuDAO.updateDichVu(updateDV);
	     return DichVuDAO.findOneDichVu(updateDV.getIdDichVu());
	}

	@Override
	public void deleteDichVu(String[] ids) {
		for(String id : ids) {
			DichVuDAO.deleteDichVu(id);
		}
	}

	@Override
	public List<DichVuModel> findAllDichVu() {
		
		return DichVuDAO.findAllDichVu();
	}

}
