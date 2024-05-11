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
import com.petshop.model.NhaCungCapModel;
import com.petshop.paging.PageRequest;
import com.petshop.paging.Pageble;
import com.petshop.service.INhaCungCapService;
import com.petshop.sort.Sorter;
import com.petshop.utils.FormUtil;
import com.petshop.utils.MessageUtil;
@WebServlet(urlPatterns= {"/admin-dsNhaCC"})
public class NhaCungCapController extends HttpServlet{
	@Inject
	private INhaCungCapService nhaCungCapService;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NhaCungCapModel model = FormUtil.toModel(NhaCungCapModel.class, req);
		String view="";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(), new Sorter(model.getSortName(), model.getSortBy()));
			model.setListResult(nhaCungCapService.findAllNhaCungCap(pageble));
			model.setTotalItem(nhaCungCapService.getToltalItemNhaCungCap());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
			view ="/views/admin/nhaCungCap/list.jsp";
		}else if(model.getType().equals(SystemConstant.EDIT)) {
			if(model.getMaNCC()!=null) {
				model = nhaCungCapService.findOneNhaCungCap(model.getMaNCC());
			}
			view="/views/admin/nhaCungCap/edit.jsp";
		}
		
		MessageUtil.showMessage(req);
		req.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);

	}
}
