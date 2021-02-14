package com.simbaart.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "contactControllerOfWeb")
public class ContactController {

	@Autowired
	private DisplayGeneral displayGeneral;

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView bioPage() {

		ModelAndView mav = new ModelAndView("web/contact");

		displayGeneral.show(mav);
		// check menu selected

		mav.addObject("checkMenu", 3);
		return mav;
	}

}
