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

import com.model.TObjfw;

/**
 * Data access object (DAO) for domain model class TObjfw.
 * 
 * @see com.model.TObjfw
 * @author MyEclipse Persistence Tools
 */

public class TObjfwDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TObjfwDAO.class);

	// property constants
	public static final String GOODS_NAME = "objfwName";
	
	public static final String GOODS_AREA = "objfwArea";

	public static final String GOODS_MIAOSHU = "objfwMiaoshu";

	public static final String GOODS_PIC = "objfwPic";

	public static final String GOODS_DIJIA = "objfwDijia";

	public static final String GOODS_CATELOG_ID = "objfwCatelogId";

	public static final String GOODS_USER_ID = "objfwUserId";

	public static final String GOODS_DEL = "objfwDel";

	protected void initDao()
	{
		// do nothing
	}


	
	public void save(TObjfw transientInstance)
	{
		log.debug("saving TObjfw instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TObjfw persistentInstance)
	{
		log.debug("deleting TObjfw instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TObjfw findById(java.lang.Integer id)
	{
		log.debug("getting TObjfw instance with id: " + id);
		try
		{
			TObjfw instance = (TObjfw) getHibernateTemplate().get(
					"com.model.TObjfw", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TObjfw instance)
	{
		log.debug("finding TObjfw instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TObjfw instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TObjfw as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByObjfwName(Object objfwName)
	{
		return findByProperty(GOODS_NAME, objfwName);
	}

	public List findByObjfwArea(Object objfwArea)
	{
		return findByProperty(GOODS_NAME, objfwArea);
	}
	
	public List findByObjfwMiaoshu(Object objfwMiaoshu)
	{
		return findByProperty(GOODS_MIAOSHU, objfwMiaoshu);
	}

	public List findByObjfwPic(Object objfwPic)
	{
		return findByProperty(GOODS_PIC, objfwPic);
	}

	public List findByObjfwDijia(Object objfwDijia)
	{
		return findByProperty(GOODS_DIJIA, objfwDijia);
	}

	public List findByObjfwCatelogId(Object objfwCatelogId)
	{
		return findByProperty(GOODS_CATELOG_ID, objfwCatelogId);
	}

	public List findByObjfwUserId(Object objfwUserId)
	{
		return findByProperty(GOODS_USER_ID, objfwUserId);
	}

	public List findByObjfwDel(Object objfwDel)
	{
		return findByProperty(GOODS_DEL, objfwDel);
	}

	public List findAll()
	{
		log.debug("finding all TObjfw instances");
		try
		{
			String queryString = "from TObjfw";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TObjfw merge(TObjfw detachedInstance)
	{
		log.debug("merging TObjfw instance");
		try
		{
			TObjfw result = (TObjfw) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TObjfw instance)
	{
		log.debug("attaching dirty TObjfw instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TObjfw instance)
	{
		log.debug("attaching clean TObjfw instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TObjfwDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TObjfwDAO) ctx.getBean("TObjfwDAO");
	}
	
	
	public List findGoods(Integer start,Integer length,String sql)
	{
		final String hql=sql;
	
		try {
			final int starts = start;
			final int sizes = length;
			//-------------分页方法
			List list = (List) getHibernateTemplate().executeFind(new HibernateCallback() {
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