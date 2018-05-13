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
            test.add(new Question ("1+1","2",new String[]{"1","2","3"},6));
            test.add(new Question ("2+1","3",new String[]{"1","2","3"},7));
            test.add(new Question ("5+4","9",new String[]{"9","1","0"},8));
            test.add(new Question ("2+3","5",new String[]{"1","5","2"},9));
            test.add(new Question ("2+2","4",new String[]{"4","2","3"},10)); 
            // Mistura a lista
            
        }
        return test;
    }
}
