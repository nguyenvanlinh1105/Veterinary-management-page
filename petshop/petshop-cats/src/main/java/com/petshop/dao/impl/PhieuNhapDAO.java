package com.petshop.dao.impl;

import java.util.List;

import com.petshop.dao.IPhieuNhapDAO;
import com.petshop.mapper.DichVuMapper;
import com.petshop.mapper.PhieuNhapMapper;
import com.petshop.mapper.TheMapper;
import com.petshop.model.PhieuNhapModel;
import com.petshop.model.TheModel;
import com.petshop.paging.Pageble;

public class PhieuNhapDAO extends AbstractDAO<PhieuNhapModel>  implements IPhieuNhapDAO{

	@Override
	public List<PhieuNhapModel> findAllPhieuNhap(Pageble pageble) {
		StringBuilder sql = new StringBuilder("SELECT * FROM PhieuNhap");
		if(pageble.getSorter() !=null) {
			sql.append(" ORDER BY ")
			.append(pageble.getSorter().getSortName())
			.append(" ")
			.append(pageble.getSorter().getSortBy());
		}
		 if (pageble.getOffset() != null && pageble.getLimit() != null) {
		        sql.append(" OFFSET ")
		           .append(pageble.getOffset())
		           .append(" ROWS FETCH NEXT ")
		           .append(pageble.getLimit())
		           .append(" ROWS ONLY");
		    }

		return query(sql.toString(), new PhieuNhapMapper());
	}

	@Override
	public int getToltalItemPhieuNhap() {
		String sql = "Select count(*) from dbo.PhieuNhap";
		return count(sql);
	}

	
	@Override
	public PhieuNhapModel findOnePhieuNhap(String maPN) {
		String sql = "select * from PhieuNhap WHERE maPN = ?";
		List<PhieuNhapModel> pnList = query(sql, new PhieuNhapMapper(), maPN);
		    if (!pnList.isEmpty()) {
		        return pnList.get(0);
		    }
		    return null; 
	}

	@Override
	public List<PhieuNhapModel> findAllPhieuNhap() {
		String sql = "select * from dbo.PhieuNhap";
		return query(sql,new PhieuNhapMapper());
	}

	@Override
	public Long savePhieuNhap(PhieuNhapModel newModel) {
		String sql = "{CALL InsertPhieuNhap(?, ?, ?)}";
	    return insert(sql, newModel.getMaNCC(), newModel.getCreateddate(), newModel.getCreatedby());
	}

	@Override
	public PhieuNhapModel findOnePhieuNhap(Long newId) {
		String sql = "select * from PhieuNhap The  where maPN ='maPN08'";
		List<PhieuNhapModel> TList = query(sql, new PhieuNhapMapper());
		    if (!TList.isEmpty()) {
		        return TList.get(0);
		    }
		    return null; 
	}

	@Override
	public void updatePhieuNhap(PhieuNhapModel updateModel) {
		 String sql = "{CALL UpdatePhieuNhap (?, ?, ?, ?)}";
		    update(sql, 
		    		updateModel.getMaPN(),
		    		updateModel.getMaNCC(), 
		    		updateModel.getModifieddate(), 
		    		updateModel.getModifiedby());
		
	}

}