package com.simbaart.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.simbaart.dto.ContactDTO;
import com.simbaart.service.IContactService;

@Controller(value = "contactControllerOfAdmin")
public class ContactController {
	@Autowired
	private IContactService contactService;

	@RequestMapping(value = "/admin/contact", method = RequestMethod.GET)
	public ModelAndView contactPage(@RequestParam("page") int page) {
		ModelAndView mav = new ModelAndView("admin/contact");
		ContactDTO model = new ContactDTO();
		model.setPage(page);
		model.setLimit(20);
		Pageable pageable = new PageRequest(page - 1, model.getLimit());
		model.setListResult(contactService.findAll(pageable));
		model.setTotalItem(contactService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);

		// kiểm tra menu nằm ở đâu
		mav.addObject("checkSidebar", 5);
		return mav;
	}
}
