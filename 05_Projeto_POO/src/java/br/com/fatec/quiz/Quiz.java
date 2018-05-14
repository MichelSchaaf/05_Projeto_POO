package br.com.fatec.quiz;

import java.util.ArrayList;
import java.util.Collections;

public class Quiz {
    private static ArrayList<Question> test;

    public static ArrayList<Question> getTest(){
        if (test==null){
            test = new ArrayList<>();
            test.add(new Question ("1+1","2",new String[]{"1","2","3"},1));
            test.add(new Question ("2+1","3",new String[]{"1","2","3"},2));
            test.add(new Question ("5+4","9",new String[]{"9","1","0"},3));
            test.add(new Question ("2+3","5",new String[]{"1","5","2"},4));
            test.add(new Question ("2+2","4",new String[]{"4","2","3"},5));  
            test.add(new Question ("1+8","9",new String[]{"1","9","3"},6));
            test.add(new Question ("2+8","10",new String[]{"10","2","3"},7));
            test.add(new Question ("5+8","13",new String[]{"9","1","13"},8));
            test.add(new Question ("2+9","11",new String[]{"11","5","2"},9));
            test.add(new Question ("2+10","12",new String[]{"4","12","3"},10)); 
            // Mistura a lista
            Collections.shuffle(test);
        }
        return test;
    }
}
