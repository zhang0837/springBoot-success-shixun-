package cn.gson.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gson.crm.entity.Note;
import cn.gson.crm.entity.Question;
import cn.gson.crm.model.mapper.GetPassNoteMapper;

@Service
public class GetPassNoteService {
	@Autowired
	GetPassNoteMapper getPassNoteMapper;

	public List<Note> getPassNote() {
		List<Note> list = getPassNoteMapper.getPassNote();
		return list;
	}

	public List<Question> getPassQue(Long id) {
		List<Question> list = getPassNoteMapper.getPassQue(id);
		return list;
	}
}
