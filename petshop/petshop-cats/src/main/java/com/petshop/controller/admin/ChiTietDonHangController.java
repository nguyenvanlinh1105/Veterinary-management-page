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
import com.petshop.model.ChiTietDonHangModel;
import com.petshop.paging.PageRequest;
import com.petshop.paging.Pageble;
import com.petshop.service.IChiTietDonHangService;
import com.petshop.service.IDichVuService;
import com.petshop.service.IDonHangService;
import com.petshop.service.IUserService;
import com.petshop.sort.Sorter;
import com.petshop.utils.FormUtil;
import com.petshop.utils.MessageUtil;
@WebServlet(urlPatterns= {"/admin-chiTietDonHang"})
public class ChiTietDonHangController extends HttpServlet{
	@Inject
	private IChiTietDonHangService chiTietDonHangService;
	@Inject 
	private IUserService userService;
	@Inject 
	private IDichVuService dichVuService;
	@Inject IDonHangService DonHangService;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ChiTietDonHangModel model = FormUtil.toModel(ChiTietDonHangModel.class, req);
		String view="";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
			model.setListResult(chiTietDonHangService.findAllChiTietDonHang(pageble));
			model.setTotalItem(chiTietDonHangService.getTotalItemChiTietDonHang());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
			view ="/views/admin/chiTietDonHang/list.jsp";
		}else if(model.getType().equals(SystemConstant.EDIT)) {
			if(model.getMaDonHang()!=null) {
				model = chiTietDonHangService.findOneChiTietDonHang(model.getMaDonHang(), model.getIdDichVu());
			}
			req.setAttribute("DonHang", DonHangService.findAllDonHang());
			req.setAttribute("DichVu", dichVuService.findAllDichVu());
			req.setAttribute("khachHang", userService.findAllKhachHang());
			req.setAttribute("BacSi", userService.findAllBacSi());
			req.setAttribute("NhanVien", userService.findAllNhanVien());
			view="/views/admin/chiTietDonHang/edit.jsp";
		}
		
		MessageUtil.showMessage(req);
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);

	}
}
