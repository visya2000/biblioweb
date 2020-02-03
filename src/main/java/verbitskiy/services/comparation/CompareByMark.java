package verbitskiy.services.comparation;

import verbitskiy.DTO.Book;

import java.util.Comparator;

public class CompareByMark implements Comparator<Book> {
    @Override
    public int compare(Book o1, Book o2) {
        return Math.round(o2.getMark()*20 - o1.getMark()*20);
    }
}
