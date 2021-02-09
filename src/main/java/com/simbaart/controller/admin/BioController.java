package com.simbaart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.BioDTO;
import com.simbaart.service.IBioService;

@Controller(value = "bioControllerOfAdmin")
public class BioController {
	
	@Autowired
	private IBioService bioService;
	
	@RequestMapping(value = "/admin/bio", method = RequestMethod.GET)
	   public ModelAndView showBio() {
	      ModelAndView mav = new ModelAndView("admin/bio/infor");
	      BioDTO model = new BioDTO();
	      model = bioService.findOne();
	      mav.addObject("model", model);
	      return mav;
	   }
	@RequestMapping(value = "/admin/bio/edit", method = RequestMethod.GET)
	   public ModelAndView editBio(@RequestParam(value = "id", required = false) Long id) {
	      ModelAndView mav = new ModelAndView("admin/bio/edit");
	      BioDTO model = new BioDTO();
	      model = bioService.findById(id);
	      mav.addObject("model", model);
	      return mav;
	   }
}
