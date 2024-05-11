package com.petshop.dao;

import java.util.List;

import com.petshop.model.RoleModel;
import com.petshop.paging.Pageble;

public interface IRoleDAO {
	List<RoleModel> findAll(); 
	RoleModel findOne(Long id);
	List<RoleModel> findByroleId(Long categoryId);
	Long save (RoleModel newModel);
	void update (RoleModel updateNew);
	void delete( long id);
	List<RoleModel> findAll(Pageble pageble);
	int getToltalItem ();
}
