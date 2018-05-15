package br.com.fatec.quiz;

import java.util.ArrayList;
import java.util.Collections;

public class Quiz {
    private static ArrayList<Question> test;

    public static ArrayList<Question> getTest(){
        if (test==null){
            test = new ArrayList<>();
            test.add(new Question ("Alemanha","Berlin",new String[]{"Asmara","Berlin","Mônaco"},1));
            test.add(new Question ("Angola","Luanda",new String[]{"Luanda","Manila","Malabo"},2));
            test.add(new Question ("Austrália","Camberra",new String[]{"Camberra","Otava","Jamena"},3));
            test.add(new Question ("Chile","Santiago",new String[]{"Pequin","Santiago","Seul"},4));
            test.add(new Question ("Colônbia","Bogotá",new String[]{"Saraievo","Timbu","Bogotá"},5));  
            test.add(new Question ("Coréia do Sul","Seul",new String[]{"Nicósia","Seul","Pequin"},6));
            test.add(new Question ("Equador","Quito",new String[]{"São José","Quito","Santiago"},7));
            test.add(new Question ("Espanha","Madri",new String[]{"Madri","Santiago","Manila"},8));
            test.add(new Question ("França","Paris",new String[]{"Roma","trípoli","Paris"},9));
            test.add(new Question ("Grácia","Atenas",new String[]{"Mônaco","Atenas","Lima"},10)); 
            // Mistura a lista
            Collections.shuffle(test);
        }
        return test;
    }
}
