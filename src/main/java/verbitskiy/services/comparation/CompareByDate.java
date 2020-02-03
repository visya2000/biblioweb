package verbitskiy.services.comparation;

import verbitskiy.DTO.Book;

import java.util.Comparator;

public class CompareByDate implements Comparator<Book> {
    @Override
    public int compare(Book o1, Book o2) {
        return o2.getId() - o1.getId();
    }
}
