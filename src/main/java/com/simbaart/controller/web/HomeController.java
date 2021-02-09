package com.simbaart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.dto.PhotoPostsDTO;
import com.simbaart.service.IPhotoCategoryService;
import com.simbaart.service.IPhotoPostsService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private IPhotoCategoryService photoCategoryService;
	@Autowired
	private IPhotoPostsService photoPostsService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam("page") int page) {

		ModelAndView mav = new ModelAndView("web/home");
		PhotoPostsDTO model = new PhotoPostsDTO();
		model.setPage(page);
		model.setLimit(30);
		Pageable pageable = new PageRequest(page - 1, model.getLimit());
		model.setListResult(photoPostsService.findAll(pageable));
		model.setTotalItem(photoPostsService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);

		PhotoCategoryDTO photoCategoryDTO = new PhotoCategoryDTO();
		photoCategoryDTO.setListResult(photoCategoryService.findAll());
		mav.addObject("photoCategory", photoCategoryDTO);
		return mav;
	}
	
	

}
