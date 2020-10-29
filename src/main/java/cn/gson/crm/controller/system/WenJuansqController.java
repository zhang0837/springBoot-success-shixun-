package cn.gson.crm.controller.system;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.gson.crm.model.domain.Message;
import cn.gson.crm.model.domain.Optionb;
import cn.gson.crm.model.domain.Questionb;
import cn.gson.crm.model.domain.Wenjuanbiao;
import cn.gson.crm.service.WenjuanService;

@Controller
@RequestMapping("/system/wenjuansq")
public class WenJuansqController {
	// @GetMapping("/wenjuan")
	// public ModelAndView getwenjuanview() {
	// ModelAndView mv=new ModelAndView();
	// mv.setViewName("/wenjuan");
	// return mv;
	// }
	// @RequestMapping
	// public String getwenjuan() {
	// return "system/wenjuan";
	// }
	HashMap<Integer,Questionb> wenti=new HashMap<>();
	HashMap<Integer, List<Optionb>> xuanx=new HashMap<>();
	@Autowired
	WenjuanService wjs;
	Wenjuanbiao wjb;
	@RequestMapping
	public void index() {
	}
	@ResponseBody
	@RequestMapping(value="/sqbiao",method=RequestMethod.POST)
	 public Message getwenjuan(String title,String desc,String anon,String starttime,String endtime,String creator) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:s");
		    try {
			Date kaishitime=simpleDateFormat.parse(starttime);
			Date jieshutime=simpleDateFormat.parse(endtime);
			Date date=new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			//获取两天后的日期
			cal.add(Calendar.DATE,2);
			Date time=cal.getTime();
			if(kaishitime.before(time)||jieshutime.before(kaishitime)) {
				 String msg="开始时间应该在两天之后，截止时间要大于开始时间！";
				 boolean pd=false;
				 Message msag=new Message(msg,pd);
				 return msag;
			}else {
				String msg="申请问卷成功！";
				boolean pd=true;
				Message msag=new Message(msg,pd);
				if(anon.equals("no")) {
				wjb=new Wenjuanbiao(title,desc,kaishitime,jieshutime,0, 0,creator,date);
				}else {
					wjb=new Wenjuanbiao(title,desc,kaishitime,jieshutime,0, 1,"匿名",date);
				}
				return msag;
			}
				
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			String msg="时间转化错误";
			 boolean pd=false;
			 Message msag=new Message(msg,pd);
			 return msag;
			
		}
	}
	@ResponseBody
	@RequestMapping(value="/question",method=RequestMethod.POST)
	public void getquestion(int djigdiv,String querstionname,int bit,int querstionType) {
		Questionb qtb;
		if(querstionType==0) {
	    qtb=new Questionb(querstionname, bit, "单选");	
	}else if(querstionType==1) {
		qtb=new Questionb(querstionname, bit, "多选");	
	}else
		qtb=new Questionb(querstionname, bit, "问答");
		wenti.put(djigdiv+1, qtb);
		}
	@ResponseBody
	@RequestMapping(value="/option",method=RequestMethod.POST)
	public void getoption(int djigdiv,@RequestParam(value = "xuanxiang[]")String[] xuanxiang) {
		List<Optionb> list=new ArrayList<Optionb>();
		for(int i=1;i<=xuanxiang.length;i++) {
			String xhao= String.valueOf((char)(i+64));
			Optionb ob=new Optionb(xhao, xuanxiang[i-1]);
			list.add(ob);
		}
		xuanx.put(djigdiv+1, list);
	}
	@ResponseBody
	@RequestMapping(value="/shanchu",method=RequestMethod.POST)
	public Message getshanchu(int hovdijidiv) {
		wenti.remove(hovdijidiv+1);
		xuanx.remove(hovdijidiv+1);
		HashMap<Integer,Questionb> zcwenti=new HashMap<>();
		Set<Integer> keywSet = wenti.keySet();
		for(int e:keywSet) {
			if(e>hovdijidiv+1) {
				wenti.remove(e);
				zcwenti.put(e-1, wenti.get(e));
			}
		}
		Set<Integer> zckeywSet = zcwenti.keySet();
		for(int e:zckeywSet) {
			wenti.put(e, zcwenti.get(e));
		}
		HashMap<Integer, List<Optionb>> zcxuanx=new HashMap<>();
		Set<Integer> keyxSet = xuanx.keySet();
		for(int e:keyxSet) {
			if(e>hovdijidiv+1) {
				xuanx.remove(e);
				zcxuanx.put(e-1, xuanx.get(e));
			}
		}
		Set<Integer> zckeyxSet = zcxuanx.keySet();
		for(int e:zckeyxSet) {
			xuanx.put(e, zcxuanx.get(e));
		}
		Message msg=new Message("删除成功");
		return msg;
		
	}
	@ResponseBody
	@RequestMapping(value="/tijiao",method=RequestMethod.POST)
	public Message tijiaowenjuan() {
		int wenticdu=wenti.size();
		Set<Integer> keywSet = wenti.keySet();
		boolean sfw=true;
		if(wenticdu==0) {
			sfw=false;
		}
		for(int e:keywSet) {
			if(e>wenticdu||wenti.get(e).getTitle().equals("")) {
				sfw=false;
				break;
			}
		}
		Set<Integer> keyxSet = xuanx.keySet();
		boolean sfx=true;
		out:for(int e:keyxSet) {
			for(Optionb o:xuanx.get(e)) {
				if(o.getNewcon().equals("")) {
					sfx=false;
					break out;
				}
			}
		}
		Message msg;
		if(sfw&&sfx) {
			msg=new Message("已提交给管理员，等待管理员审核",true);
			wjs.addwenjuan(wjb);
			int wenjuanid=wjb.getNoteid();
			int jigewenti=wenti.size();
			for(int i=1;i<=jigewenti;i++) {
				wenti.get(i).setNoteid(wenjuanid);
				wjs.addwenti(wenti.get(i));
				if(wenti.get(i).getType()!="问答") {
					for(Optionb e:xuanx.get(i)) {
						int wtid=wenti.get(i).getReqid();
						e.setQuesid(wtid);
						wjs.addxuanxiang(e);
				}
			}
				
			}
		}else
			msg=new Message("问卷中有空问题或空选项或题未编辑，无法提交审核",false);
		return msg;
	}
}
