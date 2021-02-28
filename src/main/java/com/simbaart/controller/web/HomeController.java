package com.simbaart.controller.web;

import java.util.ArrayList;
import java.util.List;

import com.simbaart.utils.SortImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.BlogPostsDTO;
import com.simbaart.dto.PhotoPostsDTO;
import com.simbaart.service.IBlogPostsService;
import com.simbaart.service.IPhotoPostsService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private IPhotoPostsService photoPostsService;
	@Autowired
	private DisplayGeneral displayGeneral;
	@Autowired
	private IBlogPostsService blogPostsService;
	@Autowired
	private SortImageUtil sortImageUtil;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView showListBlogPage(@RequestParam(value = "code", required = false) String code,
			@RequestParam("page") int page) {

		ModelAndView mav = new ModelAndView("web/home");

		PhotoPostsDTO model = new PhotoPostsDTO();
		model.setPage(page);
		model.setLimit(30);
		Pageable pageable = new PageRequest(page - 1, model.getLimit());
		if (code == null) {
			model.setListResult(photoPostsService.findAll(pageable));
			model.setTotalItem(photoPostsService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
			mav.addObject("checkMenuCategoryDesign", "0");
		} else {
			model.setListResult(photoPostsService.findAllByCategoryCode(code, pageable));
			model.setTotalItem(photoPostsService.getTotalItemByCategoryCode(code));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
			mav.addObject("checkMenuCategoryDesign", code);
		}

		PhotoPostsDTO model1 = new PhotoPostsDTO();
		PhotoPostsDTO model2 = new PhotoPostsDTO();
		PhotoPostsDTO model3 = new PhotoPostsDTO();
		PhotoPostsDTO model4 = new PhotoPostsDTO();
		sortImageUtil.sortImage(model,model1,model2,model3,model4);
		mav.addObject("model", model);
		mav.addObject("model1", model1);
		mav.addObject("model2", model2);
		mav.addObject("model3", model3);
		mav.addObject("model4", model4);

		displayGeneral.show(mav);
		// check menu selected

		BlogPostsDTO blogPostsDto = new BlogPostsDTO();
		blogPostsDto.setListResult(blogPostsService.findTop6());
		
		mav.addObject("blogPostsDto", blogPostsDto);
		
		
		
		mav.addObject("checkMenu", 0);

		return mav;
	}

}
