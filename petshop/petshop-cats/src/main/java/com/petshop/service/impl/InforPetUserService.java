package com.petshop.service.impl;

import java.sql.Timestamp;

import javax.inject.Inject;

import com.petshop.dao.IInforPetUserDAO;
import com.petshop.model.InforPetUserModel;
import com.petshop.service.IInforPetUserService;

public class InforPetUserService implements IInforPetUserService{

	@Inject 
	private IInforPetUserDAO inforPetUserDAO;
	@Override
	public InforPetUserModel savePetUser(InforPetUserModel newModel) {
		newModel.setCreateddate(new Timestamp(System.currentTimeMillis()));
		 inforPetUserDAO.savePetUser(newModel);
		return inforPetUserDAO.findOnePetUserId();
	}


}
