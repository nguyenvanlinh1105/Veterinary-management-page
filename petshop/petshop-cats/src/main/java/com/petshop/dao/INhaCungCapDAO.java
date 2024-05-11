package com.petshop.dao;

import java.util.List;

import com.petshop.model.NhaCungCapModel;
import com.petshop.paging.Pageble;

public interface INhaCungCapDAO {
	List<NhaCungCapModel> findAllNhaCungCap(Pageble pageble);
	int getToltalItemNhaCungCap();
	NhaCungCapModel findOneNhaCungCap(String maNCC);
	List<NhaCungCapModel> findAllNhaCungCap();
	Long saveNhaCungCap(NhaCungCapModel newModel);
	NhaCungCapModel findOneNhaCungCapById(Long newId);
	void updateNhaCungCap(NhaCungCapModel updateModel);
	void deleteNhaCungCap(String id);
}
