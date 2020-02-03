package verbitskiy.services.comparation;

import verbitskiy.DTO.Book;

import java.util.Comparator;

public class CompareByName implements Comparator<Book> {
    @Override
    public int compare(Book o1, Book o2) {
        return o1.getName().compareTo(o2.getName());
    }
}
