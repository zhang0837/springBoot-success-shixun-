package cn.gson.crm.controller.admin;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gson.crm.controller.system.RoleController;
import cn.gson.crm.entity.Note;
import cn.gson.crm.entity.Question;
import cn.gson.crm.model.dao.MemberDao;
import cn.gson.crm.model.dao.RoleDao;
import cn.gson.crm.service.GetNoteService;

@Controller
@RequestMapping("/admin/noteOtherList")
@Transactional(readOnly = true)
public class NoteOtherListController {

	@Autowired
	public GetNoteService getNoteService;

	Logger logger = Logger.getLogger(RoleController.class);

	@Autowired
	MemberDao memberDao;

	@Autowired
	RoleDao roleDao;

	/**
	 * 超级管理员id
	 */  
	@Value("${crm.system.super-user-id}")
	Long superUserId;

	@RequestMapping
	public void index() {

	}

	/*@ResponseBody
	@RequestMapping("/getOtherNote")
	public List<Note> getOtherNote() {
		List<Note> noteList = getNoteService.getOtherNote();
		return noteList;
	}*/
	
	@ResponseBody
	@RequestMapping("/getOtherNote")
	public List<Note> getOtherNote(String state) {
		List<Note> noteList = getNoteService.getOtherNote(state);
		return noteList;
	}
}
