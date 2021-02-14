package com.simbaart.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simbaart.converter.LinkConverter;
import com.simbaart.dto.LinkDTO;
import com.simbaart.entity.LinkEntity;
import com.simbaart.repository.LinkRepository;
import com.simbaart.service.ILinkService;

@Service
public class LinkService implements ILinkService{

	@Autowired
	private LinkRepository linkRepository;
	@Autowired
	private LinkConverter linkConverter;
	@Override
	@Transactional
	public LinkDTO save(LinkDTO dto) {
		LinkEntity linkEntity = new LinkEntity();
		if(dto.getId() != null) {
			LinkEntity oldLink = linkRepository.findOne(dto.getId());
			linkEntity = linkConverter.toEntity(oldLink, dto);
		}else {
			linkEntity = linkConverter.toEntity(dto);
		}
		
		return linkConverter.toDto(linkRepository.save(linkEntity));
	}

	@Override
	public LinkDTO findOne() {
		List<LinkEntity> entitis = linkRepository.findAll();
		if(entitis.size() == 0) return null;
		return linkConverter.toDto(entitis.get(0));
	}

	@Override
	public LinkDTO findById(Long id) {
		return linkConverter.toDto(linkRepository.findOne(id));
	}

	@Override
	public LinkDTO saveLogo(LinkDTO dto) {
		LinkEntity linkEntity = new LinkEntity();
		if(dto.getId() != null) {
			linkEntity = linkRepository.findOne(dto.getId());
		}
		linkEntity.setLogo(dto.getLogo());
		return linkConverter.toDto(linkRepository.save(linkEntity));
	}

}
