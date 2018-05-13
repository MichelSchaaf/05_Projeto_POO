
package br.com.fatec.quiz;

public class Question {
    
    private String question;
    private String answer;
    private String alternatives[];
    private int numquest;

    public Question(String question, String answer, String[] alternatives , int numquest) {
        this.question = question;
        this.answer = answer;
        this.alternatives = alternatives;
        this.numquest = numquest;
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

    public String[] getAlternatives() {
        return alternatives;
    }

    public void setAlternatives(String[] alternatives) {
        this.alternatives = alternatives;
    }
    
    public int getNumquest() {
        return numquest;
    }

    public void setNuquest() {
        this.numquest = numquest;
    }    
   
    
}
