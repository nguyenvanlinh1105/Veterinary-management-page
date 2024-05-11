package com.petshop.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.petshop.dao.IChiTietPhieuNhapDAO;
import com.petshop.mapper.ChiTietDonHangMapper;
import com.petshop.mapper.ChiTietPhieuNhapMapper;
import com.petshop.mapper.TheMapper;
import com.petshop.model.ChiTietDonHangModel;
import com.petshop.model.ChiTietPhieuNhapModel;
import com.petshop.paging.Pageble;

public class ChiTietPheuNhapDAO extends AbstractDAO<ChiTietPhieuNhapModel> implements IChiTietPhieuNhapDAO{

	@Override
	public List<ChiTietPhieuNhapModel> findAllChiTietPhieuNhap(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM ChiTietPhieuNhap");

		 if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) &&StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
		        sql.append(" ORDER BY ")
		           .append(pageble.getSorter().getSortName())
		           .append(" ")
		           .append(pageble.getSorter().getSortBy());
		    }else if(StringUtils.isBlank(pageble.getSorter().getSortName()) &&StringUtils.isBlank(pageble.getSorter().getSortBy())) {
		    	sql.append("ORDER BY (SELECT NULL) ");
		    }
		    
		    if (pageble.getOffset() != null && pageble.getLimit() != null) {
		        sql.append(" OFFSET ")
		           .append(pageble.getOffset())
		           .append(" ROWS FETCH NEXT ")
		           .append(pageble.getLimit())
		           .append(" ROWS ONLY");
		    }


	    return query(sql.toString(), new ChiTietPhieuNhapMapper());
	}

	@Override
	public int getToltalItemChiTietPhieuNhap() {
		String sql ="select count(*) from dbo.ChiTietPhieuNhap";
		return count(sql);
	}

	@Override
	public ChiTietPhieuNhapModel findOneChiTietPhieuNhap(String maPN, String idDichVu) {
		String sql = "select * from ChiTietPhieuNhap WHERE maPN = ? and idDichVu = ?";
		List<ChiTietPhieuNhapModel> pnList = query(sql, new ChiTietPhieuNhapMapper(), maPN, idDichVu);
		    if (!pnList.isEmpty()) {
		        return pnList.get(0);
		    }
		    return null; 
	}

	@Override
	public Long saveChiTietPhieuNhap(ChiTietPhieuNhapModel updatePN) {
		 String sql = "{CALL InsertChiTietPhieuNhap(?, ?, ?, ?, ?, ?)}";
		    return insert(sql, updatePN.getMaPN(),
		    		updatePN.getIdDichVu(), updatePN.getSoLuongNhap(),
		    		updatePN.getGiaNhap(), 
		    		updatePN.getCreateddate(), updatePN.getCreatedby());

	}

	@Override
	public ChiTietPhieuNhapModel findOneChiTietPhieuNhapByID(Long newId) {
		String sql = "select * from ChiTietDonHang WHERE maDonHang = 'DH001' and idDichVu ='DV001'";
		List<ChiTietPhieuNhapModel> userList = query(sql, new ChiTietPhieuNhapMapper());
		    if (!userList.isEmpty()) {
		        return userList.get(0);
		    }
		    return null;
	}

	@Override
	public void updateChiTietPhieuNhap(ChiTietPhieuNhapModel updatePN) {
		 String sql = "{CALL UpdateChiTietPhieuNhap(?, ?, ?, ?, ?, ?)}";
		    update (sql, updatePN.getMaPN(),
		    		updatePN.getIdDichVu(), updatePN.getSoLuongNhap(),
		    		updatePN.getGiaNhap(), 
		    		updatePN.getModifieddate(), updatePN.getModifiedby());
		
	}

	
}
