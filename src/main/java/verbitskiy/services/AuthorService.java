package verbitskiy.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import verbitskiy.HbmDAO.HbmDAOInterface;
import verbitskiy.DTO.Author;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;


@Service
public class AuthorService {
    private final HbmDAOInterface<Author, Integer> authorDao;

    @Autowired
    public AuthorService(HbmDAOInterface<Author, Integer> authorDao) {
        this.authorDao = authorDao;
    }

    public Author getById(int id) {
        return authorDao.getById(id);
    }

    public List<Author> getAll() {
        return authorDao.getAll();
    }

    private LocalDate convertToLocalDate(Date date) {
        Instant instant = Instant.ofEpochMilli(date.getTime());
        LocalDateTime localDateTime = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
        LocalDate localDate = localDateTime.toLocalDate();
        return localDate;
    }

    public boolean addAuthor(String name, String biography, Date dateOfBirth, Date dateOfDeath) {
        Author author = new Author();
        author.setName(name);
        author.setBiography(biography);
        if (dateOfBirth!=null)
            author.setDateOfBirth(convertToLocalDate(dateOfBirth));
        if (dateOfDeath!=null)
            author.setDateOfDeath(convertToLocalDate(dateOfDeath));

        authorDao.save(author);
        return true;
    }
}
