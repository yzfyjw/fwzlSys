package com.action;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dao.TJingpaiDAO;
import com.dao.TPinglunDAO;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.dao.TObjfwDAO;
/*import com.model.TJingpai;*/
import com.model.TPinglun;
import com.model.TObjfw;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.PageBean;
/**
 * 房屋信息管理
 * @author Administrator
 *
 */
public class objfwAction extends ActionSupport
{
	
	private int objfwId;
	private int objfwCatelogId;
	private String objfwName;
	private String objfwArea;
	private String objfwMiaoshu;
	private String fujian;
    private int objfwDijia;
    private int objfwUserId;
    private Integer currentPage; 
    
    
    public int getObjfwUserId() {
		return objfwUserId;
	}

	public void setObjfwUserId(int objfwUserId) {
		this.objfwUserId = objfwUserId;
	}

	private String message;
	private String path;
	private TJingpaiDAO jpDAO;
	private TPinglunDAO pinglunDAO;
	public TPinglunDAO getPinglunDAO() {
		return pinglunDAO;
	}

	public void setPinglunDAO(TPinglunDAO pinglunDAO) {
		this.pinglunDAO = pinglunDAO;
	}

	public TJingpaiDAO getJpDAO() {
		return jpDAO;
	}



	public void setJpDAO(TJingpaiDAO jpDAO) {
		this.jpDAO = jpDAO;
	}

	private TObjfwDAO objfwDAO;
	/**
	 * 房屋租赁信息添加
	 * @author Administrator
	 *
	 */
	public String objfwAddByMe()
	{
		TObjfw objfw=new TObjfw();
		objfw.setObjfwCatelogId(objfwCatelogId);
		objfw.setObjfwName(objfwName);
		objfw.setObjfwArea(objfwArea);
		objfw.setObjfwMiaoshu(objfwMiaoshu);
		objfw.setFujian(fujian);
		objfw.setObjfwDijia(objfwDijia);
		
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		objfw.setObjfwUserId(user.getUserId());
		objfw.setObjfwShijian(new Date().toLocaleString());
		objfw.setObjfwDel("no");
		objfwDAO.save(objfw);
		this.setMessage("操作成功");
		this.setPath("objfwManaByMe.action");
		return "succeed";
	}
	
	
	/**
	 * 其他类住宿信息添加
	 * @author Administrator
	 *
	 */
	public String fwxsAddByMe()
	{
		TObjfw objfw=new TObjfw();
		objfw.setObjfwCatelogId(objfwCatelogId);
		objfw.setObjfwName(objfwName);
		objfw.setObjfwArea(objfwArea);
		objfw.setObjfwMiaoshu(objfwMiaoshu);
		objfw.setFujian(fujian);
		objfw.setObjfwDijia(objfwDijia);
		
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		objfw.setObjfwUserId(user.getUserId());
		objfw.setObjfwShijian(new Date().toLocaleString());
		objfw.setObjfwDel("no");
		objfwDAO.save(objfw);
		this.setMessage("操作成功");
		this.setPath("objfwManaByMe.action");
		return "succeed";
	}	
	
	
	/**
	 * 管理员添加房屋信息
	 * @author Administrator
	 *
	 */
	public String objfwAddByAdmin()
	{
		TObjfw objfw=new TObjfw();
		objfw.setObjfwCatelogId(objfwCatelogId);
		objfw.setObjfwName(objfwName);
		objfw.setObjfwArea(objfwArea);
		objfw.setObjfwMiaoshu(objfwMiaoshu);
		objfw.setFujian(fujian);
		objfw.setObjfwDijia(objfwDijia);
		Map session= ServletActionContext.getContext().getSession();
		objfw.setObjfwUserId(888);
		objfw.setObjfwShijian(new Date().toLocaleString());
		objfw.setObjfwDel("no");
		objfwDAO.save(objfw);
		this.setMessage("操作成功");
		this.setPath("objfwManaByAd.action");
		return "succeed";
	}
	
	
	
	/**
	 * 房屋信息删除
	 * @author Administrator
	 *
	 */
	public String objfwDelByMe()
	{
		TObjfw objfw=objfwDAO.findById(objfwId);
		objfw.setObjfwDel("yes");
		objfwDAO.attachDirty(objfw);
		this.setMessage("操作成功");
		this.setPath("objfwManaByMe.action");
		return "succeed";
	}
	

