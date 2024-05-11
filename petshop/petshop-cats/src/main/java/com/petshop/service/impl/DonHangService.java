package com.petshop.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.petshop.dao.IDonHangDAO;
import com.petshop.model.DichVuModel;
import com.petshop.model.DonHangModel;
import com.petshop.paging.Pageble;
import com.petshop.service.IDonHangService;

public class DonHangService implements IDonHangService {

	@Inject 
	private IDonHangDAO donHangDAO;
	@Override
	public List<DonHangModel> findAllDonHang(Pageble pageble) {
		
		return donHangDAO.findAllDonHang(pageble);
	}

	@Override
	public Integer getTotalItemDonHang() {
		return donHangDAO.getTotalItemDonHang();
	}

	@Override
	public DonHangModel findOneDonHang(String maDonHang) {
		return donHangDAO.findOneDonHang(maDonHang);
	}

	@Override
	public DonHangModel saveDonHang(DonHangModel DonHangModel) {
		DonHangModel.setCreateddate(new Timestamp(System.currentTimeMillis()));
		Long newId= donHangDAO.saveDonHang(DonHangModel);
		return donHangDAO.findOneDonHangId(newId);
	}

	@Override
	public DonHangModel updateDonHang(DonHangModel UpdateDonHang) {
		DonHangModel oldNew = donHangDAO.findOneDonHang(UpdateDonHang.getMaDonHang());
		UpdateDonHang.setCreateddate(oldNew.getCreateddate());
		UpdateDonHang.setCreatedby(oldNew.getCreatedby());
		UpdateDonHang.setModifieddate(new Timestamp(System.currentTimeMillis()));
		
		donHangDAO.updateDichVu(UpdateDonHang);
	    return donHangDAO.findOneDonHang(UpdateDonHang.getMaDonHang());
	}

	@Override
	public void deleteDonHang(String[] ids) {
		for(String id : ids) {
			donHangDAO.deleteDichVu(id);
		}
	}

	@Override
	public List<DonHangModel> findAllDonHang() {
		
		return donHangDAO.findAllDonHang();
	}

	@Override
	public DonHangModel saveDonHangTuVan(DonHangModel DonHangTVModel) {
		DonHangTVModel.setCreateddate(new Timestamp(System.currentTimeMillis()));
		Long newId= donHangDAO.saveDonHangTV(DonHangTVModel);
		return donHangDAO.findOneDonHangId(newId);
	}


}
