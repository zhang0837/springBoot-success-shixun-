package cn.gson.crm.controller.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.gson.crm.entity.Note;
import cn.gson.crm.model.domain.NoteCount;
import cn.gson.crm.service.GetNoteService;

@Controller
@RequestMapping("/system/feedback")
public class FeedbackController {
    @Autowired
    private GetNoteService getNoteService;
    
	@RequestMapping
	public void index() {
	}
	
	@ResponseBody
	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public List<Note> getNote() {
		return getNoteService.getNote();
	}
	
	@RequestMapping("/getNoteDetails")
	public String GetNoteDetails(Model model){
	    List<NoteCount> noteCounts = getNoteService.getNoteDetails();
	    model.addAttribute("noteCounts",noteCounts);
	    return "/system/result";
	}}
