import org.sql2o.*;
import org.junit.*;
import static org.junit.Assert.*;
import java.util.List;

public class ReviewTest {
  private Review review;
  private Review review2;
  private Resource resource;
  private Technology tech;

  @Before
  public void setUp() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/programmer_resource_test", null, null);
    tech = new Technology("Java");
    resource = new Resource("Oracle Documentation",
                        "https://docs.oracle.com/javase/7/docs/api/",
                        "everything you never wanted to know about Java", tech.getId());
    review = new Review("It sucks!", "I can't find anything useful here", 2,
                        "noneofyourbusiness", "nyb@sample.com", resource.getId());
    review2 = new Review("It's great!", "Everything I ever wanted to know", 5,
                        "knowitall", "kia@sample.com", resource.getId());
  }

  @Test
  public void Review_instantiates_true() {
    assertEquals(true, review instanceof Review);
  }

  @Test
  public void Review_instantiatesWithId_true() {
    assertTrue(review.getId() >0);
  }

  @Test
  public void Review_instantiatesWithTitle_true() {
    assertEquals("It sucks!", review.getTitle());
  }

  @Test
  public void Review_instantiatesWithReview_true() {
    assertEquals("I can't find anything useful here", review.getReview());
  }

  @Test
  public void Review_instantiatesWithRating_true() {
    assertEquals(2, review.getRating());
  }

  @Test
  public void Review_instantiatesWithReviewer_true() {
    assertEquals("noneofyourbusiness", review.getReviewer());
  }

  @Test
  public void Review_instantiatesWithEmail_true() {
    assertEquals("nyb@sample.com", review.getEmail());
  }

  @Test
  public void Review_instantiatesWithResourceId_true() {
    assertEquals(resource.getId(), review.getResourceId());
  }

  @Test
  public void Review_returnsAllInstances_true() {
    assertTrue(Review.all().size()>1);
  }

  @Test
  public void Review_returnsAllResourceInstances_true() {
    assertTrue(Review.allByResource(resource.getId()).size()>1);
  }

  @Test
  public void getCountByResource_returnsCount_int() {
    assertEquals(true, Review.getCountByResource(resource.getId())>=2);
  }

  @Test
  public void getAverageByResource_returnsCount_int() {
    assertEquals(3, Review.getAverageByResource(resource.getId()));
  }

  @Test
  public void update_updatesReview() {
    review.update("It sucks!", "I found everything I was looking for here", "noneofyourbusiness", "nyb@sample.com");
    assertEquals("I found everything I was looking for here", Review.findById(review.getId()).getReview());
  }

  @Test
  public void delete_deletesReview_true() {
    int reviewId = review.getId();
    Review.delete(reviewId);
    assertEquals(null, Review.findById(reviewId));
  }
  @After
  public void tearDown() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "DELETE FROM reviews *;";
      con.createQuery(sql).executeUpdate();
    }
  }
}
