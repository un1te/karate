package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {
    public static String getRandomEmail(){
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100) + "@test.com";
        return email;
    }

    public static String getRandomUser(){
        Faker faker = new Faker();
        String user = faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100);
        return user;
    }

    public static String getArticleName(){
        Faker faker = new Faker();
        String article = faker.country().capital() + faker.beer().name();
        return article;
    }
}
