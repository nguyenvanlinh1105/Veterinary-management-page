package com.petshop.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petshop.constant.SystemConstant;
import com.petshop.model.ChiTietPhieuNhapModel;
import com.petshop.paging.PageRequest;
import com.petshop.paging.Pageble;
import com.petshop.service.IChiTietPhieuNhapService;
import com.petshop.service.IDichVuService;
import com.petshop.service.IPhieuNhapService;
import com.petshop.sort.Sorter;
import com.petshop.utils.FormUtil;
import com.petshop.utils.MessageUtil;
@WebServlet(urlPatterns= {"/admin-chiTietPhieuNhap"})
public class ChiTietPhieuNhapController extends HttpServlet{
	@Inject
	private IChiTietPhieuNhapService chiTietPhieuNhapService;
	@Inject 
	private IDichVuService dichVuService;
	@Inject 
	private IPhieuNhapService phieuNhapService;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ChiTietPhieuNhapModel model = FormUtil.toModel(ChiTietPhieuNhapModel.class, req);
		String view ="";
		if(model.getType().equals(SystemConstant.LIST)) {
		Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
		model.setListResult(chiTietPhieuNhapService.findAllChiTietPhieuNhap(pageble));
		model.setTotalItem(chiTietPhieuNhapService.getToltalItemChiTietPhieuNhap());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
		view="/views/admin/chiTietPhieuNhap/list.jsp";
		}else if(model.getType().equals(SystemConstant.EDIT)) {
			if(model.getMaPN()!=null && model.getIdDichVu()!=null) {
				model = chiTietPhieuNhapService.findOneChiTietPhieu(model.getMaPN(),model.getIdDichVu());
				}
				view="/views/admin/chiTietPhieuNhap/edit.jsp";
				req.setAttribute("dichVu",dichVuService.findAllDichVu());
				req.setAttribute("phieuNhap", phieuNhapService.findAllPhieuNhap());
				
			}
		MessageUtil.showMessage(req);
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}
}
