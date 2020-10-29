package cn.gson.crm.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.gson.crm.entity.Note;
import cn.gson.crm.entity.Question;
import cn.gson.crm.model.domain.NoteCount;

@Mapper
public interface GetNoteMapper {
	
	public List<Note> getOtherNote(String state);

	public List<Question> getQue(Long id);

	public void noteUpdatePass(int id);
	
	public void noteUpdateNotPass(int id);
	

	public List<Note> getNote();

	public List<NoteCount> getNoteDetails();
}
