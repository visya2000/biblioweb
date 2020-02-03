package verbitskiy.HbmDAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.io.Serializable;
import java.util.List;

@Repository
public class HbmDAOImpl<T extends Serializable, PK extends Serializable> implements HbmDAOInterface<T, PK> {
    private Class<T> clazz;

    private SessionFactory sessionFactory;

    @Autowired
    public HbmDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession(){
        return sessionFactory.getCurrentSession();
    }

    public void setEntityClass(Class< T > entityClass) {
        this.clazz = entityClass;
    }

    @Override
    public List<T> getAll() {
        Session session = getCurrentSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery query = builder.createQuery(clazz);
        Root root = query.from(clazz);
        query.select(root);
        List<T> list = session.createQuery(query).getResultList();
        return list;
    }

    @Override
    public T getById(PK id) {
        Session session = getCurrentSession();

        T obj = session.get(clazz, id);
        return obj;
    }

    @Override
    public T executeQuery(String query) {
        Session session = getCurrentSession();
        T o = (T) session.createQuery(query).getSingleResult();
        return o;
    }

    @Override
    public void executeUpdate(String query) {
        Session session = getCurrentSession();
        session.createQuery(query).executeUpdate();
    }

    @Override
    public List<T> executeQueryList(String query) {
        Session session = getCurrentSession();
        List<T> list = session.createQuery(query).getResultList();
        return list;
    }

    @Override
    public T getByName(String name) {
        Session session = getCurrentSession();

        T obj = session.get(clazz, name);
        return obj;
    }

    @Override
    public PK save(T obj) {
        Session session = getCurrentSession();

        PK id = (PK) session.save(obj);
        return id;
    }

    @Override
    public void update(T obj) {
        Session session = getCurrentSession();

        session.update(obj);
    }

    @Override
    public void saveOrUpdate(T obj) {
        Session session = getCurrentSession();

        session.saveOrUpdate(obj);
    }

    @Override
    public void delete(T obj) {
        Session session = getCurrentSession();

        session.delete(obj);
    }

    @Override
    public void clear() {
        Session session = getCurrentSession();

        session.clear();
    }


}
