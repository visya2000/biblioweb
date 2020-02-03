package verbitskiy.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import verbitskiy.HbmDAO.HbmDAOInterface;
import verbitskiy.DTO.Order;
import verbitskiy.DTO.User;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
    private HbmDAOInterface<User, Integer> userDao;

    @Autowired
    public UserService(HbmDAOInterface userDao) {
        this.userDao = userDao;
    }

    public boolean regUser(String username, String password, String repPassword, String surname, String name, String age, String phone, String email, String permission) {
        verbitskiy.DTO.User user = new verbitskiy.DTO.User();
        if((username != null) &&
                (password != null) &&
                (surname != null) &&
                (name != null) &&
                (permission != null) &&
                (age != null) &&
                (phone != null) &&
                (password.equals(repPassword))) {
            user.setUsername(username);
            user.setPassword(password);
            user.setSurname(surname);
            user.setName(name);
            user.setAge(Integer.parseInt(age));
            user.setPhone(phone);
            user.setEmail(email);
            user.setPermission(permission);
            userDao.save(user);
            return true;
        }
        return false;
    }

    public boolean deleteUser(String username) {
        List<User> users = userDao.getAll();

        for (User user: users) {
            if((user.getUsername().equals(username))) {
                userDao.delete(user);
                return true;
            }
        }
        return false;
    }


    public boolean checkAdmin(HttpSession session) {
        User currentUser = (User) session.getAttribute("user");
        if(currentUser == null)
            return false;
        return currentUser.getPermission().equals("admin");
    }

    public List<Order> getCurrentOrders(HttpSession session) {
        User user = (User) session.getAttribute("user");
        userDao.update(user);
        List<Order> orders = new ArrayList<>();

        for (Order order :
                user.getOrders()) {
            if (!order.getStatus().equals("сдано")) {
                orders.add(order);
            }
        }
        return orders;
    }

    public HttpSession updateSession(HttpSession session) {
        User user = userDao.getById(((User)(session.getAttribute("user"))).getId());
        session.setAttribute("user", user);
        return session;
    }

}

