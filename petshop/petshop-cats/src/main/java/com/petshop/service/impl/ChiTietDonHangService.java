package com.petshop.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.petshop.dao.IChiTietDonHangDAO;
import com.petshop.model.ChiTietDonHangModel;
import com.petshop.model.DichVuModel;
import com.petshop.model.UserModel;
import com.petshop.paging.Pageble;
import com.petshop.service.IChiTietDonHangService;

public class ChiTietDonHangService implements IChiTietDonHangService
{
	@Inject 
	private IChiTietDonHangDAO ChiTietDonHangDAO;

	@Override
	public List<ChiTietDonHangModel> findAllChiTietDonHang(Pageble pageble) {
		return ChiTietDonHangDAO.findAllChiTietDonHang(pageble);
	}

	@Override
	public int getTotalItemChiTietDonHang() {
		return ChiTietDonHangDAO.getTotalItemChiTietDonHang();
	}


	@Override
	public ChiTietDonHangModel findOneChiTietDonHang(String maDonHang, String idDichVu) {
		return ChiTietDonHangDAO.findOneChiTietDonHang(maDonHang, idDichVu);
	}


	@Override
	public ChiTietDonHangModel saveChiTietDonHang(ChiTietDonHangModel CTDHModel) {
		CTDHModel.setCreateddate(new Timestamp(System.currentTimeMillis()));
		Long newId= ChiTietDonHangDAO.saveDonHang(CTDHModel);
		return ChiTietDonHangDAO.findOneDonHangByID(newId);
	}

	@Override
	public ChiTietDonHangModel updateChiTietDonHang(ChiTietDonHangModel updateCTDH) {
		updateCTDH.setModifieddate(new Timestamp(System.currentTimeMillis()));
		ChiTietDonHangDAO.updateChiTietDonHang(updateCTDH);
		return ChiTietDonHangDAO.findOneChiTietDonHang(updateCTDH.getMaDonHang(), updateCTDH.getIdDichVu());
	}

	@Override
	public void deleteDonHang(String[] ids) {
	    for(String id : ids) { 
	        String[] parts = id.split("-");
	       
	        if(parts.length == 2) {
	            String maDonHang = parts[0]; 
	            String idDichVu = parts[1];        
	            ChiTietDonHangDAO.deleteChiTietDonHang(maDonHang,idDichVu);
	        } else {
	            System.err.println("Chuỗi không hợp lệ: " + id);
	        }
	    }
	}



}
