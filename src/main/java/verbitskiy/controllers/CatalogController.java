package verbitskiy.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import verbitskiy.DTO.User;
import verbitskiy.services.AuthorService;
import verbitskiy.services.BookService;
import verbitskiy.services.ReviewService;
import verbitskiy.services.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class CatalogController {

    private final UserService userService;
    private final BookService bookService;
    private final ReviewService reviewService;
    private final AuthorService authorService;


    @Autowired
    public CatalogController(UserService userService, BookService bookService, ReviewService reviewService, AuthorService authorService) {
        this.userService = userService;
        this.bookService = bookService;
        this.reviewService = reviewService;
        this.authorService = authorService;
    }


    @RequestMapping(value = "/catalog")
    public ModelAndView catalog(@RequestParam(required = false, value = "genre_id") Integer genreId,
                                @RequestParam(required = false, value = "story") String search,
                                @RequestParam(required = false, value = "sort") String sort,
                                HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        if (sort == null)
            sort = "date";

        if(userService.checkAdmin(session)) {
            modelAndView.addObject("admin", true);
        }


        if (genreId!=null) {
            modelAndView.addObject("list", bookService.getGenreBooks(genreId, sort));
        }
        else if (search!=null) {
            modelAndView.addObject("story", search);
            modelAndView.addObject("list", bookService.getSearched(search, sort));
        } else
            modelAndView.addObject("list", bookService.getAllBooks(sort));



        modelAndView.setViewName("catalog");
        return modelAndView;
    }


    @RequestMapping(value = "/book")
    public ModelAndView book(@RequestParam(value = "book_id") int bookId,
                                   HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        if(userService.checkAdmin(session)) {
            modelAndView.addObject("admin", true);
        }

        modelAndView.addObject("book", bookService.getById(bookId));
        modelAndView.setViewName("book");
        return modelAndView;
    }

    @RequestMapping(value = "/addReview", method = RequestMethod.POST)
    public ModelAndView addReview(@RequestParam(value = "book_id") int bookId,
                                  @RequestParam(value = "mark") int mark,
                                  @RequestParam(value = "comments") String comments,
                             HttpSession session) {

        reviewService.addReview(mark, bookId, (User) session.getAttribute("user"), comments);

        return book(bookId, session);
    }

    @RequestMapping(value = "/author")
    public ModelAndView author(@RequestParam(value = "author_id") int authorId,
                                  HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        if(userService.checkAdmin(session)) {
            modelAndView.addObject("admin", true);
        }

        modelAndView.addObject(authorService.getById(authorId));
        modelAndView.setViewName("author");

        return modelAndView;
    }

    @RequestMapping(value = "/bookReservation", method = RequestMethod.POST)
    public ModelAndView bookReservation(@RequestParam(value = "book_id") int bookId,
                               HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("book_reservation_success", bookService.bookReservation(bookId, (User) session.getAttribute("user")));
        modelAndView.addObject("book", bookService.getById(bookId));
        session = userService.updateSession(session);

        if(userService.checkAdmin(session)) {
            modelAndView.addObject("admin", true);
        }

        modelAndView.setViewName("book");
        return modelAndView;
    }

    @RequestMapping(value = "/bookDeleting", method = RequestMethod.POST)
    public ModelAndView bookDeleting(@RequestParam(value = "book_id") int bookId,
                                        HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("book_deleting_success", bookService.deleteBook(bookId));

        if(userService.checkAdmin(session)) {
            modelAndView.addObject("admin", true);
        }

        modelAndView.addObject("list", bookService.getAllBooks("date"));

        modelAndView.setViewName("catalog");
        return modelAndView;
    }


}
