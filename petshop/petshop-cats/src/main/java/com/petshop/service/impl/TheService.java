package com.petshop.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.petshop.dao.ITheDAO;
import com.petshop.model.DonHangModel;
import com.petshop.model.TheModel;
import com.petshop.paging.Pageble;
import com.petshop.service.ITheService;

public class TheService implements ITheService{
	@Inject 
	private ITheDAO theDAO;

	@Override
	public List<TheModel> findAllThe(Pageble pageble) {
		return theDAO.findAllThe(pageble);
	}

	@Override
	public int getTotalItemThe() {
		return theDAO.getToltalItemThe();
	}

	@Override
	public TheModel findOneThe(String idThuCung) {
		return theDAO.findOneThe(idThuCung);
	}


	@Override
	public TheModel saveThe(TheModel newModel) {
		newModel.setCreateddate(new Timestamp(System.currentTimeMillis()));
		Long newId= theDAO.saveThe(newModel);
		return theDAO.findOneThe(newId);
	}

	@Override
	public TheModel updateThe(TheModel updateThe) {
		updateThe.setModifieddate(new Timestamp(System.currentTimeMillis()));
		theDAO.updateThe(updateThe);
	     return theDAO.findOneThe(updateThe.getIdThuCung());
	}

	@Override
	public void deleteThe(String[] ids) {
		for(String id : ids) {
			theDAO.deleteThe(id);
		}
		
	}
	
}
