package com.petshop.controller.web.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.petshop.model.InforPetUserModel;
import com.petshop.model.ThuCungModel;
import com.petshop.model.UserModel;
import com.petshop.service.IInforPetUserService;
import com.petshop.service.IThuCungService;
import com.petshop.utils.HttpUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/api-web-pet"})
public class PetUserAPI extends HttpServlet{
	@Inject 
	private IInforPetUserService inforPerUserService;
	@Inject IThuCungService thuCungService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		InforPetUserModel newModel = HttpUtil.of(req.getReader()).toModel(InforPetUserModel.class);
		newModel.setCreatedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		newModel.setIdKhachHang(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getIdUser());
		newModel = inforPerUserService.savePetUser(newModel);
		mapper.writeValue(resp.getOutputStream(), newModel);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		ThuCungModel updateModel = HttpUtil.of(req.getReader()).toModel(ThuCungModel.class);
		updateModel.setModifiedby(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getTenuser());
		updateModel = thuCungService.updateThuCung(updateModel);
		mapper.writeValue(resp.getOutputStream(), updateModel);
	}

}
