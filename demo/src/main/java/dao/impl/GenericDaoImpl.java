package dao.impl;

import dao.GenericDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by Administrator on 13-12-5.
 */

public class GenericDaoImpl<E extends Serializable,ID extends Serializable> implements GenericDao<E,ID>{

    @Autowired
    private SessionFactory sessionFactory;
    private Class<E> eClass;

    public GenericDaoImpl() {
        this.eClass = (Class<E>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    @Override
    public E add(E entity) {
        Session session=sessionFactory.openSession();
        session.save(entity);
        session.close();
        return entity;
    }

    @Override
    public List<E> list() {
        Session session = sessionFactory.openSession();
        List<E> list=session.createQuery("from "+eClass.getName())
                .list();
        session.close();
        return list;
    }

    @Override
    public E search(ID id) {
        Session session = sessionFactory.openSession();
        E entity = (E) session.get(eClass,id);
        session.close();
        return entity;
    }

    @Override
    public void modify(E entity) {
        Session session = sessionFactory.openSession();
        session.update(entity);
        session.flush();
        session.close();
    }

    @Override
    public void remove(ID id) {
        Session session = sessionFactory.openSession();
        session.delete(search(id));
        session.flush();
        session.close();
    }

    @Override
    public List<E> query(String hql, String[] params, Object[] values) {
        Session session = sessionFactory.openSession();
        Query query= session.createQuery(hql);
        if(params!=null){
            for (int i = 0; i < params.length; i++) {
                String param = params[i];
                Object value = values[i];
                query.setParameter(param,value);
            }
        }
        List<E> list = query.list();
        session.close();
        return list;
    }
}
