package cn.gson.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.gson.crm.model.domain.Optionb;
import cn.gson.crm.model.domain.Questionb;
import cn.gson.crm.model.domain.Wenjuanbiao;
import cn.gson.crm.model.mapper.WenjuanMapper;

@Service
public class WenjuanService{
	@Autowired
	WenjuanMapper wjm;
	public void addwenjuan(Wenjuanbiao wjb) {
		wjm.insertnote(wjb);
	}
	public void addwenti(Questionb qtb) {
		wjm.insertquestion(qtb);
	}
	public void addxuanxiang(Optionb opt) {
		wjm.insertoption(opt);
	}


}
