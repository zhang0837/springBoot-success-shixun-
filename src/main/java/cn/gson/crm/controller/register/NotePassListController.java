package cn.gson.crm.controller.register;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gson.crm.common.DataGrid;
import cn.gson.crm.controller.system.RoleController;
import cn.gson.crm.entity.Note;
import cn.gson.crm.entity.Question;
import cn.gson.crm.model.dao.RoleDao;
import cn.gson.crm.service.GetNoteService;
import cn.gson.crm.service.GetPassNoteService;

@Controller
@RequestMapping(value="register/notePassList")
public class NotePassListController {
	@Autowired
	public GetPassNoteService getPassNoteService;

	Logger logger = Logger.getLogger(RoleController.class);

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

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/getNote") public List<Note> getNote() { List<Note> noteList
	 * = getNoteService.getNote(); return noteList; }
	 */
	@ResponseBody
	@RequestMapping("/getPassNote")
	public List<Note> getOtherNote() {
		List<Note> noteList = getPassNoteService.getPassNote();
		return noteList;
	}
	
	@ResponseBody
	@RequestMapping("/getPassQue")
	public List<Question> getPassQue(Long id) {
		List<Question> QueList = getPassNoteService.getPassQue(id);
		return QueList;
	}


}
