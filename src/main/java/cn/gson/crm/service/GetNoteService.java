package cn.gson.crm.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import cn.gson.crm.common.DataGrid;
import cn.gson.crm.common.MySpecification;
import cn.gson.crm.common.MySpecification.Cnd;
import cn.gson.crm.entity.Note;
import cn.gson.crm.entity.Question;
import cn.gson.crm.model.dao.MemberDao;
import cn.gson.crm.model.dao.NoteListDao;
import cn.gson.crm.model.domain.Member;
import cn.gson.crm.model.domain.NoteCount;
import cn.gson.crm.model.mapper.GetNoteMapper;

@Service
public class GetNoteService {
	@Autowired
	public GetNoteMapper getNoteMapper;

	@Autowired
	NoteListDao noteListDao;

	/*
	 * public List<Note> getNote() { List<Note> list = getNoteMapper.getNote();
	 * return list; }
	 */

	public DataGrid<Note> findAll(int page, int rows, String title, String creator, Date start_time) {
		PageRequest pr = new PageRequest(page - 1, rows);
		Page pageData = noteListDao.findAll(new MySpecification<Note>()
				.and(Cnd.like("title", title), Cnd.like("creator", creator), Cnd.eq("start_time", start_time))
				.asc("note_id"), pr);
		return new DataGrid<>(pageData);
	}

	public List<Note> getOtherNote(String state) {
		List<Note> list = getNoteMapper.getOtherNote(state);
		return list;
	}

	public List<Question> getQue(Long id) {
		List<Question> list = getNoteMapper.getQue(id);
		return list;
	}

	public void noteUpdatePass(int id) {
		getNoteMapper.noteUpdatePass(id);
	}

	public void noteUpdateNotPass(int id) {
		getNoteMapper.noteUpdateNotPass(id);
	}
	
	public List<Note> getNote() {
		// TODO Auto-generated method stub
		return getNoteMapper.getNote();
	}
	
	public List<NoteCount> getNoteDetails(){
		return getNoteMapper.getNoteDetails();
	}
}
