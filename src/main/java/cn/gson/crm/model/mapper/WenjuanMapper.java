package cn.gson.crm.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import cn.gson.crm.model.domain.Optionb;
import cn.gson.crm.model.domain.Questionb;
import cn.gson.crm.model.domain.Wenjuanbiao;

@Mapper
public interface WenjuanMapper {
	public void insertnote(Wenjuanbiao wjb);
	public void insertquestion(Questionb qtb);
	public void insertoption(Optionb otb);

}
