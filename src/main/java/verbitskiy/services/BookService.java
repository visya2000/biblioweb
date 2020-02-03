package verbitskiy.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import verbitskiy.HbmDAO.HbmDAOInterface;
import verbitskiy.DTO.*;
import verbitskiy.services.comparation.CompareByDate;
import verbitskiy.services.comparation.CompareByMark;
import verbitskiy.services.comparation.CompareByName;

import javax.servlet.http.HttpSession;
import java.util.*;

@Service
public class BookService {
    private final HbmDAOInterface<User, Integer> userDao;
    private final HbmDAOInterface<Book, Integer> bookDao;
    private final HbmDAOInterface<Genre, Integer> genreDao;
    private final HbmDAOInterface<Order, Integer> orderDao;
    private final HbmDAOInterface<Author, Integer> authorDao;

    @Autowired
    public BookService(HbmDAOInterface<User, Integer> userDao, HbmDAOInterface<Book, Integer> bookDao, HbmDAOInterface<Genre, Integer> genreDao, HbmDAOInterface<Order, Integer> orderDao, HbmDAOInterface<Author, Integer> authorDao) {
        this.userDao = userDao;
        this.bookDao = bookDao;
        this.genreDao = genreDao;
        this.orderDao = orderDao;
        this.authorDao = authorDao;
    }


    public List<Book> getAllBooks(String sort) {
        return sortBooks(bookDao.getAll(), sort);
    }

    public Book getById(int id) {
        return bookDao.getById(id);
    }

    public List<Book> getFilteredBooks(String name, int author_id) {
        name = "name = " + name;
        String author = "and author_id = " + author_id;
        return bookDao.executeQueryList(String.format("from Book where %s %s", name, author));
    }

    public List<Book> getGenreBooks(int genre_id, String sort) {
        return sortBooks(bookDao.executeQueryList(String.format("from Book where genre_id = %d", genre_id)), sort);
    }

    public List<Book> getSearched(String search, String sort) {
        return sortBooks(bookDao.executeQueryList(String.format("from Book where name like '%%%s%%'", search)), sort);

    }

    private boolean checkOrders(int userId, int bookId) {
        List<Order> orders = orderDao.getAll();
        for (Order order :
                orders) {
            if (order.getBook().getId() == bookId && order.getUser().getId() == userId && order.getStatus().equals("забронирована")) {
                return true;
            }
        }
        return false;
    }

    public Integer bookReservation(int bookId, User user) {
        Book book = bookDao.getById(bookId);
        if (book.getAmount()>0 && !checkOrders(bookId, user.getId())) {
            Order order = new Order();
            order.setStatus("забронирована");
            order.setBook(book);
            order.setUser(user);

            book.setAmount(book.getAmount()-1);
            bookDao.update(book);

            orderDao.save(order);
            return 1;
        }
        else
            return 0;
    }

    public boolean addBook(String name, String imageLink, int year, int genreId, int authorId, int amount, String description) {
        Book book = new Book();
        book.setName(name);
        book.setImageLink(imageLink);
        book.setYear(year);
        book.setGenre(genreDao.getById(genreId));
        book.setAuthor(authorDao.getById(authorId));
        book.setAmount(amount);
        book.setDescription(description);
        book.setMark(0.0f);

        bookDao.save(book);
        return true;
    }

    public boolean editBook(int book_id, String name, String imageLink, Integer year, int genre_id, int amount, String description) {
        Book book = getById(book_id);
        book.setName(name);
        book.setImageLink(imageLink);
        if(year!=null)
            book.setYear(year);
        book.setGenre(genreDao.getById(genre_id));
        book.setAmount(amount);
        book.setDescription(description);

        bookDao.update(book);
        return true;
    }

    public boolean deleteBook(int bookId) {
        Book book = bookDao.getById(bookId);

        bookDao.delete(book);
        return true;

    }

    public HttpSession cancelReservation(int bookId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        userDao.update(user);
        List<Order> orders = new ArrayList<>();
        for (Order order :
                user.getOrders()) {
            if (order.getBook().getId() == bookId) {
                orderDao.delete(order);
            }
            else {
                orders.add(order);
            }
        }
        Book book = bookDao.getById(bookId);
        book.setAmount(book.getAmount()+1);
        session.setAttribute("user", user);
        return session;
    }

    private List<Book> sortBooks(List<Book> list, String sort) {
        switch (sort) {
            case "alphabet":
                Collections.sort(list, new CompareByName());
                return list;

            case "date":
                Collections.sort(list, new CompareByDate());
                return list;

            case "mark":
                Collections.sort(list, new CompareByMark());

            default:
                return list;
        }
    }

    public List<Order> getAllOrders() {
        return orderDao.getAll();
    }

    public void changeStatus(Integer orderId, String status) {
        Order order = orderDao.getById(orderId);
        if (status.equals("получена")) {
            orderDao.delete(order);
            Book book = order.getBook();
            bookDao.update(book);
            book.setAmount(book.getAmount()+1);
        }
        else {
            order.setStatus(status);
        }

    }


}
