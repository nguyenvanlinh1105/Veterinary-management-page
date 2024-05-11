package com.petshop.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.NhaCungCapModel;
import com.petshop.model.ThuCungModel;
import com.petshop.model.UserModel;
import com.petshop.service.INhaCungCapService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-admin-dsNhaCC"})
public class NhaCungCapAPI extends HttpServlet{
	
	@Inject
	private INhaCungCapService nhaCungCapService;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			NhaCungCapModel newModel = HttpUtil.of(req.getReader()).toModel(NhaCungCapModel.class);
			newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
			newModel = nhaCungCapService.saveNhaCungCap(newModel);
			mapper.writeValue(resp.getOutputStream(), newModel);
		}
		@Override
		protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			NhaCungCapModel updateModel = HttpUtil.of(req.getReader()).toModel(NhaCungCapModel.class);
			updateModel.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
			updateModel = nhaCungCapService.updateNhaCungCap(updateModel);
			mapper.writeValue(resp.getOutputStream(), updateModel);
		}
		@Override
		protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			ObjectMapper mapper = new ObjectMapper();
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			NhaCungCapModel newModel = HttpUtil.of(req.getReader()).toModel(NhaCungCapModel.class);
			
			nhaCungCapService.deleteNhaCungCap(newModel.getIds());
			mapper.writeValue(resp.getOutputStream(), "{}");
		}
	
}
