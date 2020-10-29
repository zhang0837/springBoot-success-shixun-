package cn.gson.crm.model.dao;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import cn.gson.crm.entity.Note;
//实现分页
@Repository
public interface NoteListDao extends PagingAndSortingRepository<Note, Long>,JpaSpecificationExecutor {
	
}
