package com.petshop.service;

import java.util.List;

import com.petshop.model.PhieuNhapModel;
import com.petshop.paging.Pageble;

public interface IPhieuNhapService {
	List<PhieuNhapModel> findAllPhieuNhap(Pageble pageble);
	Integer getToltalItemPhieuNhap();
	PhieuNhapModel findOnePhieuNhap(String maPN);
	List<PhieuNhapModel> findAllPhieuNhap();
	PhieuNhapModel savePhieuNhap(PhieuNhapModel newModel);
	PhieuNhapModel updatePhieuNhap(PhieuNhapModel updateModel);
	void deletePhieuNhap(String[] ids);
}
