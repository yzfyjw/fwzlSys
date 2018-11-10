package com.action;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.dao.TObjfwDAO;
import com.dao.TJingpaiDAO;
import com.model.TJingpai;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 房屋预订信息管理类
 * @author Administrator
 *
 */
public class jingpaiAction extends ActionSupport
{
	private int jingpaiId;
	private int jingpaiJiage;
	private int jingpaiObjfwId;
	private int jingpaiUserId;
	private String message;
	private String path;
	private TJingpaiDAO jingpaiDAO;
	private TObjfwDAO objfwDAO;
	
	//预订房屋
	public String jingpaiAdd()
	{
		TJingpai jingpai=new TJingpai();
		jingpai.setJingpaiObjfwId(jingpaiObjfwId);
		jingpai.setJingpaiJiage(jingpaiJiage);
		jingpai.setJingpaiShijian(new Date().toLocaleString());
		
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		jingpai.setJingpaiUserId(user.getUserId());
		
		jingpai.setDel("no");
		jingpaiDAO.save(jingpai);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "预订成功");
		return ActionSupport.SUCCESS;
	}
	
	//我的预订
	public String jingpaiByMe()
	{
		
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		String sql="from TJingpai where del='no' and jingpaiUserId="+user.getUserId();
		List jingpaiList=jingpaiDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<jingpaiList.size();i++)
		{
			TJingpai jingpai=(TJingpai)jingpaiList.get(i);
			jingpai.setJingpaiObjfwName(objfwDAO.findById(jingpai.getJingpaiObjfwId()).getObjfwName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("jingpaiList", jingpaiList);
		return ActionSupport.SUCCESS;
	}
	
	/**
	 * 房屋预订取消
	 * @author Administrator
	 *
	 */
	public String objfwCancle(){
		TJingpai tJingpai= jingpaiDAO.findById(jingpaiId);
		tJingpai.setDel("yes");
		jingpaiDAO.attachDirty(tJingpai);
		this.setMessage("操作成功");
		this.setPath("jingpaiByMe.action");
		return "succeed";
	}	
	
	
	//查看预订房屋
	public String jingpaikan()
	{
		
		String sql="from TJingpai where jingpaiObjfwId="+jingpaiObjfwId;
		List jingpaiList=jingpaiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("jingpaiList", jingpaiList);
		return ActionSupport.SUCCESS;
	}
	
	
	public TJingpaiDAO getJingpaiDAO()
	{
		return jingpaiDAO;
	}
	public void setJingpaiDAO(TJingpaiDAO jingpaiDAO)
	{
		this.jingpaiDAO = jingpaiDAO;
	}
	public int getJingpaiObjfwId()
	{
		return jingpaiObjfwId;
	}
	public void setJingpaiObjfwId(int jingpaiObjfwId)
	{
		this.jingpaiObjfwId = jingpaiObjfwId;
	}
	public int getJingpaiId()
	{
		return jingpaiId;
	}
	public void setJingpaiId(int jingpaiId)
	{
		this.jingpaiId = jingpaiId;
	}
	public int getJingpaiJiage()
	{
		return jingpaiJiage;
	}
	public void setJingpaiJiage(int jingpaiJiage)
	{
		this.jingpaiJiage = jingpaiJiage;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}

	public TObjfwDAO getObjfwDAO()
	{
		return objfwDAO;
	}

	public void setObjfwDAO(TObjfwDAO objfwDAO)
	{
		this.objfwDAO = objfwDAO;
	}
	
	public int getJingpaiUserId() {
		return jingpaiUserId;
	}

	public void setJingpaiUserId(int jingpaiUserId) {
		this.jingpaiUserId = jingpaiUserId;
	}	
	
	
}
