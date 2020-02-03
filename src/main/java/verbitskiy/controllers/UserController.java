package verbitskiy.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import verbitskiy.DTO.User;
import verbitskiy.services.BookService;
import verbitskiy.services.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    private final UserService userService;
    private final BookService bookService;

    @Autowired
    private AuthenticationManager authManager;

    @Autowired
    public UserController(UserService userService, BookService bookService) {
        this.userService = userService;
        this.bookService = bookService;
    }

    @RequestMapping(value = "/authorization", method = RequestMethod.POST)
    public ModelAndView userAuthorization(@RequestParam(value = "username") String userLastName,
                                          @RequestParam(value = "password") String userPassword,
                                          HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();

        try {
            Authentication authenticationToken = new UsernamePasswordAuthenticationToken(userLastName, userPassword);
            Authentication authentication = authManager.authenticate(authenticationToken);
            List<GrantedAuthority> grantedAuthorities = (List<GrantedAuthority>) authentication.getAuthorities();
            User user = (User) authentication.getDetails();
            SecurityContextHolder.getContext().setAuthentication(authentication);

            session.setAttribute("user", user);

            modelAndView.setViewName("start");
        } catch (AuthenticationException e) {
            modelAndView.addObject("error", e.getMessage());
            modelAndView.setViewName("login");
        }

        return modelAndView;
    }

    @RequestMapping(value = "/regCheck", method = RequestMethod.POST)
    public ModelAndView reg(@RequestParam(value = "username") String username,
                            @RequestParam(value = "password") String password,
                            @RequestParam(value = "rep_password") String rep_password,
                            @RequestParam(value = "surname") String surname,
                            @RequestParam(value = "name") String name,
                            @RequestParam(value = "age") String age,
                            @RequestParam(value = "phone") String phone,
                            @RequestParam(value = "email") String email,
                            HttpSession session) throws Exception {

        ModelAndView modelAndView = new ModelAndView();
        if(userService.regUser(username, password, rep_password, surname, name, age, phone, email,"user")) {

            modelAndView.addObject("regSuccess", 1);
            modelAndView.setViewName("login");
            return modelAndView;
        }

        modelAndView.addObject("wrong", 1);
        modelAndView.addObject("login", username);
        modelAndView.addObject("name", name);
        modelAndView.addObject("surname", surname);
        modelAndView.addObject("age", age);
        modelAndView.addObject("phone", phone);
        modelAndView.addObject("email", email);
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    @RequestMapping(value = "/goToReg")
    public ModelAndView forwardToReg() throws Exception {

        return new ModelAndView("registration");
    }

    @RequestMapping(value = "/goToLogin")
    public ModelAndView forwardToLogin() throws Exception {

        return new ModelAndView("login");
    }

    @RequestMapping(value = "/myLogout", method = RequestMethod.POST)
    public ModelAndView doLogout(HttpSession session) throws Exception  {
        session.setAttribute("user", null);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("list", bookService.getAllBooks("date"));
        modelAndView.setViewName("catalog");
        return modelAndView;
    }

    @RequestMapping(value = "/userRoom")
    public ModelAndView userRoom(HttpSession session) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        if(userService.checkAdmin(session)) {
            modelAndView.addObject("orders", bookService.getAllOrders());
            modelAndView.setViewName("admin_room");
        }
        else {
            modelAndView.addObject("user", session.getAttribute("user"));
            modelAndView.addObject("orders", userService.getCurrentOrders(session));
            modelAndView.setViewName("user_room");
        }

        return modelAndView;
    }

    @RequestMapping(value = "/cancelReservation")
    public ModelAndView cancelReservation(@RequestParam(value = "book_id") Integer bookId,
                                          HttpSession session) throws Exception {

        ModelAndView modelAndView = new ModelAndView();
        session = bookService.cancelReservation(bookId, session);
        session = userService.updateSession(session);

        return userRoom(session);
    }

    @RequestMapping(value = "/changeStatus")
    public ModelAndView changeStatus(@RequestParam(value = "order_id") Integer orderId,
                                     @RequestParam(value = "status") String status,
                                          HttpSession session) throws Exception {

        ModelAndView modelAndView = new ModelAndView();
        bookService.changeStatus(orderId, status);

        return userRoom(session);
    }
}
