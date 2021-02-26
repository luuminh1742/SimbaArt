package com.simbaart.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.simbaart.converter.ContactConverter;
import com.simbaart.dto.ContactDTO;
import com.simbaart.repository.ContactRepository;
import com.simbaart.service.IContactService;

@Service
public class ContactService implements IContactService{

	@Autowired
	private ContactRepository contactRepository;
	@Autowired
	private ContactConverter contactConverter;
	@Override
	public List<ContactDTO> findAll(Pageable pageable) {
		List<ContactDTO> models = new ArrayList<>();
		contactRepository.findAllByOrderByIdDesc(pageable).forEach(entity->{
			models.add(contactConverter.toDto(entity));
		});
		return models;
	}

	@Override
	@Transactional
	public ContactDTO save(ContactDTO dto) {
		return contactConverter.toDto(
				contactRepository.save(contactConverter.toEntity(dto)));
	}

	@Override
	@Transactional
	public void delete(Long[] ids) {
		for(Long id:ids) {
			contactRepository.delete(id);
		}
		
	}

	@Override
	public int getTotalItem() {
		return (int) contactRepository.count();
	}

}
