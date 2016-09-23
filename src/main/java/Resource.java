import org.sql2o.*;
import java.util.List;

public class Resource {
  private int id;
  private String title;
  private String url;
  private String description;
  private int techid;
  private int avgrating;
  private int reviewcount;

  public Resource(String title, String url, String description, int techid) {
    this.title = title;
    this.url = url;
    this.description = description;
    this.techid = techid;
    this.avgrating = 0;
    this.reviewcount = 0;

    try(Connection cn = DB.sql2o.open()) {
      String sql = "INSERT INTO resources (title, url, description, techid, avgrating, reviewcount) VALUES (:title, :url, :description, :techid, :avgrating, :reviewcount)";
      this.id = (int) cn.createQuery(sql, true)
        .addParameter("title", this.title)
        .addParameter("description", this.description)
        .addParameter("url", this.url)
        .addParameter("techid", this.techid)
        .addParameter("avgrating", this.avgrating)
        .addParameter("reviewcount", this.reviewcount)
        .executeUpdate()
        .getKey();
    }
  }
  protected void setAverage(int avg) {
    avgrating = avg;
    try (Connection cn = DB.sql2o.open()) {
      String sql = "UPDATE resources SET avgrating=:avgrating WHERE id=:id";
      cn.createQuery(sql)
        .addParameter("avgrating", avg)
        .addParameter("id", this.id)
        .executeUpdate();
    }
  }

  public int getAverageRating() {
    return avgrating;
  }

  protected void setCount(int count) {
    reviewcount = count;
    try (Connection cn = DB.sql2o.open()) {
      String sql = "UPDATE resources SET reviewcount=:reviewcount WHERE id=:id";
      cn.createQuery(sql)
        .addParameter("reviewcount", count)
        .addParameter("id", this.id)
        .executeUpdate();
    }
  }

  public int getReviewCount() {
    return reviewcount;
  }

  public int getId() {
    return id;
  }

  public String getTitle() {
    return title;
  }

  public String getUrl() {
    return url;
  }

  public String getDescription() {
    return description;
  }

  public int getTechId() {
    return techid;
  }

  public static Resource findById(int id) {
    try(Connection cn = DB.sql2o.open()) {
      String sql = "SELECT * FROM resources WHERE id=:id";
      Resource link = cn.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Resource.class);
      return link;
    }
  }

  public static List<Resource> all() {
    String sql = "SELECT * FROM resources ORDER BY title";
    try(Connection cn = DB.sql2o.open()) {
      return cn.createQuery(sql).executeAndFetch(Resource.class);
    }
  }

  public static List<Resource> allByTech(int id) {
    String sql = "SELECT * FROM resources WHERE techid = :id ORDER BY avgrating DESC";
    try(Connection cn = DB.sql2o.open()) {
      return cn.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetch(Resource.class);
    }
  }

  public static void update(int id, String title, String url, String description) {
    try(Connection cn = DB.sql2o.open()) {
      String sql = "UPDATE resources SET description = :description, title = :title, url = :url WHERE id = :id";
      cn.createQuery(sql)
        .addParameter("title", title)
        .addParameter("url", url)
        .addParameter("description", description)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  public static void delete(int id) {
    try(Connection cn = DB.sql2o.open()) {
      String sql = "DELETE FROM resources WHERE id = :id;";
      cn.createQuery(sql)
      .addParameter("id", id)
      .executeUpdate();
      sql = "DELETE FROM reviews WHERE resourceid = :id;";
      cn.createQuery(sql)
      .addParameter("id", id)
      .executeUpdate();
    }
  }

}
