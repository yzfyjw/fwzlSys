package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TAdminDAO;
import com.model.TAdmin;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

/**
 * 管理员信息管理类
 * @author Administrator
 *
 */
public class adminAction extends ActionSupport
{
	private int userId;
	private String userName;
	private String userPw;
	 
	private String message;
	private String path;
	
	private int index=1;

	private TAdminDAO adminDAO;
	private  Integer  currentPage;

	
	/**
	 * 管理员添加
	 * @author Administrator
	 *
	 */
	public String adminAdd()
	{
		TAdmin admin=new TAdmin();
		admin.setUserName(userName);
		admin.setUserPw(userPw);
		adminDAO.save(admin); //调用adminDao的save方法保存admin到数据库
		this.setMessage("操作成功");//将该action中的message设置为"添加成功"
		this.setPath("adminManage.action");//设置跳转路径为adminManage.action
		return "succeed";
	}
	
	
	/**
	 * 管理员列表查看
	 * @author Administrator
	 *
	 */
	public String adminManage()
	{
		List adminList=adminDAO.findAll(); //dao中的findAll 函数dao层使用的是Hibernate
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("adminList", adminList);//将列表存入adminList
		return ActionSupport.SUCCESS;
		
		/*Integer length =2;
		//currentPage=Integer.parseInt(ServletActionContext.getRequest().getParameter("currentPage"));
		if(currentPage == null){
			currentPage =1;
		}
		Integer start =(currentPage-1)*length;//start是这也得第一条数据是第几条数据
        Map request=(Map)ServletActionContext.getContext().get("request");
		String sql="from TAdmin where userName='admin'";
		List adminList=adminDAO.findGoods(start,length,sql);
		Integer pageCount = 0;
        if(adminList != null){
        	int c = adminList.size();
        	pageCount=(c+2)/3;
        }		 
		request.put("adminList", adminList);
		request.put("currentPage", currentPage);
		request.put("start", start);
		request.put("pageCount", pageCount);
		return ActionSupport.SUCCESS;*/
	}
	
	public String adminManageFenye()
	{
		List adminList=adminDAO.findAll();//查找出所有的adminList
		int pageSize=8;//每页8条
		int fromIndex = (index - 1) * pageSize;//选择从第几条开始
		int toIndex = Math.min(fromIndex + pageSize, adminList.size());//调用Math.min函数取目的数
		List adminListFenye = adminList.subList(fromIndex, toIndex);//从总数列表中截取子列表
		

        Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(pageSize);//设置每页数量
        p.setTotle(adminList.size());//设置总共的条数
        p.setData(adminListFenye);//设置数据
        p.setPath("adminManageFenye.action?");//跳转的路径

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("page", p);
		return ActionSupport.SUCCESS;
		/*List stuList=stuDAO.getHibernateTemplate().find("from TStu where del='no'");
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("stuList", stuList);
		return ActionSupport.SUCCESS;*/
		
		/*Integer length =2;
		//currentPage=Integer.parseInt(ServletActionContext.getRequest().getParameter("currentPage"));
		if(currentPage == null){
			currentPage =1;
		}
		Integer start =(currentPage-1)*length;//start是这也得第一条数据是第几条数据
        Map request=(Map)ServletActionContext.getContext().get("request");
		String sql="from TAdmin";
		List adminList=adminDAO.findGoods(start,length,sql);
		Integer pageCount = 0;
        if(adminList != null){
        	int c = adminList.size();
        	pageCount=(c+2)/3;
        }		 
		request.put("adminList", adminList);
		request.put("currentPage", currentPage);
		request.put("start", start);
		request.put("pageCount", pageCount);
		return ActionSupport.SUCCESS;
*/
		
		
		
		
		
	}
	
	/**
	 * 管理员删除
	 * @author Administrator
	 *
	 */
	public String adminDel()
	{
		adminDAO.delete(adminDAO.findById(userId));//将通过id查找到的admin删除
		this.setMessage("删除成功");
		this.setPath("adminManage.action");
		return "succeed";
	}
	
	

	public TAdminDAO getAdminDAO()
	{
		return adminDAO;
	}

	public void setAdminDAO(TAdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}

	public String getMessage()
	{
		return message;
	}

	public int getIndex()
	{
		return index;
	}



	public void setIndex(int index)
	{
		this.index = index;
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

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}
	 
	/*public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}*/

}
