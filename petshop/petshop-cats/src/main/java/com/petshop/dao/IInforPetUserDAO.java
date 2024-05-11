package com.petshop.dao;

import com.petshop.model.InforPetUserModel;

public interface IInforPetUserDAO {

	void savePetUser(InforPetUserModel newModel);

	InforPetUserModel findOnePetUserId();

}