	/**
	 * 管理员查看自己发布的房屋
	 * @author Administrator
	 *
	 */
	public String objfwManaByAdmin()
	{
		String sql="from TObjfw where objfwDel='no' and objfwUserId=888";
		List objfwList=objfwDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("objfwList", objfwList);
		return ActionSupport.SUCCESS;
		
	}	
	
	
	/**
	 * 房屋信息管理
	 * @author Administrator
	 *
	 */
    @SuppressWarnings("unchecked")
 	public String objfwManaByMe()
 	{
		Map session= ServletActionContext.getContext().getSession();
		Map request=(Map)ServletActionContext.getContext().get("request");
		TUser user=(TUser)session.get("user");
		final Integer userid=user.getUserId();
		String sql="from TObjfw where objfwDel='no' and objfwUserId="+user.getUserId();
		Integer total =(Integer) objfwDAO.getHibernateTemplate().execute(new HibernateCallback() {
            public Integer doInHibernate(Session session) throws HibernateException,
                      SQLException {
                 String counthql="select count(*) from TObjfw where objfwDel='no' and objfwUserId="+userid;
                 Query query = session.createQuery(counthql);
                 return Integer.valueOf(query.uniqueResult()+"");
            }
       });
		final Integer pageSize=5;
        PageBean<TObjfw>pageBean=new PageBean<TObjfw>(currentPage, total, pageSize);
        final Integer start=pageBean.getStart();
      
		List<TObjfw> objfwList=(List<TObjfw>) objfwDAO.getHibernateTemplate().execute(new HibernateCallback() {
             public List<TObjfw>  doInHibernate(Session session) throws HibernateException,
                       SQLException {
                  // TODO Auto-generated method stub
                  String sql="select * from t_objfw where objfw_del='no' and objfw_user_id="+userid+" limit ?,?";
                  SQLQuery query = session.createSQLQuery(sql);
                  query.setParameter(0, start);
                  query.setParameter(1, pageSize);
                  query.addEntity(TObjfw.class);
                  return query.list();
             }
        });
        pageBean.setList(objfwList);
        request.put("pageBean", pageBean);
        return ActionSupport.SUCCESS;
		
 		
 	}
		
	
	
	
	
	/**
	 * 房屋信息详情
	 * @author Administrator
	 *
	 */
	public String objfwDetailHou()
	{
		TObjfw objfw=objfwDAO.findById(objfwId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("objfw", objfw);
		return ActionSupport.SUCCESS;
	}
	
	/**
	 * 房屋信息查看前台
	 * @author Administrator
	 *
	 */
	public String objfwDetailQian()
	{
		TObjfw objfw=objfwDAO.findById(objfwId);
		
		jpDAO= new TJingpaiDAO();
	    String queryString = "from TJingpai where  del='no' and jingpaiObjfwId="+objfwId;
	    List jpList=objfwDAO.getHibernateTemplate().find(queryString);		
	    Map request=(Map)ServletActionContext.getContext().get("request");
	    int zlflag=jpList.size();
	    request.put("zlflag", zlflag);	    
		request.put("objfw", objfw);
		return ActionSupport.SUCCESS;
		
		
	}
	/**
	 * 房屋信息管理---------------------------------------------------------------------------------------------------------------------
	 * @author Administrator
	 *
	 */
	 @SuppressWarnings("unchecked")
	public String objfwManaByAd()
	{   
		//String sql="from TObjfw where objfwDel='no'";
		//List objfwList=objfwDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		  Integer total =(Integer) objfwDAO.getHibernateTemplate().execute(new HibernateCallback() {
              public Integer doInHibernate(Session session) throws HibernateException,
                        SQLException {
                   // TODO Auto-generated method stub
                   //String counthql="select count(*) from t_objfw where objfw_del='no' and objfw_name like '%"+objfwName.trim()+"%'"+" order by objfw_catelog_id";
                   String counthql="select count(*) from TObjfw where objfwDel='no'";
                   Query query = session.createQuery(counthql);
                   return Integer.valueOf(query.uniqueResult()+"");
              }
         });
		
