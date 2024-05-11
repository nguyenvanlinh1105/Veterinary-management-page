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
import com.petshop.model.DichVuModel;
import com.petshop.model.UserModel;
import com.petshop.paging.PageRequest;
import com.petshop.paging.Pageble;
import com.petshop.service.IDichVuService;
import com.petshop.service.IUserService;
import com.petshop.sort.Sorter;
import com.petshop.utils.FormUtil;
import com.petshop.utils.MessageUtil;
@WebServlet(urlPatterns= {"/admin-dichVu"})
public class DichVuController extends HttpServlet{
	@Inject
	private IDichVuService dichVuService;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DichVuModel model = FormUtil.toModel(DichVuModel.class, req);
		String view="";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
			model.setListResult(dichVuService.findAllDichVu(pageble));
			model.setTotalItem(dichVuService.getTotalItemDichVu());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
			System.out.print("Có làm gì đâu :)");
			view ="/views/admin/dichVu/list.jsp";
		}else if(model.getType().equals(SystemConstant.EDIT)) {
			if(model.getIdDichVu()!=null) {
				model = dichVuService.findOneDichVu(model.getIdDichVu());
			}
			view="/views/admin/dichVu/edit.jsp";
		}
		
		MessageUtil.showMessage(req);
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);

	}
}
