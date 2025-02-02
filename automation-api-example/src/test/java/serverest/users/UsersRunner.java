package serverest.users;

import com.intuit.karate.junit5.Karate;

public class UsersRunner {

    @Karate.Test
    Karate testUser() {
        return Karate.run("users-post").relativeTo(getClass());
    }
}