          final Integer pageSize=10;
          PageBean<TObjfw>pageBean=new PageBean<TObjfw>(currentPage, total, pageSize);
          final Integer start=pageBean.getStart();
          List<TObjfw> objfwList=(List<TObjfw>) objfwDAO.getHibernateTemplate().execute(new HibernateCallback() {
               public List<TObjfw>  doInHibernate(Session session) throws HibernateException,
                         SQLException {
                    // TODO Auto-generated method stub
                    String sql="select * from t_objfw where objfw_del='no' limit ?,?";
                    SQLQuery query = session.createSQLQuery(sql);
                    query.setParameter(0, start);
                    query.setParameter(1, pageSize);
                    query.addEntity(TObjfw.class);
                    return query.list();
               }
          });
          pageBean.setList(objfwList);
          request.put("pageBean", pageBean);
          return ActionSupport.SUCCESS;
		
		
		
	}
	/**
	 * 房屋信息删除
	 * @author Administrator
	 *
	 */
	public String objfwDelByAd()
	{
		TObjfw objfw=objfwDAO.findById(objfwId);
		objfw.setObjfwDel("yes");
		objfwDAO.attachDirty(objfw);
		this.setMessage("操作成功");
		this.setPath("objfwManaByAd.action");
		return "succeed";
	}
	
	
	/**
	 * 房屋发布信息审核通过
	 * @author Administrator
	 *
	 */
	public String objfwShenHeByAd()
	{
		TObjfw objfw=objfwDAO.findById(objfwId);
		objfw.setShenheFlag("1");
		objfwDAO.attachDirty(objfw);
		this.setMessage("操作成功");
		this.setPath("objfwManaByAd.action");
		return "succeed";
	}
	
	
	
	/**
	 * 房屋信息查询----------------------------------------------------------------------------------------------------------------
	 * @author Administrator
	 *
	 */
	@SuppressWarnings("unchecked")
	public String goodSearch()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		//final String sql="select * from TObjfw where objfwDel='no' and objfwName like '%"+objfwName.trim()+"%'"+" order by objfwCatelogId";
        //System.out.println(currentPage==null?"null值":currentPage);
        
		Integer total =(Integer) objfwDAO.getHibernateTemplate().execute(new HibernateCallback() {
			public Integer doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				//String counthql="select count(*) from t_objfw where objfw_del='no' and objfw_name like '%"+objfwName.trim()+"%'"+" order by objfw_catelog_id";
				String counthql="select count(*) from TObjfw where objfwDel='no' and objfwName like '%"+objfwName.trim()+"%'"+" order by objfwCatelogId";
				Query query = session.createQuery(counthql);
				return Integer.valueOf(query.uniqueResult()+"");
			}
		});
		//System.out.println(total);
		final Integer pageSize=10;
		//Integer currentpg = Integer.parseInt(currentPage);
		PageBean<TObjfw>pageBean=new PageBean<TObjfw>(currentPage, total, pageSize);
		final Integer start=pageBean.getStart();
		//System.out.println(start);
		List<TObjfw> objfwList=(List<TObjfw>) objfwDAO.getHibernateTemplate().execute(new HibernateCallback() {
			public List<TObjfw>  doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				String sql="select * from t_objfw where objfw_del='no' and objfw_name like '%"+objfwName.trim()+"%'"+" order by objfw_catelog_id limit ?,?";
				SQLQuery query = session.createSQLQuery(sql);
				query.setParameter(0, start);
				query.setParameter(1, pageSize);
				query.addEntity(TObjfw.class);
				return query.list();
			}
		});
		//System.out.println(objfwList==null?"null值":"不是null值");
		pageBean.setList(objfwList);
		request.put("pageBean", pageBean);
		request.put("objfwName", objfwName);
		return ActionSupport.SUCCESS;
	}

	
	
	
	public String pinglunAdd()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		
		TPinglun pinglun=new TPinglun();
		pinglun.setContent(request.getParameter("content"));
		pinglun.setShijian(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		pinglun.setObjfwId(Integer.parseInt(request.getParameter("objfwId")));
		
		pinglunDAO.save(pinglun);
		request.setAttribute("msg", "评论成功");
		return "msg";
	}
	
	public String pinglunAll()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		
		String s="from TPinglun where objfwId="+Integer.parseInt(request.getParameter("objfwId"));
		List pinglunList=pinglunDAO.getHibernateTemplate().find(s);
		request.setAttribute("pinglunList", pinglunList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String pinglunMana()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		
		String s="from TPinglun where objfwId="+Integer.parseInt(request.getParameter("objfwId"));
		List pinglunList=pinglunDAO.getHibernateTemplate().find(s);
		request.setAttribute("pinglunList", pinglunList);
		return ActionSupport.SUCCESS;
	}
	
	public String pinglunDel()
	{
        HttpServletRequest request=ServletActionContext.getRequest();
		
        String s="delete from TPinglun where id="+Integer.parseInt(request.getParameter("id"));
		pinglunDAO.getHibernateTemplate().bulkUpdate(s);
		request.setAttribute("msg", "删除成功");
		return "msg";
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public int getObjfwCatelogId()
	{
		return objfwCatelogId;
	}

	public void setObjfwCatelogId(int objfwCatelogId)
	{
		this.objfwCatelogId = objfwCatelogId;
	}

	public TObjfwDAO getObjfwDAO()
	{
		return objfwDAO;
	}

	public void setObjfwDAO(TObjfwDAO objfwDAO)
	{
		this.objfwDAO = objfwDAO;
	}

	public int getObjfwDijia()
	{
		return objfwDijia;
	}

	public void setObjfwDijia(int objfwDijia)
	{
		this.objfwDijia = objfwDijia;
	}

	public int getObjfwId()
	{
		return objfwId;
	}

	public void setObjfwId(int objfwId)
	{
		this.objfwId = objfwId;
	}

	public String getObjfwMiaoshu()
	{
		return objfwMiaoshu;
	}

	public void setObjfwMiaoshu(String objfwMiaoshu)
	{
		this.objfwMiaoshu = objfwMiaoshu;
	}

	public String getObjfwName()
	{
		return objfwName;
	}

	public void setObjfwName(String objfwName)
	{
		this.objfwName = objfwName;
	}
	
	public String getObjfwArea()
	{
		return objfwArea;
	}

	public void setObjfwArea(String objfwArea)
	{
		this.objfwArea = objfwArea;
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

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	/*public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}*/
	
	

	
}
