package com.simbaart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.service.IPhotoCategoryService;

@Controller(value = "photoCategoryControllerOfAdmin")
public class PhotoCategoryController {

	@Autowired
	private IPhotoCategoryService photoCategoryService;

	@RequestMapping(value = "/admin/photo/category", method = RequestMethod.GET)
	public ModelAndView listPhotoCategory(@ModelAttribute("model") PhotoCategoryDTO model) {
		ModelAndView mav = new ModelAndView("admin/photo/category");
		model.setListResult(photoCategoryService.findAll());
		mav.addObject("model", model);
		return mav;
	}
}
