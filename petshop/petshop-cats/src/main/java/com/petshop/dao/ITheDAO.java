package com.petshop.dao;

import java.util.List;

import com.petshop.model.TheModel;
import com.petshop.paging.Pageble;

public interface ITheDAO{ 
	TheModel findOneThe(String idThuCung);
	List<TheModel> findAllThe(Pageble pageble);
	int getToltalItemThe();
	void updateThe(TheModel updateThe);
	Long saveThe(TheModel newModel);
	TheModel findOneThe(Long newId);
	void deleteThe(String id);

}
