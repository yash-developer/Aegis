package aegis.silverwing.com.aegis;

/**
 * Created by admin on 10-Mar-18.
 */

public class NewsFeed {
    private String title;
    private String description;

    public NewsFeed(){

    }

    public NewsFeed(String title, String description) {
        this.title = title;
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
