package verbitskiy.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import verbitskiy.HbmDAO.HbmDAOInterface;
import verbitskiy.DTO.Review;
import verbitskiy.DTO.User;

@Service
public class ReviewService {
    private HbmDAOInterface<Review, Integer> reviewDao;

    @Autowired
    public ReviewService(HbmDAOInterface<Review, Integer> reviewDao) {
        this.reviewDao = reviewDao;
    }

    private Review getExistedReview(int book_id, int user_id) throws Exception {
        return reviewDao.executeQuery(String.format("from Review where book_id = %d and user_id = %d", book_id, user_id));
    }

    public void addReview(int mark, int book_id, User user, String comments) {
        Review review = new Review();
        review.setMark((float) mark);
        review.setBook_id(book_id);
        review.setUser(user);
        review.setReview(comments);
        Review existedReview = null;
        try {
            existedReview = getExistedReview(book_id, user.getId());
            existedReview.setMark(review.getMark());
            existedReview.setReview(review.getReview());
            reviewDao.update(existedReview);
        } catch (Exception e) {
            reviewDao.save(review);
        }

    }
}
