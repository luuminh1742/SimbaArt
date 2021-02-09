package com.simbaart.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.BioDTO;
import com.simbaart.service.IBioService;

@RestController(value="bioAPIOfAdmin")
public class BioAPI {

	@Autowired
	private IBioService bioService;
	
	@PutMapping("/api/bio")
	public BioDTO updateBio(@RequestBody BioDTO dto) {
		return bioService.update(dto);
	}
}
