package cn.gson.crm.controller.admin;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.gson.crm.common.AjaxResult;
import cn.gson.crm.common.DataGrid;
import cn.gson.crm.common.MySpecification;
import cn.gson.crm.common.MySpecification.Cnd;
import cn.gson.crm.controller.system.RoleController;
import cn.gson.crm.entity.Note;
import cn.gson.crm.entity.Question;
import cn.gson.crm.model.dao.MemberDao;
import cn.gson.crm.model.dao.RoleDao;
import cn.gson.crm.model.domain.Member;
import cn.gson.crm.model.domain.Role;
import cn.gson.crm.service.GetNoteService;

@Controller
@RequestMapping("/admin/noteList")
public class NoteListController {

	@Autowired
	public GetNoteService getNoteService;

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
	@RequestMapping("/getNote")
	public DataGrid<Note> list(int page, int rows, String title, String creator, Date start_time) {
		DataGrid<Note> result = getNoteService.findAll(page, rows, title, creator, start_time);
		return result;
	}

	@RequestMapping("/quetion")
	public void form(Long id, Model model) {
		if (id != null) {
			ObjectMapper mapper = new ObjectMapper();
			List<Question> queList = getNoteService.getQue(id);
			try {
				model.addAttribute("queList", mapper.writeValueAsString(queList));
			} catch (JsonProcessingException e) {
				logger.error("json转换错误", e);
			}
		}
	}

	@RequestMapping("/noteUpdatePass")
	@ResponseBody
	public AjaxResult noteUpdatePass(int id) {
		getNoteService.noteUpdatePass(id);
		return new AjaxResult();
	}

	//
	@RequestMapping("/noteUpdateNotPass")
	@ResponseBody
	public AjaxResult noteUpdateNotPass(int id) {
		getNoteService.noteUpdateNotPass(id);
		return new AjaxResult();
	}

}
