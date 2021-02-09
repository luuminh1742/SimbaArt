package com.simbaart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.BlogCategoryDTO;
import com.simbaart.service.IBlogCategoryService;

@Controller(value = "blogCategoryControllerOfAdmin")
public class BlogCategoryController {
	
	@Autowired
	private IBlogCategoryService blogCategoryService;
	
	@RequestMapping(value = "/admin/blog/category", method = RequestMethod.GET)
	public ModelAndView showList() {
		ModelAndView mav = new ModelAndView("admin/blog/category");
		BlogCategoryDTO model = new BlogCategoryDTO();
		model.setListResult(blogCategoryService.findAll());
		mav.addObject("model",model );
		mav.addObject("checkSidebar",3);
		return mav;
	}
}
