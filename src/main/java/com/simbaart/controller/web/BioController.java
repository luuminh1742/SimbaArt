package com.simbaart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.BioDTO;
import com.simbaart.service.IBioService;

@Controller(value = "bioControllerOfWeb")
public class BioController {

	@Autowired
	private DisplayGeneral displayGeneral;
	@Autowired
	private IBioService bioService;
	
	@RequestMapping(value = "/bio", method = RequestMethod.GET)
	public ModelAndView bioPage() {

		ModelAndView mav = new ModelAndView("web/bio");
		
		BioDTO model = bioService.findOne();
		
		mav.addObject("model",model);
		
		
		displayGeneral.show(mav);
		// check menu selected

		mav.addObject("checkMenu", 1);
		return mav;
	}

}
