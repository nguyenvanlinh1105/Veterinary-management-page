package com.petshop.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.petshop.dao.IDonHangCartDAO;
import com.petshop.mapper.DonHangCartMapper;
import com.petshop.model.DonHangCartModel;
public class DonHangCartDAO extends AbstractDAO<DonHangCartModel> implements IDonHangCartDAO{

	private String idKH;
	private List<DonHangCartModel> donHangCartList = new ArrayList<>();
	@Override
	public List<DonHangCartModel> findAllDonHangCartForId(String idKhachHang) {
		idKH=idKhachHang;
		 String sql = "{CALL GetInvoiceInfo (?) }";
		 return query(sql.toString(), new DonHangCartMapper(),idKhachHang);
	}

	@Override
	public Double tinhTongTien() {
		Double tongTien = (double) 0;
	    for (DonHangCartModel donHangCart : findAllDonHangCartForId(idKH)) {
	        if (!donHangCart.getTrangThai().equals("Đã thanh toán")) {
	            tongTien += donHangCart.getThanhTien();
	        }
	    }
	    return tongTien;
	}

	@Override
	public List<DonHangCartModel> findAllDichVuCartByIdUserChuaThanhToan(String idKhachHang) {
		idKH=idKhachHang;
		 String sql = "{CALL GetInvoiceInfoChuaThanhToan (?) }";
		 return query(sql.toString(), new DonHangCartMapper(),idKhachHang);
	}

	@Override
	public void updateTrangThaiDonHang(String maDonHang, String idUser, String phThucThanhToan) {
		String sql = "{CALL sp_UpdateDonHangByIdKhachHangAndPhThucThanhToan (?,?,?) }";
		 update(sql,idUser,maDonHang,phThucThanhToan);
	}

	
	
	
	

}