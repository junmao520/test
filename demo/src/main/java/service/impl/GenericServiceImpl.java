package service.impl;

import dao.GenericDao;
import service.GenericService;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 13-12-5.
 */
public abstract class GenericServiceImpl<E extends Serializable,ID extends Serializable> implements GenericService<E,ID> {
    protected GenericDao<E,ID> genericDao;

    public abstract void setGenericDao(GenericDao<E, ID> genericDao);

    @Override
    public E add(E entity) {
        return genericDao.add(entity);
    }

    @Override
    public List<E> list() {
        return genericDao.list();
    }

    @Override
    public E search(ID id) {
        return genericDao.search(id);
    }

    @Override
    public void modify(E entity) {
        genericDao.modify(entity);
    }

    @Override
    public void remove(ID id) {
        genericDao.remove(id);
    }

    @Override
    public List<E> query(String hql, String[] params, Object[] values) {
        return genericDao.query(hql,params,values);
    }
}
