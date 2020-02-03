package verbitskiy.services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import verbitskiy.HbmDAO.HbmDAOInterface;

import java.util.ArrayList;
import java.util.List;

@Service
public class LoginService implements AuthenticationProvider {
    private final static GrantedAuthority GRANTED_AUTHORITY_MANAGER = new SimpleGrantedAuthority("manager");
    private final static GrantedAuthority GRANTED_AUTHORITY_USER = new SimpleGrantedAuthority("user");

    private final HbmDAOInterface<verbitskiy.DTO.User, Integer> userDao;

    private PasswordEncoder passwordEncoder;

    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Autowired
    public LoginService(HbmDAOInterface userDao) {
        this.userDao = userDao;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        UsernamePasswordAuthenticationToken token = null;
        UserDetails userDetails;
        verbitskiy.DTO.User myUser = null;
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        String userLastName = authentication.getPrincipal().toString();
        String userPassword = authentication.getCredentials().toString();
        try {
            String query = String.format("SELECT s FROM User s WHERE s.username = '%s' OR s.email = '%s'", userLastName, userLastName);
            myUser = userDao.executeQuery(query);
            if (myUser != null) {
//          if (!passwordEncoder.matches(userPassword, student.getPassword())) {
                if (!userPassword.equals(myUser.getPassword())) {
                    throw new BadCredentialsException("Invalid Password");
                } else {
                    grantedAuthorities.add(GRANTED_AUTHORITY_MANAGER);
                    userDetails = new User(userLastName, userPassword, true, true, true, true, grantedAuthorities);
                    token = new UsernamePasswordAuthenticationToken(userDetails, userPassword, grantedAuthorities);
                    token.setDetails(myUser);
                }
            } else {
                throw new UsernameNotFoundException("User does not registered");
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            throw new UsernameNotFoundException("Неправильный логин или пароль!");
        }
        return token;
    }



    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }

}
