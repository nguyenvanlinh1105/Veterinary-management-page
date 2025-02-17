package com.petshop.service.impl;

import java.sql.Timestamp;

import javax.inject.Inject;

import com.petshop.dao.IDatDichVuDAO;
import com.petshop.model.DatDichVuModel;
import com.petshop.service.IDatDichVuService;

public class DatDichVuService implements IDatDichVuService {

	@Inject 
	private IDatDichVuDAO datDichVuDAO;
	@Override
	public DatDichVuModel saveDonHangDichVu(DatDichVuModel newModel) {
		newModel.setCreateddate(new Timestamp(System.currentTimeMillis()));
		datDichVuDAO.saveDonHangDichVu(newModel);
		return datDichVuDAO.findOneDatDichVuByID();
	}

}
