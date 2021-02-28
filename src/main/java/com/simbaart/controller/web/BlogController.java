package com.simbaart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.BlogCategoryDTO;
import com.simbaart.dto.BlogPostsDTO;
import com.simbaart.service.IBlogCategoryService;
import com.simbaart.service.IBlogPostsService;

@Controller(value = "blogControllerOfWeb")
public class BlogController {

	@Autowired
	private DisplayGeneral displayGeneral;
	@Autowired
	private IBlogCategoryService blogCategoryService;
	@Autowired
	private IBlogPostsService blogPostsService;

	@RequestMapping(value = "/blog/list", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam(value = "code", required = false) String code,
			@RequestParam("page") int page) {

		ModelAndView mav = new ModelAndView("web/blog/list");

		BlogPostsDTO blogPostsDTO = new BlogPostsDTO();
		blogPostsDTO.setPage(page);
		blogPostsDTO.setLimit(10);
		Pageable pageable = new PageRequest(page - 1, blogPostsDTO.getLimit());
		if(code == null) {
			blogPostsDTO.setListResult(blogPostsService.findAll(pageable));
			blogPostsDTO.setTotalItem(blogPostsService.getTotalItem());
			blogPostsDTO.setTotalPage((int) Math.ceil((double) blogPostsDTO.getTotalItem() / blogPostsDTO.getLimit()));
		}else {
			blogPostsDTO.setListResult(blogPostsService.findAllByCategoryCode(code,pageable));
			blogPostsDTO.setTotalItem(blogPostsService.getTotalItemByCategoryCode(code));
			blogPostsDTO.setTotalPage((int) Math.ceil((double) blogPostsDTO.getTotalItem() / blogPostsDTO.getLimit()));
		}
		
		mav.addObject("blogPostsDTO", blogPostsDTO);
		
		displayCategory(mav);
		displayGeneral.show(mav);
		// check menu selected

		mav.addObject("checkMenu", 2);
		return mav;
	}

	@RequestMapping(value = "/blog/posts", method = RequestMethod.GET)
	public ModelAndView showPosts(@RequestParam(value = "code", required = false) Long code) {

		ModelAndView mav = new ModelAndView("web/blog/posts");
		BlogPostsDTO blogPostsDTO = blogPostsService.findById(code);
		mav.addObject("blogPosts", blogPostsDTO);
		displayCategory(mav);
		displayGeneral.show(mav);
		// check menu selected

		mav.addObject("checkMenu", 2);
		return mav;
	}
	
	
	private void displayCategory(ModelAndView mav) {
		BlogCategoryDTO blogCategoryDTO = new BlogCategoryDTO();
		blogCategoryDTO.setListResult(blogCategoryService.findAll());
		mav.addObject("blogCategory",blogCategoryDTO);
	}



}
