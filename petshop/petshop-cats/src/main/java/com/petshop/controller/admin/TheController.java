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
import com.petshop.model.TheModel;
import com.petshop.paging.PageRequest;
import com.petshop.paging.Pageble;
import com.petshop.service.IDonHangService;
import com.petshop.service.ITheService;
import com.petshop.service.IThuCungService;
import com.petshop.service.IUserService;
import com.petshop.sort.Sorter;
import com.petshop.utils.FormUtil;
import com.petshop.utils.MessageUtil;
@WebServlet(urlPatterns= {"/admin-the"})
public class TheController extends HttpServlet{
	@Inject 
	private IUserService userService;
	@Inject
	private ITheService theService;
	@Inject
	private IThuCungService thuCungService;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TheModel model = FormUtil.toModel(TheModel.class, req);
		String view="";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
			model.setListResult(theService.findAllThe(pageble));
			model.setTotalItem(theService.getTotalItemThe());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
			view="/views/admin/The/list.jsp";
		}else if(model.getType().equals(SystemConstant.EDIT)) {
			if(model.getIdThuCung()!=null) {
				model = theService.findOneThe(model.getIdThuCung());
				}
				req.setAttribute("khachHang", userService.findAllKhachHang());
				req.setAttribute("ThuCung", thuCungService.findAllThuCung());
				view="/views/admin/The/edit.jsp";
			}
		MessageUtil.showMessage(req);
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);

	}
}
