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
import com.petshop.model.ThuCungModel;
import com.petshop.paging.PageRequest;
import com.petshop.paging.Pageble;
import com.petshop.service.IThuCungService;
import com.petshop.sort.Sorter;
import com.petshop.utils.FormUtil;
import com.petshop.utils.MessageUtil;
@WebServlet(urlPatterns= {"/admin-thuCung"})
public class ThuCungController extends HttpServlet{
	@Inject
	private IThuCungService thuCungService;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ThuCungModel model = FormUtil.toModel(ThuCungModel.class, req);
		String view="";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
			model.setListResult(thuCungService.findAllThuCung(pageble));
			model.setTotalItem(thuCungService.getTotalItemThuCung());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
			view ="/views/admin/ThuCung/list.jsp";
		}else if(model.getType().equals(SystemConstant.EDIT)) {
			if(model.getIdThuCung()!=null) {
				model = thuCungService.findOneThuCung(model.getIdThuCung());
			}
			view="/views/admin/ThuCung/edit.jsp";
		}
		
		MessageUtil.showMessage(req);
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);

	}
}
