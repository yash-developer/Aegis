package aegis.silverwing.com.aegis;

/**
 * Created by admin on 10-Mar-18.
 */

public class Faq {
    private String question;
    private String answer;

    public Faq(){

    }

    public Faq(String question, String answer) {
        this.question = question;
        this.answer = answer;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
