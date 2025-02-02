package serverest.utils;

import net.datafaker.Faker;


public class Utils {

    private static Faker faker = new Faker();

    public static String getRandomName() {
        return faker.name().fullName();
    }

    public static String getRandomEmail() {
        return faker.internet().emailAddress();
    }

    public static String getEmailExists() {
        return "beltrano@qa.com.br";
    }
}
