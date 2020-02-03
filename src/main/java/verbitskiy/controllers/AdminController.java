package verbitskiy.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import verbitskiy.services.AuthorService;
import verbitskiy.services.BookService;
import verbitskiy.services.ReviewService;
import verbitskiy.services.UserService;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Date;

@Controller
public class AdminController {
    private final UserService userService;
    private final BookService bookService;
    private final ReviewService reviewService;
    private final AuthorService authorService;


    @Autowired
    public AdminController(UserService userService, BookService bookService, ReviewService reviewService, AuthorService authorService) {
        this.userService = userService;
        this.bookService = bookService;
        this.reviewService = reviewService;
        this.authorService = authorService;
    }

    @RequestMapping(value = "/bookEditing", method = RequestMethod.POST)
    public ModelAndView bookEditing(@RequestParam(value = "book_id") Integer bookId,
                                   HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("book", bookService.getById(bookId));
        modelAndView.setViewName("book_editing");

        return modelAndView;

    }

    @RequestMapping(value = "/bookAdding", method = RequestMethod.POST)
    public ModelAndView bookAdding(HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("authors", authorService.getAll());

        modelAndView.setViewName("book_adding");

        return modelAndView;

    }

    @RequestMapping(value = "/authorAdding", method = RequestMethod.POST)
    public ModelAndView authorAdding(HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("author_adding");

        return modelAndView;

    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST)
    public ModelAndView addBook(@RequestParam(value = "name") String name,
                                 @RequestParam(value = "image_link") String imageLink,
                                 @RequestParam(value = "year") Integer year,
                                 @RequestParam(value = "genre_id") Integer genreId,
                                 @RequestParam(value = "author_id") Integer authorId,
                                 @RequestParam(value = "amount") Integer amount,
                                 @RequestParam(value = "description") String description,
                                 HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("book_adding_success", bookService.addBook(name, imageLink, year, genreId, authorId, amount, description));

        modelAndView.setViewName("admin_room");

        return modelAndView;

    }

    @RequestMapping(value = "/addAuthor", method = RequestMethod.POST)
    public ModelAndView addAuthor(@RequestParam(value = "name") String name,
                                  @RequestParam(value = "biography") String biography,
                                  @RequestParam(value = "date_of_birth") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateOfBirth,
                                  @RequestParam(value = "date_of_death") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateOfDeath,
                                HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("author_adding_success", authorService.addAuthor(name, biography, dateOfBirth, dateOfDeath));

        modelAndView.setViewName("admin_room");

        return modelAndView;

    }

    @RequestMapping(value = "/editBook", method = RequestMethod.POST)
    public ModelAndView editBook(@RequestParam(value = "book_id") Integer bookId,
                                 @RequestParam(value = "name") String name,
                                 @RequestParam(value = "image_link") String imageLink,
                                 @RequestParam(value = "year") Integer year,
                                 @RequestParam(value = "genre_id") Integer genreId,
                                 @RequestParam(value = "amount") Integer amount,
                                 @RequestParam(value = "description") String description,
                                    HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("book_edit_success", bookService.editBook(bookId, name, imageLink, year, genreId, amount, description));
        modelAndView.addObject("book", bookService.getById(bookId));


        if(userService.checkAdmin(session)) {
            modelAndView.addObject("admin", true);
        }

        modelAndView.setViewName("book");

        return modelAndView;

    }
}
