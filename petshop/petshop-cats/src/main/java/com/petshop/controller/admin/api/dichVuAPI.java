package com.petshop.controller.admin.api;



import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.DichVuModel;
import com.petshop.model.UserModel;
import com.petshop.service.IDichVuService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-admin-dichVu"})
public class dichVuAPI extends HttpServlet{
	@Inject 
	private IDichVuService dichVuService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		DichVuModel newModel = HttpUtil.of(req.getReader()).toModel(DichVuModel.class);
		newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		newModel = dichVuService.saveDichVu(newModel);
		mapper.writeValue(resp.getOutputStream(), newModel);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		DichVuModel updateDV = HttpUtil.of(req.getReader()).toModel(DichVuModel.class);
		updateDV.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		updateDV = dichVuService.updateDichVu(updateDV);
		mapper.writeValue(resp.getOutputStream(), updateDV);
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		UserModel newModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
		dichVuService.deleteDichVu(newModel.getIds());
		mapper.writeValue(resp.getOutputStream(), "{}");
	}
}
