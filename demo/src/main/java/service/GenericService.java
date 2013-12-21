package service;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 13-12-5.
 */
public interface GenericService<E extends Serializable,ID extends Serializable>{
    E add(E entity);
    List<E> list();
    E search(ID id);
    void modify(E entity);
    void remove(ID id);
    List<E> query(String hql, String[] params, Object[] values);
}
