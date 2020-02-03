package verbitskiy.HbmDAO;

import java.io.Serializable;
import java.util.List;

public interface HbmDAOInterface<T extends Serializable, PK extends Serializable> {
    T executeQuery(String query);
    void executeUpdate(String query);
    List<T> executeQueryList(String query);
    List<T> getAll();
    T getById(PK id);
    T getByName(String name);
    PK save(T obj);
    void update(T obj);
    void saveOrUpdate(T obj);
    void delete(T obj);
    void clear();
}
