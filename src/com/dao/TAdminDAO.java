package com.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;

import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TAdmin;

/**
 * Data access object (DAO) for domain model class TAdmin.
 * 继承HibernateDaoSupport实现DAO（spring整合hibernate）
 * @see com.model.TAdmin
 * @author MyEclipse Persistence Tools
 */

public class TAdminDAO extends HibernateDaoSupport {
	//采用log4j来完成调试时的日志功能
	private static final Log log = LogFactory.getLog(TAdminDAO.class);

	// property constants
	public static final String USER_NAME = "userName";

	public static final String USER_PW = "userPw";

	protected void initDao() {
		// do nothing
	}

	public void save(TAdmin transientInstance) {//需要保存的实例
		log.debug("saving TAdmin instance");
		try {
			/*getHibernateTemplate().save(transientInstance);*/
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TAdmin persistentInstance) {//需要删除的实例
		log.debug("deleting TAdmin instance");
		try {//删除特定实例
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TAdmin findById(java.lang.Integer id) {//Integer类型的对象包括了int型的单个域
		log.debug("getting TAdmin instance with id: " + id);
		try {
			TAdmin instance = (TAdmin) getHibernateTemplate().get(
					"com.model.TAdmin", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TAdmin instance) {
		log.debug("finding TAdmin instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TAdmin instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TAdmin as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByUserPw(Object userPw) {
		return findByProperty(USER_PW, userPw);
	}
    
	//返回全部实例
	public List findAll() {
		log.debug("finding all TAdmin instances");
		try {
			String queryString = "from TAdmin";
			return getHibernateTemplate().find(queryString); //通过HibernateTemplate的find方法返回全部实例
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TAdmin merge(TAdmin detachedInstance) {
		log.debug("merging TAdmin instance");
		try {
			TAdmin result = (TAdmin) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TAdmin instance) {
		log.debug("attaching dirty TAdmin instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TAdmin instance) {
		log.debug("attaching clean TAdmin instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TAdminDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TAdminDAO) ctx.getBean("TAdminDAO");
	}
	public List findGoods(Integer start,Integer length,String sql)
	{
		final String hql=sql;
	
		try {
			final int starts = start;
			final int sizes = length;
			//-------------末班的分页方法
			List list =  (List) getHibernateTemplate().executeFind(new HibernateCallback() {
			    public Object doInHibernate(Session session)
			               throws HibernateException, SQLException {
			    	 Query query = session.createQuery(hql);

			            query.setFirstResult(starts);//内部类引用了starts,所以final修饰

			            query.setMaxResults(sizes);

			           List list = query.list();
			             return list ;
			     }
			});
			//----------------------
			 return list;
			} catch (RuntimeException re) {
			throw re;
			}
		
		
	//	return getHibernateTemplate().find(sql);
	}

}