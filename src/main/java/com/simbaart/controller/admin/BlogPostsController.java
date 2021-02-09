package com.simbaart.controller.admin;

import java.util.List;

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
import com.simbaart.utils.ReadAllFileNameInFolderUtil;

@Controller(value = "blogPostsControllerOfAdmin")
public class BlogPostsController {
	
	@Autowired
	private IBlogCategoryService blogCategoryService;
	@Autowired
	private IBlogPostsService blogPostsService;
	@Autowired
	private ReadAllFileNameInFolderUtil readFileName;
	
	
	@RequestMapping(value = "/admin/blog/posts/list", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam("page") int page) {
		BlogPostsDTO model = new BlogPostsDTO();
		model.setPage(page);
		model.setLimit(10);
		ModelAndView mav = new ModelAndView("admin/blog/posts/list");
		Pageable pageable = new PageRequest(page-1, model.getLimit());
		model.setListResult(blogPostsService.findAll(pageable));
		model.setTotalItem(blogPostsService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);
		mav.addObject("checkSidebar",4);
		return mav;
	}

	@RequestMapping(value = "/admin/blog/posts/edit", method = RequestMethod.GET)
	public ModelAndView editPhotoPosts(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/blog/posts/edit");
		BlogPostsDTO model = new BlogPostsDTO();
		if (id != null) {
			model = blogPostsService.findById(id);
		}

		mav.addObject("model", model);
		List<BlogCategoryDTO> blogCategories = blogCategoryService.findAll();

		mav.addObject("blogCategories", blogCategories);
		
		List<String> listFileName = readFileName.results("images");
		mav.addObject("listFileName", listFileName);
		mav.addObject("checkSidebar",4);
		return mav;
	}
}
