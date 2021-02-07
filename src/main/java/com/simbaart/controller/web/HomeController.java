package com.simbaart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.service.IPhotoCategoryService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private IPhotoCategoryService photoCategoryService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	   public ModelAndView homePage() {
	      ModelAndView mav = new ModelAndView("web/home");
	      
	      PhotoCategoryDTO photoCategoryDTO = new PhotoCategoryDTO();
	      photoCategoryDTO.setListResult(photoCategoryService.findAll());
	      mav.addObject("photoCategory", photoCategoryDTO);
	      return mav;
	   }
}
