package com.petshop.service;

import java.util.List;

import com.petshop.model.DonHangModel;
import com.petshop.model.TheModel;
import com.petshop.paging.Pageble;

public interface ITheService {
	List<TheModel> findAllThe(Pageble pageble);
	int getTotalItemThe();
	TheModel findOneThe(String idThuCung);
	TheModel saveThe(TheModel newModel);
	void deleteThe(String[] ids);
	TheModel updateThe(TheModel updateThe);}
