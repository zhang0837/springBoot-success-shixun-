package cn.gson.crm.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.gson.crm.entity.Note;
import cn.gson.crm.entity.Question;

@Mapper
public interface GetPassNoteMapper {

	public List<Note> getPassNote();

	public List<Question> getPassQue(Long id);
}
