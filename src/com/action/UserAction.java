package com.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.PageBean;

/**
 * 用户信息管理类
 * @author Administrator
 *
 */
public class UserAction extends ActionSupport
{
    private int userId;
	private String userName;
	private String userPw;
	private String userRealname;
	private String userAddress;
	private String userSex;
	private String userTel;
	private String userEmail;
	private String userQq;
	private String newUserPw;
	private String message;
	private String path;
	private Integer currentPage;
	
	private TUserDAO userDAO;
	
	
	/**
	 * 用户注册
	 * @author Administrator
	 *
	 */
	public String userReg()
	{
		TUser user=new TUser();
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserSex(userSex);
		user.setUserQq(userQq);
		user.setUserDel("no");
		userDAO.save(user);
		Map session= ServletActionContext.getContext().getSession();
		session.put("user", user);
		return "successAdd";
	}
	
	/**
	 * 用户编辑
	 * @author Administrator
	 *
	 */
	public String userEdit()
	{
		TUser user=userDAO.findById(userId);
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserSex(userSex);
		user.setUserQq(userQq);
		user.setUserDel("no");
		userDAO.attachDirty(user);
		Map session= ServletActionContext.getContext().getSession();
		session.put("user", user);
		return "successAdd";
	}
	
	/**
	 * 用户登陆
	 * @author Administrator
	 *
	 */
	public String userLogin()
	{
		String sql="from TUser where userName=? and userPw=?";
		Object[] con={userName,userPw};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		if(userList.size()==0)
		{
			this.setMessage("用户名或密码错误");
			this.setPath("qiantai/default.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 TUser user=(TUser)userList.get(0);
			 session.put("user", user);
			 
			 this.setMessage("成功登录");
			 this.setPath("qiantai/default.jsp");
		}
		return "succeed";
	}
	
	/**
	 * 退出登录
	 * @author Administrator
	 *
	 */
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	/**
	 * 用户信息删除
	 * @author Administrator
	 *
	 */
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserDel("yes");
		userDAO.attachDirty(user);
		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	
	/**
	 * 用户信息查看
	 * @author Administrator
	 *
	 */
	public String userXinxi()
	{
		TUser user=userDAO.findById(userId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		return ActionSupport.SUCCESS;
		
		
	}
	
	/**
	 * 用户信息管理
	 * @author Administrator
	 *
	 */
	@SuppressWarnings("unchecked")
	public String userMana()
	{
		//List userList=userDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		 Integer total =(Integer) userDAO.getHibernateTemplate().execute(new HibernateCallback() {
             public Integer doInHibernate(Session session) throws HibernateException,
                       SQLException {
                  String counthql="select count(*) from TUser where userDel='no'";
                  Query query = session.createQuery(counthql);
                  return Integer.valueOf(query.uniqueResult()+"");
             }
        });
		 final Integer pageSize=5;
         PageBean<TUser>pageBean=new PageBean<TUser>(currentPage, total, pageSize);
         final Integer start=pageBean.getStart();
		List<TUser> users=(List<TUser>) userDAO.getHibernateTemplate().execute(new HibernateCallback() {
              public List<TUser>  doInHibernate(Session session) throws HibernateException,
                        SQLException {
                   // TODO Auto-generated method stub
                   String sql="select * from t_user where user_del='no' limit ?,?";
                   SQLQuery query = session.createSQLQuery(sql);
                   query.setParameter(0, start);
                   query.setParameter(1, pageSize);
                   query.addEntity(TUser.class);
                   return query.list();
              }
         });
         pageBean.setList(users);
         request.put("pageBean", pageBean);
         return ActionSupport.SUCCESS;
	}
	
	
	
	public String getUserAddress()
	{
		return userAddress;
	}

	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}

	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}

	public String getUserQq()
	{
		return userQq;
	}

	public void setUserQq(String userQq)
	{
		this.userQq = userQq;
	}

	public String getUserRealname()
	{
		return userRealname;
	}

	public void setUserRealname(String userRealname)
	{
		this.userRealname = userRealname;
	}

	public String getUserSex()
	{
		return userSex;
	}

	public void setUserSex(String userSex)
	{
		this.userSex = userSex;
	}

	public String getUserTel()
	{
		return userTel;
	}

	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
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

	public TUserDAO getUserDAO()
	{
		return userDAO;
	}


	public String getMessage()
	{
		return message;
	}


	public String getNewUserPw()
	{
		return newUserPw;
	}

	public void setNewUserPw(String newUserPw)
	{
		this.newUserPw = newUserPw;
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


	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}


	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	
}
