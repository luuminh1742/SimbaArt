package com.simbaart.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.ContactDTO;
import com.simbaart.service.IContactService;

@RestController(value = "contactPostsAPIOfAdmin")
public class ContactAPI {
	@Autowired
	private IContactService contactService;
	
	@PostMapping("/api/contact")
	public ContactDTO createContact(@RequestBody ContactDTO dto) {
		return contactService.save(dto);
	}
	@DeleteMapping("/api/contact")
	public ContactDTO deleteContact(@RequestBody ContactDTO dto) {
		contactService.delete(dto.getIds());
		return dto;
	}
}
