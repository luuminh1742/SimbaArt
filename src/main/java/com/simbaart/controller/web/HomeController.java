package com.simbaart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.PhotoPostsDTO;
import com.simbaart.service.IPhotoPostsService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private IPhotoPostsService photoPostsService;
	@Autowired
	private DisplayGeneral displayGeneral;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView showListBlogPage(@RequestParam(value = "code", required = false) String code,
			@RequestParam("page") int page) {

		ModelAndView mav = new ModelAndView("web/home");
		
		PhotoPostsDTO model = new PhotoPostsDTO();
		model.setPage(page);
		model.setLimit(30);
		Pageable pageable = new PageRequest(page - 1, model.getLimit());
		if(code == null) {
			model.setListResult(photoPostsService.findAll(pageable));
			model.setTotalItem(photoPostsService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
			mav.addObject("checkMenuCategoryDesign","0");
		}else {
			model.setListResult(photoPostsService.findAllByCategoryCode(code,pageable));
			model.setTotalItem(photoPostsService.getTotalItemByCategoryCode(code));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
			mav.addObject("checkMenuCategoryDesign",code);
		}
		
		mav.addObject("model", model);

		
		displayGeneral.show(mav);
		// check menu selected
		
		mav.addObject("checkMenu",0);
		
		return mav;
	}


}
